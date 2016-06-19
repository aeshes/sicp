#!/usr/bin/racket
#lang racket

(define (inc x) (+ x 1))
(define (square x) (* x x))

; Composition of one-argument functions f and g
; (f, g) -> f(g(x))
(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated func times)
	(if (= times 1)
		func
		(compose func (repeated func (- times 1)))))

(display ((repeated inc 5) 5))
(newline)

(display ((repeated square 2) 5))
(newline)