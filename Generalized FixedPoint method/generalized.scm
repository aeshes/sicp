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
;
;
; Util functions are defined here
;
;
; average of a and b
(define (average a b)
	(/ (+ a b) 2))

; average between x and f(x)
(define (average-damp func)
	(lambda(x) (average x (func x))))

; squaring
(define (square x) (* x x))

; calculate derivative of a function g
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


;
;
; Main logic
;
;
; General idea of a fixed point method
; g - function for which we eant to find its zero
; transform - transformation which is performed on the function
; guess - starting value in the process of approximation
(define (fixed-point-of-transform g transform guess)
	(fixed-point (transform g) guess))

;
; Calculating sqrt using generalized function for finding fixed-point of a transform
;
(define (sqrt-avg-damp x)
	(fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))

(define (sqrt-newton x)
	(fixed-point-of-transform (lambda (y) (- (square y) x))
					newton-transform
					1.0))

(display (sqrt-avg-damp 9))
(newline)

(display (sqrt-newton 9))
(newline)