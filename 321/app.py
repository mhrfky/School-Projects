from flask import Flask, redirect, url_for, render_template, request, session
import mysql.connector
import re
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
)
cursor = mydb.cursor()
cursor.execute("USE dbtify_sqltest;")
mydb.commit()
app = Flask(__name__)
app.secret_key = "hello there"

@app.route("/")
def home():
    return render_template("base.html")
#_______________________________________________________________________________________________________________________
#logging stuff__________________________________________________________________________________________________________
#_______________________________________________________________________________________________________________________
@app.route("/listenerlogin" , methods = ['GET','POST'])
def listenerlogin():
    if request.method == 'POST':
        session["user"] = request.form["nm"]
        session["email"] = request.form["email"]
        checkElseAddForListeners(session["user"],session["email"])
        return redirect(url_for("user"))
    else:
        if "user" in session or "name" in session:
            return redirect((url_for("user")))
        return render_template("listenerlogin.html" )
@app.route("/artistlogin" , methods = ['GET','POST'])
def artistlogin():
    if request.method == 'POST':
        session["name"] = request.form["nm"]
        session["surname"] = request.form["srnm"]
        checkElseAddForartists(session["name"],session["surname"])
        return redirect(url_for("user"))
    else:
        if "user" in session or "name" in session:
            return redirect((url_for("user")))
        return render_template("artistlogin.html" )
@app.route("/logout")
def logout():
    if "user" in session:
        session.pop("user",None)
        session.pop("email", None)
        session.pop("sorted", None)
    elif "name" in session:
        session.pop("name",None)
        session.pop("surname",None)
    return redirect(url_for("listenerlogin" ))

#_______________________________________________________________________________________________________________________
#artist stuff___________________________________________________________________________________________________________
#_______________________________________________________________________________________________________________________
@app.route("/album<someValue>")
def album(someValue):
    cursor.execute("SELECT title, genre FROM albums WHERE id = %s",(someValue,))
    checkUp = cursor.fetchall()
    if len(checkUp) == 0:
        return redirect(url_for("listenerlogin" ))
    cursor.execute("SELECT a.id, a.title,GROUP_CONCAT(a.cname) FROM (SELECT a.id, a.title, CONCAT(b.name,' ',b.surname) as cname FROM (SELECT a.id, a.title FROM songs a,(SELECT songid FROM songof WHERE albumid = %s) b WHERE a.id = b.songid) a, contribute b WHERE b.songid = a.id) a GROUP BY id", (someValue,))
    temp = cursor.fetchall()
    print(temp)
    return render_template("album.html", data = temp, albumid = someValue, albumtitle = checkUp[0][0], genre = checkUp[0][1])
@app.route("/song<id>-<title>-<albumid>",methods = ['GET','POST'])
def song(id,title,albumid):
    cursor.execute("SELECT GROUP_CONCAT(a.cname) FROM (SELECT songid, CONCAT(name,' ',surname) as cname FROM contribute WHERE songid = %s) a GROUP BY songid",(id,))
    temp = cursor.fetchall()
    if request.method == 'POST':
        if request.form['options'] == "delete":
            cursor.execute("DELETE FROM songs WHERE id = %s",(id,))
            cursor.execute("DELETE FROM songof WHERE songid = %s", (id,))
            cursor.execute("DELETE FROM contribute WHERE songid = %s", (id,))
            mydb.commit()
            checkIfAlbumEmpty(albumid)
            return redirect(url_for("album", someValue = albumid))
        else:
            title = request.form['title']
            name = request.form['name']
            print("test", name)
            name = name.split(",")
            cursor.execute("UPDATE songs SET title = %s WHERE id = %s",(title,id))
            cursor.execute("DELETE FROM contribute WHERE songid = %s", (id,))
            if name[0] == "":
                name = {"none none"}
            print(name)
            p = re.compile("\s*(\S+)\s(\S+)\s*")
            for con in name:
                m = p.search(con)
                cName = m.group(1)
                cSurname = m.group(2)
                cursor.execute("INSERT INTO contribute(name,surname,songid) VALUES(%s,%s,%s)",
                               (cName, cSurname, id))
                mydb.commit()
            ##cursor.execute("UPDATE contribute SET name = %s, surname = %s WHERE songid = %s",(name,surname,id))
            mydb.commit()
            return redirect(url_for("album", someValue = albumid))
    else:
        return render_template("song.html", id = id,title = title, contr = temp )
@app.route("/deletealbum<albumid>" ,methods = ['GET'])
def deletealbum(albumid):
    cursor.execute("DELETE FROM albums WHERE id = %s",(albumid,))
    cursor.execute("DELETE FROM songof WHERE albumid = %s", (albumid,))
    mydb.commit()
    return redirect(url_for("user"))

