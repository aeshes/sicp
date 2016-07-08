#!/usr/bin/racket
#lang scheme

; The procedure square-list takes a list of numbers as arguments
; and returns a list of the square of those numbers. Here are two different
; definitions of square-list. Complete both of them by filling in the missing expressions.

(define (square-list items)
	(if (null? items)
		'()
		(cons (* (car items) (car items))
		      (square-list (cdr items)))))

(define (square-list-mapped items)
	(map (lambda (x) (* x x)) items))

(display (square-list (list 1 2 3 4 5)))
(newline)

(display (square-list-mapped (list 1 2 3 4 5)))
(newline)

