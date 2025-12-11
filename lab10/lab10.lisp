(defun intersect(s1 s2)
    (cond 
        ((null s1) nil)
        ((member (car s1) s2) t)
        (t (intersect (cdr s1) s2))
    )
)
(intersect '(a b c) '(c d e))
(intersect '(a b c) '(d e f))