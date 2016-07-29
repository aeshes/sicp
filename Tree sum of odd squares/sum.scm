#!/usr/bin/racket
#lang scheme

(define (square x) (* x x))

(define (sum-odd-squares tree)
	(cond ((null? tree) 0)
	      ((not (pair? tree))
			(if (odd? tree) (square tree) 0))
	      (else (+ (sum-odd-squares (car tree))
		       (sum-odd-squares (cdr tree))))))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(display (sum-odd-squares x))
(newline)
