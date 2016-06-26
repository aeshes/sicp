#!/usr/bin/racket
#lang scheme

(define (make-point x y)
        (cons x y))

; Returns x-coordinate
(define (x-point point)
        (car point))

; Returns y-coordinate
(define (y-point point)
        (cdr point))

(define (make-rect top-left bottom-right)
	(cons top-left bottom-right))

; Rectangle selectors
(define (rect-width rect)
	(abs (- (x-point (cdr rect))
		(x-point (car rect)))))

(define (rect-height rect)
        (abs (- (y-point (cdr rect))
                (y-point (car rect)))))

; Area
(define (rect-area rect)
	(* (rect-width rect)
	   (rect-height rect)))

; Perimeter
(define (rect-perimeter rect)
	(* 2 (+ (rect-width rect)
		(rect-height rect))))


(define rect (make-rect (make-point 0 2)
			(make-point 2 0)))

(display (rect-area rect))
(newline)

(display (rect-perimeter rect))
(newline)
