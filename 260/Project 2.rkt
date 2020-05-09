
#lang scheme
;2016400195
(define (check_string a b) (if (string=? a b) #t #f))
(define (TRANSPORTATION-COST somefarm) (transs somefarm FARMS))
(define (transs somefarm listt)(if (not(equal? listt '()))



                                    
                                   (if (equal? somefarm (caar listt)) (cadar listt) (transs somefarm (cdr listt)))


                                   "" 

                                  
                                    
                                       
                                       ))
(define (AVAILABLE-CROPS somefarm) (crops somefarm FARMS))
(define (crops somefarm listt) (if (not(equal? listt '()))



                                    
                                   (if (equal? somefarm (caar listt)) (caddar listt) (transs somefarm (cdr listt)))


                                   (display '())
                                       ))
(define (INTERESTED-CROPS someperson) (interestedmon someperson CUSTOMERS))
(define (interestedmon someperson listt)(if (not(equal? listt '()))



                                    
                                   (if (equal? someperson (caar listt)) (caddar listt) (interestedmon someperson (cdr listt)))


                                   (display '())
                                       ))
 (define (CONTRACT-FARMS someperson) (display(contract someperson CUSTOMERS)))
 (define (contract someperson listt) (if (not(equal? listt '()))



                                    
                                   (if (equal? someperson (caar listt)) (cadar listt) (contract someperson (cdr listt)))


                                   (display '())
                                       ))
(define (append list1 list2)
        (if (null? list1) list2
            (cons (car list1) (append (cdr list1) list2))))
(define (member? x list)
     (if (null? list) #f                                
         (if (equal? x (car list)) #t                   
              (member? x (cdr list))))) 
(define (CONTRACT-WITH-FARM somefarm) ( display(checkcontract somefarm CUSTOMERS)))
(define (checkcontract somefarm listt) ( ;func:
                                        if (not(null? listt))
                                           (if (member somefarm (cadar listt))
                                              (append (list (caar listt))  (checkcontract somefarm (cdr listt)))
                                              (checkcontract somefarm (cdr listt))
                                              )
                                           (list )
                                        )

  )
(define (INTERESTED-IN-CROP somecrop) (display(whoiscrop somecrop CUSTOMERS)) )
(define (whoiscrop somecrop listt)(
                                   if(not(null? listt))
                                     (if (member somecrop (caddar listt))
                                         (append (list (caar listt)) (whoiscrop somecrop (cdr listt)))
                                         (whoiscrop somecrop (cdr listt))
                                         )
                                     (list )
                                     )
  )
(define (min x y) (if (< x y) x y ))
(define (MIN-SALE-PRICE somecrop) (if (equal? 999 (bulmin somecrop CROPS))
                                      0
                                      (bulmin somecrop CROPS)))
(define (bulmin somecrop listt) (
                                 if( not(null? listt))
                                        (if (equal? somecrop (caar listt))
                                            (min (caddar listt) (bulmin somecrop (cdr listt)))
                                            
                                            (bulmin somecrop (cdr listt) )
                                            ;(if(> (bulmin somecrop (cdr listt) min) (caddar listt))
                                            ;  (caddar listt)
                                            ; (bulmin somecrop (cdr listt) min)
                                            ;)
                                            ;(bulmin somecrop (cdr listt) min)
                                            )
                                        
                                        999
                                        
                                   )
  

  )
(define (max x y) (if(> x y) x y))
(define (check x y a) (and (equal? x (min x a)) (equal? y (max y a) )))
(define (CROPS-BETWEEN x y) (display(between x y CROPS)))
(define (between x y listt) (if (not(null? listt))
                                (if (check x y (caddar listt))
                                    (append (list (caar listt)) (between x y (cdr listt)))
                                    (between x y (cdr listt))

                                    )
                                (list )
                             
                                )
  )
(define (BUY-PRICE someperson somecrop) (if (equal? (recursion someperson somecrop CROPS) 999) 0 (recursion someperson somecrop CROPS)))
(define (recursion someperson somecrop listt) ( if (not(null? listt))
                                                   (if (and (equal? somecrop (caar listt)) (member (cadar listt) (contract someperson CUSTOMERS)) )
                                                       (min (+ (TRANSPORTATION-COST (cadar listt)) (caddar listt)) (recursion someperson somecrop (cdr listt)))
                                                       (recursion someperson somecrop (cdr listt))
                                                       )
                                                   999
                                                   )
  )
 (define (TOTAL-PRICE someperson) (recursivesum someperson (INTERESTED-CROPS someperson) ) )
(define (recursivesum someperson listt) (
                                         if(not(null? listt))
                                           (+ (BUY-PRICE someperson (car listt)) (recursivesum someperson (cdr listt)))
                                           0

                                         )
  )