@app.route("/updatealbum<albumid>" ,methods = ['GET','POST'])
def updatealbum(albumid):
    if request.method == 'POST':
        title = request.form['title']
        genre = request.form['genre']
        cursor.execute("UPDATE albums SET title = %s ,genre = %s WHERE id = %s", (title, genre, albumid))
        mydb.commit()
        return redirect(url_for("album", someValue=albumid))
    else:
        cursor.execute("SELECT title, genre FROM albums WHERE id = %s", (albumid,))
        checkUp = cursor.fetchall()
        return render_template("updateAlbum.html", title = checkUp[0][0], genre = checkUp[0][1] )

@app.route("/addSong<albumid>" ,methods = ['GET','POST'])
def addSong(albumid):
    if request.method == 'POST':

        title = request.form["title"]
        cursor.execute("INSERT INTO songs(title) VALUES(%s)", (title,))
        mydb.commit()
        cursor.execute("SELECT MAX(id) FROM songs ")
        songid = cursor.fetchall()
        cursor.execute("INSERT INTO songof(name,surname,albumid,songid) VALUES(%s,%s,%s,%s)",(session["name"], session["surname"], albumid, songid[0][0]))
        mydb.commit()
        name = request.form["name"]
        if name == "none":
            name += " none"
        name = name.split(',')
        p = re.compile("\s*(\S+)\s(\S+)\s*")
        for con in name:
            m = p.search(con)
            cName = m.group(1)
            cSurname = m.group(2)
            cursor.execute("INSERT INTO contribute(name,surname,songid) VALUES(%s,%s,%s)",
                           (cName, cSurname, songid[0][0]))
            mydb.commit()

        return redirect(url_for("album", someValue = albumid))
    else:
        return render_template("addSong.html")

@app.route("/test<someValue>")
def test(someValue):
    print(someValue)
    return render_template("user.html" )
@app.route("/user", methods = ['GET','POST'])
def user():

    if "user" in session:
        user = session["user"]
        session["sorted"] = 0
        cursor.execute("SELECT * FROM newer_bigger_view a INNER JOIN (SELECT id FROM liked WHERE username = %s) b on a.id = b.id",(user,))
        temp = cursor.fetchall()
        return render_template("user.html" ,data = temp)
    elif "name" in session:

        name = session["name"]
        surname = session["surname"]

        cursor.execute("SELECT DISTINCT title, genre, id FROM albums a right join songof  b on a.id = b.albumid WHERE b.name = %s AND b.surname = %s", (name, surname));
        temp = cursor.fetchall()
        print("testing: ",temp)

        return render_template("artist.html", albums = temp)
    else:
        return redirect((url_for("listenerlogin")))

@app.route("/addalbum", methods = ['GET','POST'])
def addalbum():

    if request.method == 'POST':
        temp = request.form
        print(temp)
        addAlbumtoDB(temp)
        return redirect(url_for("user"))
    else:
        if  not "user" in session and not "name" in session:
            return redirect((url_for("artistlogin")))
        return render_template("add_Album.html")
#_______________________________________________________________________________________________________________________
#user stuff_____________________________________________________________________________________________________________
#_______________________________________________________________________________________________________________________

@app.route("/viewsongs")
def viewsongs():
    session["sorted"] = 0
    cursor.execute("SELECT * FROM newer_bigger_view")
    temp = cursor.fetchall()
    cursor.execute("SELECT id FROM liked WHERE username = %s",(session["user"],))
    liked = cursor.fetchall()
    return render_template("viewsongs.html", data = temp, liked = liked)

@app.route("/viewsongssorted")
def sortedviewsongs():
    cursor.execute("SELECT * FROM newer_bigger_view ORDER BY likes DESC")
    temp = cursor.fetchall()
    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    session["sorted"] = 1

    return render_template("viewsongs.html", data=temp, liked=liked, sorted=session["sorted"] )


@app.route("/viewalbum<albumid>sorted")
def viewalbumsorted(albumid):
    session["sorted"] = 1
    cursor.execute("SELECT * FROM newer_bigger_view WHERE albumid = %s ORDER BY likes DESC",(albumid,))
    temp = cursor.fetchall()
    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    return render_template("viewalbum.html", data = temp,liked=liked, sorted=session["sorted"])
@app.route("/viewalbum<albumid>")
def viewalbum(albumid):
    session["sorted"] = 0
    cursor.execute("SELECT * FROM newer_bigger_view WHERE albumid = %s",(albumid,))
    temp = cursor.fetchall()
    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    return render_template("viewalbum.html", data=temp, liked=liked, sorted=session["sorted"])
