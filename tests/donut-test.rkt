#lang racket

(require rackunit
         "../donut.rkt")

;; take/crude
(check-equal? (take/crude (range 10) 20) (range 10))
(check-equal? (take/crude (range 10) 5) (range 5))
(check-exn exn:fail:contract? (lambda ()
                                (take/crude (range 9) -1)))
(check-exn exn:fail:contract? (lambda ()
                                (take/crude (range 9) 1/2)))

;; take-right/crude
(check-equal? (take-right/crude (range 10) 20) (range 10))
(check-equal? (take-right/crude (range 10) 5) (range 5 10))
(check-exn exn:fail:contract? (lambda ()
                                (take-right/crude (range 9) -1)))
(check-exn exn:fail:contract? (lambda ()
                                (take-right/crude (range 9) 1/2)))

;; drop/crude
(check-equal? (drop/crude (range 10) 20) '())
(check-equal? (drop/crude (range 10) 5) (range 5 10))
(check-exn exn:fail:contract? (lambda ()
                                (drop/crude (range 9) -1)))
(check-exn exn:fail:contract? (lambda ()
                                (drop/crude (range 9) 1/2)))

;; drop-right/crude
(check-equal? (drop-right/crude (range 10) 20) '())
(check-equal? (drop-right/crude (range 10) 5) (range 5))
(check-exn exn:fail:contract? (lambda ()
                                (drop-right/crude (range 9) -1)))
(check-exn exn:fail:contract? (lambda ()
                                (drop-right/crude (range 9) 1/2)))

;; on
(check-equal? (sort '((1 2 3) (1) (1 2)) (on < length)) '((1) (1 2) (1 2 3)))
(check-equal? (sort '(1 5 7 4 2) <) (sort '(1 5 7 4 2) (on < identity)))

;; cleave
(check-equal? (cleave 0 (make-list 10 add1)) 10)
(check-equal? (cleave 10 (make-list 10 sub1)) 0)
