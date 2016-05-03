#! /usr/bin/racket
#lang racket

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

; implementation of sum func using accumulate
; (recursive accumulate)
(define (sum a b)
	(accumulate a b + 0 (lambda (x) x) 
						(lambda (x) (+ x 1))))

; implementation of product func using accumulate
; (iterative accumulate)
(define (product a b)
	(accumulate-iter a b * 1 (lambda (x) x)
							 (lambda (x) (+ x 1))))

; sum all naturals in [1..10] (recursive accumulate)
(sum 1 10)
(newline)

; multiply all naturals in [1..10] (iterative accumulate)
(product 1 10)
(newline)