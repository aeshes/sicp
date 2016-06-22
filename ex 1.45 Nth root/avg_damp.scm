; average of a and b
(define (average a b)
	(/ (+ a b) 2))

; average between x and f(x)
(define (average-damp func)
	(lambda(x) (average x (func x))))
