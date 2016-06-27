#!/usr/bin/racket
#lang scheme

(define (make-pair x y)
        (* (expt 2 x) (expt 3 y)))

(define (select-x pair)
        (if (= (remainder pair 2) 0)
                (+ 1 (select-x (/ pair 2)))
                0))

(define (select-y pair)
        (if (= (remainder pair 3) 0)
                (+ 1 (select-y (/ pair 3)))
                0))


; Testing

(define (test x y)
        (let ((pair (make-pair x y)))
                (display (select-x pair))
                (newline)
                (display (select-y pair))
                (newline)))

(test 2 3)
(test 0 0)
