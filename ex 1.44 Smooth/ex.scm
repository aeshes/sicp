#!/usr/bin/racket
#lang racket

(define (square x) (* x x))

; Composition of one-argument functions f and g
; (f, g) -> f(g(x))
(define (compose f g)
	(lambda (x) (f (g x))))

; N-fold function application
(define (repeated func times)
	(if (= times 1)
		func
		(compose func (repeated func (- times 1)))))

(define (smooth f dx)
	(define (average x y z) (/ (+ x y z) 3))
	(lambda (x) (average (f (- x dx))
			     (f x)
			     (f (+ x dx)))))

(define (n-fold-smooth func dx times)
	((repeated (lambda (g) (smooth g dx)) times) func))


(display (square 4))
(newline)

(display ((smooth square 0.5) 4))
(newline)

(display ((n-fold-smooth square 0.5 4) 4))
(newline)