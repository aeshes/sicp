#!/usr/bin/racket
#lang scheme

(define (make-point x y)
	(cons x y))

; Returns x-coordinate
(define (x-point point)
	(car point))

; Returns y-coordinate
(define (y-point point)
	(cdr point))

; Creates a line segment from two points p and q
(define (make-segment p q)
	(cons p q))

; Returns point p of a line segment from point p to point q
(define (start-segment seg)
	(car seg))

(define (end-segment seg)
	(cdr seg))

(define (midpoint-segment seg)
	(define (average a b) (/ (+ a b) 2))
	(cons (average (x-point (start-segment seg))
		       (x-point (end-segment seg)))
	      (average (y-point (start-segment seg))
		       (y-point (end-segment seg)))))

(define (print-point p)
	(display "(")
	(display (x-point p))
	(display ", ")
	(display (y-point p))
	(display ")")
	(newline))

(define segment (make-segment
			(make-point -2 -2)
			(make-point 2 2)))

(print-point (midpoint-segment segment))
