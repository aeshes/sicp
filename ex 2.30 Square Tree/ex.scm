#!/usr/bin/racket
#lang scheme

(define (square x) (* x x))

(define (square-tree tree)
	(cond ((null? tree) '())
	      ((not (pair? tree)) (square tree))
	      (else (cons (square-tree (car tree))
			  (square-tree (cdr tree))))))

(define (square-tree-map tree)
	(map (lambda(sub-tree) (cond ((not (pair? sub-tree)) (square sub-tree))
				     (else (square-tree-map sub-tree))))
	     tree))


(display (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))))
(newline)

(display (square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))))
(newline)
