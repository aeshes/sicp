#!/usr/bin/racket
#lang racket

; calculate fixed point of a function
(define (fixed-point f first-guess)
        (define tolerance 0.000001)
        (define (close-enough? v1 v2)
                (< (abs (- v1 v2)) tolerance))
        (define (try guess)
                (let ((next (f guess)))
                        (if (close-enough? guess next)
                                next
                                (try next))))
        (try first-guess))

; calculate derivative
(define (deriv g)
        (define dx 0.000001)
        (lambda (x)
                (/ (- (g (+ x dx)) (g x))
                   dx)))

; for given g(x) returns x - g(x) / Dg(x)
(define (newton-transform g)
        (lambda (x)
                (- x (/ (g x)
                        ((deriv g) x)))))

; calculate zero  of equation g(x) = 0
(define (newtons-method g guess)
        (fixed-point(newton-transform g) guess))

; square of an argument
(define (square x) (* x x))

;Main logic: square root based on calculating zero of a function y^2 - x = 0
(define (sqrt x)
        (newtons-method (lambda (y) (- (square y) x)) 1.0))

(display (sqrt 9))
(newline)