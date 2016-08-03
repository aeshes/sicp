#!/usr/bin/racket
#lang scheme

(define (enumerate-tree tree)
        (cond ((null? tree) null)
                ((not (pair? tree)) (list tree))
                (else (append (enumerate-tree (car tree))
                              (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
        (if (null? sequence)
                initial
                (op (car sequence)
                    (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
        (accumulate + 0 (map (lambda(x) 1)
                             (enumerate-tree tree))))

; Test
(define tree (list 1 (list 2 (list 3 4) 5) 6))

(display (count-leaves tree))
(newline)