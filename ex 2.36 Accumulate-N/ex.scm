#!/usr/bin/racket
#lang scheme

(define (accumulate op init seq)
        (if (null? seq)
                init
                (op (car seq) (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
        (if (null? (car seqs))
                '()
                (cons (accumulate   op init (map car seqs))
                      (accumulate-n op init (map cdr seqs)))))

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

; Demonstration of how mapcar and mapcdr works
(display (map car x))
(newline)

(display (map cdr x))
(newline)

; Solving the task
(display (accumulate-n + 0 x))
(newline)
