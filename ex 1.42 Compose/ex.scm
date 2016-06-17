#!/usr/bin/racket
#lang racket

(define (inc x) (+ x 1))
(define (square x) (* x x))

; Composition of one-argument functions f and g
; (f, g) -> f(g(x))
(define (compose f g)
        (lambda (x) (f (g x))))

(display ((compose square inc) 6))
(newline)
