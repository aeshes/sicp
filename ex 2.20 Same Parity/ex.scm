#!/usr/bin/racket
#lang scheme

; write a procedure same-parity that takes one or more integers and returns a list
; of all the arguments that have the same even-odd parity as the first argument. 
; For example,
; (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)

; (same-parity 2 3 4 5 6 7)
; (2 4 6)

; List reversing
(define (reverse ls)
        (define (iter xs result)
                (if (null? xs)
                        result
                        (iter (cdr xs) (cons (car xs) result))))
        (iter ls '()))

(define (same-parity a . xs)
        (let ((parity (if (odd? a) odd? even?)))
                (define (iter items result)
                        (if (null? items)
                                (reverse result)
                                (iter (cdr items)
                                        (if (parity (car items))
                                                (cons (car items) result)
                                                result))))
                (iter xs (list a))))


; Testing
(display (same-parity 1 2 3 4 5 6 7 8 9 10))
(newline)

(display (same-parity 2 3 4 5 6 7 8 9 10))
(newline)

(display (same-parity 0 1 2 3 4 5 6 7 8 9 10))
(newline)
