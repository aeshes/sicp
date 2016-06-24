#!/usr/bin/racket
#lang scheme

; Euclid's Algorithm
; !!! Negative value may be returned
(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

; Signum function
(define (sign x)
	(if (= x 0)
		0
		(/ x (abs x))))

; Make rational number numer/denom
(define (make-rat numer denom)
	(let ((g (gcd (abs numer)
		      (abs denom))))
		(cons (/ (* numer (sign denom)) g)
		      (/ (abs denom) g))))

; Returns numerator of rational number
(define (numer x)
	(car x))

; Returns denominator of rational number
(define (denom x)
	(cdr x))

; Print rat. number
(define (print-rat x)
	(display (numer x))
	(display "/");
	(display (denom x))
	(newline))

; Addition
(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
		     (* (denom x) (numer y)))
		  (* (denom x) (denom y))))

; Substraction
(define (sub-rat x y)
        (make-rat (- (* (numer x) (denom y))
                     (* (denom x) (numer y)))
                  (* (denom x) (denom y))))

; Multiplication
(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
		  (* (denom x) (denom y))))

; Division
(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
		  (* (denom x) (numer y))))

; Testing
(define x (make-rat 1 -3))
(define y (make-rat -1 -6))

; Must be -2
(print-rat (div-rat x y))

; Must be -1/18
(print-rat (mul-rat x y))

(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat -1 -2))
