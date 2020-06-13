;; Exercise 2.17

;; Solution 1

(require threading)

(define (last-pair lst)
  (~> lst
      reverse
      car))
      
;; Solution 2

(define (last-pair lst)
  (list-ref lst (- (length lst) 1)))
  
;; Solution 3 

(define (last-pair lst)
  (if (null? (cdr lst))
      (car lst)
      (last-pair (cdr lst))))

;; Exercise 2.18

(define (reverse lst)
  (define (iter lst acc)
    (if (null? lst)
        acc
        (iter (cdr lst) (cons (car lst) acc))))
  (iter lst '()))
  
;; Exercise 2.20

(define (same-parity x . xs)
  (filter (λ (n) (= (remainder x 2)
                    (remainder n 2)))
          xs))

;; > (same-parity 1 1 2 3 4 5)
;; '(1 3 5)
;; > (same-parity 2 1 2 3 4 5)
;; '(2 4)

;; Exercise 2.21

(define (sq x) (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (sq (car items))
            (square-list (cdr items)))))

(define (square-list2 items)
  (map sq items))

;; Exercise 2.23

;; this fails :(
(define (for-each1 proc lst)
  (if (null? lst)
      (λ (x) (x))
      ((proc (car lst))
       (for-each proc (cdr lst)))))

;; this prints a #t at the end :(
(define (for-each2 proc lst)
  (cond ((null? lst) #t)
        (else (proc (car lst))
              (for-each proc (cdr lst)))))

;; this works
(define (for-each proc lst)
  (cond ((null? (cdr lst)) (proc (car lst)))
        (else (proc (car lst))
              (for-each proc (cdr lst)))))