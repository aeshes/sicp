#!/usr/bin/racket
#lang scheme

; Function make-pair takes a function of two arguments.
; This function f takes the values of x and y passed to make-pair.
; Function f is implemented in such way that it returns
; one of its arguments, i.e. x or y.
(define (make-pair x y)
	(lambda (f)
		(f x y)))

(define (select-x pair)
	(pair (lambda (p q) p)))

(define (select-y pair)
	(pair (lambda (p q) q)))


; Testing

(define pair (make-pair 1 2))

(display (select-x pair))
(newline)

(display (select-y pair))
(newline)

(display (select-x (make-pair 7 49)))
(newline)
