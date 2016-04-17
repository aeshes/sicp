#! /usr/bin/racket
#lang racket

; Exercise 1.32 asks us to show how sum and product are special cases of an even more
; abstract concept called accumulate that combines a collection of terms. We're given
; the following procedure signature to start with:

; (accumulate combiner null-value term a next b)

; The arguments term, a, next, and b serve the same purpose as they did in sum and product.
; The new arguments are combiner, which takes a procedure of two arguments that specifies
; how the current term should be combined with the accumulation of all the preceding terms, 
; and null-value, which specifies what base value to use when the terms run out.

; Recursive version of accumulate
(define (accumulate a b combiner null-value term next)
	(if (> a b)
		null-value
		(combiner (term a)
			  (accumulate (next a) b combiner null-value term next))))

; Iterative version of accumulate
(define (accumulate-iter a b combiner null-value term next)
		(define (iter a result)
			(if (> a b)
				result
				(iter (next a) (combiner result
							 (term a)))))
		(iter a null-value))

; Revised using recursive accumulate
(define (sum a b term next)
	(accumulate a b + 0 term next))

; Revised using recursive accumulate
(define (product a b term next)
	(accumulate a b * 1 term next))

; Revised using iterative accumulate
(define (sum-iter a b term next)
	(accumulate-iter a b + 0 term next))

; Revised using iterative accumulate
(define (product-iter a b term next)
	(accumulate-iter a b * 1 term next))

(define (identity n) n)

(define (inc n) (+ n 1))



(display (sum 1 10 identity inc))
(newline)
(display (sum-iter 1 10 identity inc))
(newline)
 
(display (product 1 10 identity inc))
(newline)
(display (product-iter 1 10 identity inc))
(newline)
