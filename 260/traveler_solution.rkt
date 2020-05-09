#lang scheme
; compiling: yes
; complete: no because i couldn't do the railwaynetwork i also can not do travel expense so the total expense but other than that every method is complete
; and also i could not comment every part because it is hard and unfortunately i have no time 
; ABDULLAH COŞKUN 2014400159




(define (RAILWAY-CONNECTION cityname); Railway connection method
  (Railway-connection-last LOCATIONS cityname)
  )
(define (Railway-connection-last ListTot cityname);I use flatten1 method which i implement it only reduce one paranthesis
  (let*([name cityname] [ListTemp (flatten1 ListTot)])
                       (RAILWAY-CONNECTION1 ListTemp name)
    )
  )
(define (RAILWAY-CONNECTION1 ListTot cityname)
  (let([name cityname] ) 
    (cond
      [(null? ListTot)'()]
      [(not(eq? name (car ListTot))) (RAILWAY-CONNECTION1 (rest ListTot) cityname)];card-color((cdr card) name
      [else (third ListTot)];after i find cityname after that third one is railwayconnection
      )
    
   ; name
  )
  )
(define (afterList ListTot cityname)
  (let*([name cityname] [ListTemp (flatten1 ListTot)])
                       (afterList2 ListTemp name)
    )
  )
(define (afterList2 ListTot cityname)
  (let([name cityname] ) 
    (cond
      [(not(eq? name (car ListTot))) (afterList2 (rest ListTot) cityname)];card-color((cdr card) name
      [else (second ListTot)];cityname
      )
    
   ; name
  )
  )
(define (ACCOMMODATION-COST cityname);accommodation cost method beginning
  (Accomodation-cost-last LOCATIONS cityname))
(define (Accomodation-cost-last ListTot cityname)
  (let*([name cityname] [ListTemp (flatten1 ListTot)])
                       (ACCOMODATION-COST1 ListTemp name)
    )
  )
(define (ACCOMODATION-COST1 ListTot cityname)
  (let([name cityname] ) 
    (cond
      [(null? ListTot)'()]
      [(not(eq? name (car ListTot))) (ACCOMODATION-COST1 (rest ListTot) cityname)]
      [else (second ListTot)];after i find cityname second one is accommodation cost
      )
  )
  )
(define (INTERESTED-CITIES cityname);interested cities method beginning don't mind its name is city name it is actually person name
  (Intersted-cities-last TRAVELERS cityname))
(define (Intersted-cities-last ListTot cityname)
  (let*([name cityname] [ListTemp (flatten1 ListTot)])
                       (INTERESTED-CITIES1 ListTemp name)
    )
  )
(define (INTERESTED-CITIES1 ListTot cityname)
  (let([name cityname] ) 
    (cond
      [(null? ListTot)'()]
      [(not(eq? name (car ListTot))) (INTERESTED-CITIES1 (rest ListTot) cityname)]
      [else (second ListTot)];after person name second one is interested cities
      )
  )
  )
(define (INTERESTED-ACTIVITIES cityname);interested activities method beginning
  (Intersted-activities-last TRAVELERS cityname))
(define (Intersted-activities-last ListTot cityname)
  (let*([name cityname] [ListTemp (flatten1 ListTot)])
                       (INTERESTED-ACTIVITIES1 ListTemp name)
    )
  )
(define (INTERESTED-ACTIVITIES1 ListTot cityname)
  (let([name cityname] ) 
    (cond
      [(null? ListTot)'()]
      [(not(eq? name (car ListTot))) (INTERESTED-ACTIVITIES1 (rest ListTot) cityname)]
      [else (third ListTot)]
      )
  )
  )
(define (HOME cityname);home method beginning
  (HomeDumb TRAVELERS cityname))
(define (HomeDumb ListTot cityname)
  (let*([name cityname] [ListTemp (flatten1 ListTot)])
                       (HOME1 ListTemp name)
    )
  )
                     
(define (HOME1 ListTot cityname)
  (let([name cityname]  ) 
    (cond
      [(not(eq? name (car ListTot))) (HOME1 (rest ListTot) cityname)];card-color((cdr card) name
      [else (fourth ListTot)];cityname
      )
  )
  )
(define (TRAVELER-FROM cityname);Traveler from beginning
  (TRAVELER-FROM1 TRAVELERS cityname)
  )
(define rest cdr)
(define (TRAVELER-FROM1 ListTot cityname)
  (let*([name cityname] [ListTemp (flatten1 ListTot)] [ListTemp2 (reverse ListTemp)])
    
                       (traveler-from ListTemp2 name)
    )
  )
(define (traveler-from ListTot cityname)
  (let([name cityname]  ) 
    (cond
      [(null? ListTot)'()]
      [(not(eq? name (car ListTot))) (traveler-from (rest ListTot) cityname)];card-color((cdr card) name
      [else (cons (fourth ListTot) (traveler-from (rest ListTot) cityname))];(fourth ListTot)
      )
  )
  )
(define (INTERESTED-IN-CITY cityname);interested in city beginning
  (INTERESTED-IN-CITY2 TRAVELERS cityname)
  )
(define (INTERESTED-IN-CITY2 ListTot cityname)
  (let ([allnames (names ListTot)])
    (interested3 allnames cityname)
    )
  )
(define (interested3 allnames cityname)
  (cond
    [(null? allnames) '()]
    [(not(contains? (INTERESTED-CITIES(car allnames)) cityname)) (interested3 (rest allnames) cityname)]
    [else (cons(first allnames) (interested3(rest allnames) cityname))]
    
    )
  )
(define (INTERESTED-IN-ACTIVITY cityname);interested in activity beginning
  (INTERESTED-IN-ACTIVITY2 TRAVELERS cityname)
  )
(define (INTERESTED-IN-ACTIVITY2 ListTot cityname)
  (let ([allnames (names ListTot)])
    (interesteda3 allnames cityname)
    )
  )
(define (interesteda3 allnames cityname)
  (cond
    [(null? allnames) '()]
    [(not(contains? (INTERESTED-ACTIVITIES(car allnames)) cityname)) (interesteda3 (rest allnames) cityname)]
    [else (cons(first allnames) (interesteda3(rest allnames) cityname))]
    
    )
  )
(define (ACCOMMODATION-EXPENSES name cityname);accommodation expense beginning
  (accommodationexpenses2 LOCATIONS name cityname)
  )
(define (accommodationexpenses2 ListTot name cityname)
  (cond
    [(eq? cityname (HOME name)) '0]
    [(not(contains? (INTERESTED-IN-CITY cityname) name)) (ACCOMMODATION-COST cityname) ]
    [else (* 3 (ACCOMMODATION-COST cityname))
     ]
    )
  )
(define (IN-BETWEEN num1 num2);in between method beginning
  (IN-BETWEEN1 (cities LOCATIONS) num1 num2)
  )
(define (IN-BETWEEN1 List num1 num2)
  (let([List1 List])
    (cond
      [(null? List) '()]
      [(and (>= (ACCOMMODATION-COST(car List)) num1) (<= (ACCOMMODATION-COST(car List)) num2)) (cons(first List) (IN-BETWEEN1(rest List) num1 num2 ))   ]
      [else (IN-BETWEEN1(rest List) num1 num2 )]
      )
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;some intermediate methods most of them created for railway-network but some of them are essential in other part
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (names ListTot)
  (let([ListTemp (flatten1 ListTot)])
    (names2 ListTemp)))
(define (names2 ListTot)
  (cond
    [(null? ListTot)'()]
    [else (cons(first ListTot) (names2 (rest(rest(rest(rest ListTot))))))]
  )
  )
(define (contains? l i)
  (if (empty? l) #f
      (or (eq? (first l) i) (contains? (rest l) i))))
(define three (lambda (L target1 target2 target3 sum)
    (cond
        ((= target1 0) (three L (car L) (cadr L) (caddr L) 0))
        ((null? L) (= (- sum (+ target1 (+ target2 target3))) (+ target1 (+ target2 target3))))  ; sum minus targets = targets
        (else (three (cdr L) target1 target2 target3 (+ sum (car L))))       ; return true if branch returns true
)))
(define (accomcities)
  (cities LOCATIONS)
  )
(define (cities ListTot)
  (let([ListTemp (flatten1 ListTot)])
    (cities2 ListTemp)))
(define (cities2 ListTot)
  (cond
    [(null? ListTot)'()]
    [else (cons(first ListTot) (cities2 (rest(rest(rest(rest ListTot))))))]
  )
  )
(define (travilingcitieslast)
  (flatten(travilingcities (accomcities))))
(define (travilingcities ListTot)
  (cond
    [(null? ListTot)'()]
    [else (cons(flatten(RAILWAY-CONNECTION(first ListTot))) (travilingcities (rest ListTot)))]
  )
  )


(define (flatten1 x)
  (cond ((null? x) '())
        ((pair? x) (append (flatten12 (car x)) (flatten1 (cdr x))))
        (else (list x))))
(define firs car)
(define (flatten12 x)
  list x)
(define LOCATIONS
'(
(newyork 100 (ohio indiana newjersey) (theatre concert opera))
(california 120 (washington utah) (theatre))
(ohio 75 (newyork indiana newjersey) (concert))
(moscow 95 () (concert opera))
(paris 150 (nice cannes) (concert opera))
(copenhagen 95 (nuenen) (theatre concert opera))
(texas 80 (utah illinois indiana) (theatre concert))
(cambridge 90 (cork london nuenen brussels) (theatre))
(brussels 90 (london cambridge nuenen paris vienna) (theatre concert opera))
(newjersey 100 (ohio newyork) (theatre concert))))  
(define TRAVELERS
'(
(john (ohio texas) (theatre concert opera) newyork)
(james (texas ohio copenhagen) (theatre concert opera) newjersey)
(richard (cambridge ohio texas) (theatre concert) california)
(alan (california ohio) () cambridge)
(mary (california) (concert) cambridge)
(ingrid (moscow ohio texas) (opera) brussels)))

