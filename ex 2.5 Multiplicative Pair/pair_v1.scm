#!/usr/bin/racket
#lang scheme

(define (divide-by number base)
        (if (= (remainder number base) 0)
                (divide-by (/ number base) base)
                number))

(define (make-pair x y)
        (* (expt 2 x) (expt 3 y)))

(define (select-x pair)
        (let ((power-of-two (divide-by pair 3)))
                (/ (log power-of-two) (log 2))))

(define (select-y pair)
        (let ((power-of-three (divide-by pair 2)))
                (/ (log power-of-three) (log 3))))


; Testing

(define pair (make-pair 2 3))

(display (select-x pair))
(newline)

(display (select-y pair))
(newline)
