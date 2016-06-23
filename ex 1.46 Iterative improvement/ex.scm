#!/usr/bin/racket
#lang scheme

(include "iter_improve.scm")
(include "func.scm")

; iterative-improve is defined if iter_improve.scm
; other functions see in func.scm
(define (sqrt arg)
	((iterative-improve
		(lambda (guess)
			(< (abs (- (square guess) arg)) 0.001))
		(lambda (guess)
			(average guess (/ arg guess))))
	1.0))

; find fixed point of a function
(define (fixed-point f guess)
	((iterative-improve
		(lambda (guess)
			(< (abs (- (f guess) guess)) 0.001))
		(lambda (guess)
			(f guess)))
	guess))


(display (sqrt 16))
(newline)

(display (sqrt 4))
(newline)

; calculate golden ratio
(display (fixed-point
		(lambda (x)
			(+ 1 (/ 1 x)))
		1.0))
(newline)