@app.route("/likealbum<albumid>")
def likealbum(albumid):
    cursor.execute("SELECT * FROM likedalbums where username = %s and albumid = %s", (session["user"], albumid))
    temp = cursor.fetchall()
    if len(temp) == 0:
        cursor.execute("INSERT INTO likedalbums(username,albumid) VALUES(%s,%s)", (session["user"], albumid))
    else:
        cursor.execute("DELETE FROM likedalbums WHERE username = %s and albumid = %s", (session["user"], albumid))
        cursor.execute("INSERT INTO likedalbums(username,albumid) VALUES(%s,%s)", (session["user"], albumid))
    mydb.commit()
    if session["sorted"]:
        return redirect("viewalbum"+str(albumid) + "sorted")
    else:
        return redirect("viewalbum"+str(albumid))
@app.route("/viewartist<name>-<surname>")
def viewartist(name,surname):
    session["sorted"] = 0
    cursor.execute("SELECT * FROM newer_bigger_view WHERE name = %s AND surname = %s",(name,surname))
    temp = cursor.fetchall()

    cursor.execute("SELECT * FROM newer_bigger_view a INNER JOIN (SELECT songid FROM contribute WHERE name =%s AND surname = %s) b ON b.songid = a.id", (name, surname))

    cont = cursor.fetchall()


    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    cursor.callproc('findContributors', [name, surname])
    for result in cursor.stored_results():
        contrs = result.fetchall()
    return render_template("viewartist.html", data=temp, liked=liked, sorted=session["sorted"],contrs = contrs,cont = cont)
@app.route("/viewartist<name>-<surname>sorted")
def viewartistsorted(name,surname):
    session["sorted"] = 1
    cursor.execute("SELECT * FROM newer_bigger_view WHERE name = %s AND surname = %s"
                   " ORDER BY likes DESC",(name,surname))
    temp = cursor.fetchall()
    cursor.execute(
        "SELECT * FROM newer_bigger_view a INNER JOIN (SELECT songid FROM contribute WHERE name =%s AND surname = %s) b ON b.songid = a.id ORDER BY likes DESC", (name, surname))
    cont = cursor.fetchall()

    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    cursor.callproc('findContributors', [name, surname])
    for result in cursor.stored_results():
        contrs = result.fetchall()
    return render_template("viewartist.html", data=temp, liked=liked, sorted=session["sorted"], contrs=contrs,cont = cont)
@app.route("/viewgenre<genre>")
def viewgenre(genre):
    session["sorted"] = 0

    cursor.execute("SELECT * FROM newer_bigger_view WHERE genre = %s", (genre,))
    temp = cursor.fetchall()
    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    return render_template("viewgenre.html", data=temp, liked=liked, genre = genre)

@app.route("/<songid>like<link>")
def like(songid,link):

    likeUnlike(songid)

    if session["sorted"]:
        return redirect(link + "sorted")
    else:
        return redirect(link)


@app.route("/viewalbums")
def viewalbums():
    session["sorted"] = 0
    cursor.execute("SELECT albumid,album,genre,name,surname,sum(likes) as 'likedy' FROM bigger_view group by album")
    temp = cursor.fetchall()

    return render_template("viewalbums.html", data = temp)

@app.route("/viewalbumssorted")
def viewalbumssorted():
    session["sorted"] = 1
    cursor.execute("SELECT albumid,album,genre,name,surname,sum(likes) as 'likedy' FROM bigger_view group by album order by likedy desc ")
    temp = cursor.fetchall()

    return render_template("viewalbums.html", data = temp,sorted=session["sorted"])

@app.route("/viewartists")
def viewartists():
    session["sorted"] = 0
    cursor.execute("SELECT albumid,album,genre,name,surname,sum(likes) as 'likedy' FROM bigger_view group by name,surname")
    temp = cursor.fetchall()

    return render_template("viewartists.html", data = temp,sorted=session["sorted"])
@app.route("/viewartistssorted")
def viewartistssorted():
    session["sorted"] = 1
    cursor.execute("SELECT albumid,album,genre,name,surname,sum(likes) as 'likedy' FROM bigger_view group by name,surname order by likedy desc ")
    temp = cursor.fetchall()

    return render_template("viewartists.html", data = temp,sorted=session["sorted"])
@app.route("/others")
def viewothers():
    session["sorted"] = 0

    cursor.execute("SELECT username FROM listeners")
    temp = cursor.fetchall()
    temp.remove((session["user"],))

    return render_template("others.html", data=temp)
@app.route("/viewother<username>")
def viewother(username):

    session["sorted"] = 0
    cursor.execute(
        "SELECT * FROM newer_bigger_view a INNER JOIN (SELECT id FROM liked WHERE username = %s) b on a.id = b.id",
        (username,))
    temp = cursor.fetchall()
    return render_template("viewother.html", data=temp)
