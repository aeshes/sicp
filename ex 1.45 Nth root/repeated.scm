; Composition of one-argument functions f and g
; (f, g) -> f(g(x))
(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated func times)
	(if (= times 1)
		func
		(compose func (repeated func (- times 1)))))
