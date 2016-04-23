#!/usr/bin/racket
#lang racket

(define (identity a) a)
(define (inc a) (+ a 1))
(define (square a) (* a a))
(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

(define (filtered-accumulate a b combiner null-value term next filter)
	(if (> a b)
		null-value
		(if (filter a)
			(combiner (term a)
				  (filtered-accumulate (next a) b combiner null-value
						        term next filter))
			(combiner null-value
				  (filtered-accumulate (next a) b combiner null-value
						        term next filter)))))
; omptimized bruteforce primarity test
; checking only odd numbers up to [sqrt(n)]
(define (fast-prime? n)
	(define (smallest-divisor n)
		(define (find-divisor n test-divisor)
			(define (next x)
				(if (= x 2) 3 (+ x 2)))
			(define (divides? a b)
				(= (remainder b a) 0))
			(cond ((> (square test-divisor) n) n)
				((divides? test-divisor n) test-divisor)
				(else (find-divisor n (next test-divisor)))))
		(find-divisor n 2))
	(= n (smallest-divisor n)))



; sum of consequent even numbers
(define (sum-of-evens from to)
	(filtered-accumulate from to + 0
                             identity inc even?))

; sum of squared primes
(define (sum-of-squared-primes from to)
	(filtered-accumulate 2 10 + 0
                             square inc fast-prime?))

; product of coprimes with n
(define (product-of-coprimes n)
	(define (coprime? i)
		(= 1 (gcd i n)))
	(filtered-accumulate 1 n * 1
			     identity inc coprime?))


; sum of even numbers from 1 to 10
(display (sum-of-evens 1 10))
(newline)

; sum of squared primes from 2 to 10
(display (sum-of-squared-primes 2 10))
(newline)

; product of coprimes with 10
(display (product-of-coprimes 10))
(newline)