@app.route("/search", methods = ['GET','POST'])
def search():
    session["sorted"] = 0

    if request.method == 'POST':
        keyword = request.form["keyword"]
        return redirect(url_for("searchresults",keyword = keyword))
    else:
        return render_template("search.html")
@app.route("/searchresults<keyword>")
def searchresults(keyword):
    session["sorted"] = 0

    cursor.execute("SELECT * FROM newer_bigger_view WHERE title LIKE %s ", ("%" + keyword + "%",))
    temp = cursor.fetchall()
    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    return render_template("searchresults.html",data=temp,liked = liked,keyword = keyword)
#_______________________________________________________________________________________________________________________
#Helpful functions______________________________________________________________________________________________________
#_______________________________________________________________________________________________________________________
def checkIfAlbumEmpty(albumid):
    cursor.execute("SELECT COUNT(albumid) FROM songof WHERE albumid = %s",(albumid,))
    count = cursor.fetchall()
    if count[0][0] == 0:
        cursor.execute("DELETE FROM albums WHERE id = %s", (albumid,))
        mydb.commit()
    else:
        return


def checkElseAddForListeners(username,email):
    cursor.execute("SELECT * FROM listeners WHERE username = %s AND email = %s", (username, email));
    temp = cursor.fetchone()

    if  temp == None:
        cursor.execute("INSERT INTO listeners(username,email) VALUES(%s,%s)", (username, email))
        mydb.commit()
    else:
        return

def checkElseAddForartists(name,surname):
    cursor.execute("SELECT * FROM artists WHERE name = %s AND surname = %s", (name, surname));
    temp = cursor.fetchone()
    print(name, surname)
    if  temp == None:
        cursor.execute("INSERT INTO artists(name,surname) VALUES(%s,%s)", (name, surname))
        mydb.commit()
    else:
        return

def addAlbumtoDB(temp):
    length = len(temp)
    title = temp["title"]
    genre = temp["genre"]
    cursor.execute("INSERT INTO albums(title,genre) VALUES(%s,%s)", (title, genre))
    mydb.commit()
    cursor.execute("SELECT MAX(id) FROM albums ")
    albumid = cursor.fetchall()

    name = temp["name"]
    cNames = temp["contributor name"]
    if cNames == "none":
        cNames += " none"
    cNames = cNames.split(", ")
    cursor.execute("INSERT INTO songs(title) VALUES(%s)", (name,))
    mydb.commit()
    cursor.execute("SELECT MAX(id) FROM songs ")
    songid = cursor.fetchall()
    cursor.execute("INSERT INTO songof(name,surname,albumid,songid) VALUES(%s,%s,%s,%s)",
                   (session["name"], session["surname"], albumid[0][0], songid[0][0]))

    p = re.compile("\s*(\S+)\s(\S+)\s*")
    print(temp)
    for con in cNames:
        m = p.search(con)
        cName = m.group(1)
        cSurname = m.group(2)
        cursor.execute("INSERT INTO contribute(name,surname,songid) VALUES(%s,%s,%s)", (cName, cSurname, songid[0][0]))
        mydb.commit()
    for i in range(int((len(temp) - 4)/2)):
        name = temp["name" + str(i)]
        cNames = temp["contributor name" + str(i)]
        if cNames == "none":
            cNames += " none"
        cNames = cNames.split(", ")
        cursor.execute("INSERT INTO songs(title) VALUES(%s)", (name,))
        mydb.commit()
        cursor.execute("SELECT MAX(id) FROM songs ")
        songid = cursor.fetchall()
        cursor.execute("INSERT INTO songof(name,surname,albumid,songid) VALUES(%s,%s,%s,%s)",
                       (session["name"],session["surname"], albumid[0][0], songid[0][0]))
        for con in cNames:
            m = p.search(con)
            cName = m.group(1)
            cSurname = m.group(2)
            cursor.execute("INSERT INTO contribute(name,surname,songid) VALUES(%s,%s,%s)",
                           (cName, cSurname, songid[0][0]))
        mydb.commit()


def likeUnlike(songid):
    cursor.execute("SELECT id FROM liked WHERE username = %s", (session["user"],))
    liked = cursor.fetchall()
    if not (int(songid),) in liked :
        cursor.execute("INSERT INTO liked(username,id) VALUES(%s,%s)",(session["user"],songid))
    else:
        cursor.execute("DELETE FROM liked WHERE username = %s AND id = %s", (session["user"], songid))
    mydb.commit()


if __name__ == "__main__":
    app.run(debug=True)