#!/usr/bin/racket
#lang scheme

; Procedural implementation of cons operator.
; Returns procedure that take one argument: 0 or 1
; corresponging first or second element in pair
(define (make-pair x y)
	(lambda (select)
		(cond ((= select 0) x)
		      ((= select 1) y)
		      (else (error "make-pair: argument is not 0 or 1")))))

; Car implementation
(define (select-x pair)
	(pair 0))

; Cdr implementation
(define (select-y pair)
	(pair 1))

(define pair (make-pair 1 2))

(display (select-x pair))
(newline)

(display (select-y pair))
(newline)
