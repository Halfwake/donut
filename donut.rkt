#lang racket/base

(provide take/crude
         take-right/crude
         drop/crude
         drop-right/crude
         on
         cleave)

(require racket/function
         racket/list)

(define (take/crude lst n)
  (if (< (length lst) n)
      lst
      (take lst n)))
      

(define (take-right/crude lst n)
  (if (< (length lst) n)
      lst
      (take-right lst n)))

(define (drop/crude lst n)
  (if (< (length lst) n)
      '()
      (drop lst n)))

(define (drop-right/crude lst n)
  (if (< (length lst) n)
      '()
      (drop-right lst n)))

(define (on compare transform)
  (lambda (a b)
    (compare (transform a)
             (transform b))))

(define (cleave val funcs)
  (for/fold ([val val])
            ([func funcs])
    (func val)))
