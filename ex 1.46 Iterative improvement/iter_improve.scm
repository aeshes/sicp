(define (iterative-improve good-enough? improve)
        (define (iter guess)
                (let ((nextval (improve guess)))
                        (if (good-enough? nextval)
                                nextval
                                (iter nextval))))
        (lambda (guess) (iter guess)))

