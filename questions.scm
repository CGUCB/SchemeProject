(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  'replace-this-line)


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  (define (enumerate_index lst index)
      (if (null? lst)
          '()
          (cons (list index (car lst)) (enumerate_index (cdr lst) (+ index 1)))
          )
    )
    (enumerate_index s 0)
  )

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  (cond
    ((null? list1) list2)
    ((null? list2) list1)
    ((comp (car list1) (car list2)) (cons (car list1) (cons (car list2) (merge comp (cdr list1) (cdr list2)))))
    ((comp (car list2) (car list1)) (cons (car list2) (cons (car list1) (merge comp (cdr list1) (cdr list2)))))
    (else (cons (car list1) (merge comp (cdr list1) list2)))
      )
  )
  


;; Problem 17

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr) expr)
        ((quoted? expr) expr)
        ((or (lambda? expr)
             (define? expr))
         (let ((form (car expr))
                (params (cadr expr))
                (body (cddr expr)))
           ; BEGIN PROBLEM 17
           'replace-this-line
           ; END PROBLEM 17
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
           'replace-this-line
           ; END PROBLEM 17
           ))
        (else (cons (car expr) (map let-to-lambda (cdr expr))))))

