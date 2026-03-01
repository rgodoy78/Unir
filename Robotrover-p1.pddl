(define (problem Robotrover-p1)
  (:domain Robotrover)

  (:objects
    rover1
    loc1 loc2 loc3 loc4 loc5
    rock1 rock2
  )

  (:init
    (at rover1 loc3)

    (at-mineral rock1 loc1)
    (at-mineral rock2 loc2)

    (lab loc5)

    ;; 3 <-> 1
    (connected loc3 loc1)
    (connected loc1 loc3)

    ;; 3 -> 2
    (connected loc3 loc2)

    ;; 2 -> 4
    (connected loc2 loc4)

    ;; 3 <-> 4
    (connected loc3 loc4)
    (connected loc4 loc3)

    ;; 4 <-> 5
    (connected loc4 loc5)
    (connected loc5 loc4)
  )

  (:goal
    (and
      (at-lab rock1 loc5)
      (at-lab rock2 loc5)
    )
  )
)
