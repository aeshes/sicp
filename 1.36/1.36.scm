#!/usr/bin/racket
#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
        (define (close-enough? v1 v2)
                (< (abs (- v1 v2)) tolerance))
        (define (try guess)
                (display guess)
                (newline)
                (let ((next (f guess)))
                        (if (close-enough? guess next)
                                next
                                (try next))))
        (try first-guess))

; x^x = 1000
; log x^x = log 1000
; x log x = log 1000
; x = (log 1000) / (log x)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)

(display "Testing:")
(newline)
(display (expt 4.555532270803653 4.555532270803653))
(newline)
(display (expt 4.555537551999825 4.555537551999825))
(newline)