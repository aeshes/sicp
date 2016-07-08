#!/usr/bin/racket
#lang scheme

; Louise Reasoner tries to rewrite the first sqaure-list procedure of Exercise 2.21
; so that it evolves an iterative process:

;(define (square-list items)
;    (define (iter things answer)
;        (if (null? things)
;            answer
;            (iter (cdr things)
;                  (cons (square (car things))
;                        answer))))
;    (iter items nil))

; Unfortunately, defining square-list this way produced the answer list in the reverse
; order of the one desired. Why?
; Louis then tries to fix this bug by interchanging the arguments to cons:

;(define (square-list items)
;    (define (iter things answer)
;        (if (null? things)
;            answer
;            (iter (cdr things)
;                 (cons answer
;                        (square (car things))))))
;    (iter items nil))

(define (square x) (* x x))

; List reversing
(define (reverse ls)
	(define (iter xs result)
		(if (null? xs)
			result
			(iter (cdr xs)
			      (cons (car xs) result))))
	(iter ls '()))

; Correct program uses idiom push-n-reverse
(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			(reverse answer)
			(iter (cdr things)
				(cons (square (car things))
				answer))))
	(iter items '()))

(display (square-list (list 1 2 3 4 5)))
(newline)
