#!/usr/bin/racket
#lang scheme

; Ex. 2.18. Define a procedure reverse that takes a list as argument and returns a list
; of the same elements in reverse order: 

(define (reverse xs)
	(define (iter items result)
		(if (null? items)
			result
			(iter (cdr items) (cons (car items) result))))
	(iter xs '()))

(display (reverse (list 1 2 3 4 5 6 7)))
(newline)
