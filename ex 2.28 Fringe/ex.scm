#!/usr/bin/racket
#lang scheme

(define (fringe tree)
	(cond ((null? tree) '())
	      ((not (pair? tree)) (list tree))
	      (else (append (fringe (car tree))
						(fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))

(display (fringe x))
(newline)

(display (fringe (list x x 9)))
(newline)
