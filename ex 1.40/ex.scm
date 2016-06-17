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


; Solution for ex. 1.40

(define (square x) (* x x))
(define (cube   x) (* x x x))

; Creates the cubic t^3 + at^2 + bt + c with given a, b, c
(define (cubic a b c)
	(lambda (t) (+  (cube t)
					(* a (square t))
					(* b t)
					c)))

; Find a zero of the specific cubic x^3 - 14x^2 + 21x + 36 = (x + 1)(x - 12)(x - 3)
(display (newtons-method (cubic -14 21 36) 1.0))
(newline)