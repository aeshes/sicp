#!/usr/bin/racket
#lang racket

(define tolerance 0.00001)

; calculate fixed point of a function
(define (fixed-point f first-guess)
        (define (close-enough? v1 v2)
                (< (abs (- v1 v2)) tolerance))
        (define (try guess)
                (let ((next (f guess)))
                        (if (close-enough? guess next)
                                next
                                (try next))))
        (try first-guess))

; average of a and b
(define (average a b)
        (/ (+ a b) 2))

; average between x and f(x)
(define (average-damp func)
        (lambda(x) (average x (func x))))

; square root based on the idea of average damping:
; we seek fixed point not of a function f(x), but of a function x + f(x)
(define (sqrt x)
        (fixed-point (average-damp (lambda(y) (/ x y)))
                     1.0))

(display (sqrt 16))
(newline)
