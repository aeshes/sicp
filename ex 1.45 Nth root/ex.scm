#!/usr/bin/racket
#lang scheme

(include "fixed_point.scm")
(include "avg_damp.scm")
(include "repeated.scm")

(define (cube x) (* x x x))

(define (quad-root x)
	(fixed-point
		((repeated average-damp 2)
			(lambda (y) (/ x (expt y 3))))
	1.0))

(define (nth-root x degree)
	(define (mylog2 n) (/ (log n) (log 2)))
	(define damp-times (floor (mylog2 degree)))
	(fixed-point
		((repeated average-damp damp-times)
			(lambda (y) (/ x (expt y (- degree 1)))))
	1.0))
	

(display (quad-root 16))
(newline)

(display (nth-root 256 8))
(newline)
