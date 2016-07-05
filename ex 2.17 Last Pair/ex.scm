#!/usr/bin/racket
#lang scheme

; Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:
; Example:
; (last-pair (list 23 72 149 34))
; (34)

; Fails for empty list
(define (last-pair xs)
	(if (null? (cdr xs))
		xs
		(last-pair (cdr xs))))

; Correctly works with empty list
(define (last-pair-iter xs)
	(define (iter items result)
		(if (null? items)
			result
			(iter (cdr items) (car items))))
	(iter xs xs))

(define x (list 1 2 3 4 5 6 7))

(display (last-pair x))
(newline)

(display (last-pair-iter x))
(newline)

(display (last-pair-iter '()))
(newline)
