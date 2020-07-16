#lang racket

(define *graph*
  '((a . (b c d))
    (b . (a h))
    (c . (a g))
    (d . (g))
    (g . (c d k))
    (h . (b))
    (g . (k))))

(define (adjacent-nodes node graph)
    (cdr (assoc node graph)))

(define (unvisited-neighbours node path graph)
    (filter-not (lambda (neighbour)
                  (member neighbour path))
                (adjacent-nodes node graph)))

(define (extend-path path graph)
    (map (lambda (new-node)
           (cons new-node path))
         (unvisited-neighbours (first path) path graph)))

;; use a local auxiliary function with CL labels => Racket letrec
(define (depth-first-search initial final graph)
    (letrec ((dfs (lambda (paths)
                    (cond ((not paths) '())
                          ((eq? initial final) (list initial))
                          ((member final (first paths))
                           (reverse (first paths)))
                          (else (dfs (append (extend-path (first paths) graph)
                                          (rest paths))))))))
      (dfs (list (list initial)))))
