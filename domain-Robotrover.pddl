(define (domain Robotrover)

  (:requirements :strips :negative-preconditions)

  (:predicates
    (at ?r ?l)
    (connected ?l1 ?l2)
    (at-mineral ?m ?l)
    (carrying ?r ?m)
    (lab ?l)
    (at-lab ?m ?l)
  )

  (:action move
    :parameters (?r ?from ?to)
    :precondition (and
        (at ?r ?from)
        (connected ?from ?to)
    )
    :effect (and
        (not (at ?r ?from))
        (at ?r ?to)
    )
  )

  (:action pick
    :parameters (?r ?m ?l)
    :precondition (and
        (at ?r ?l)
        (at-mineral ?m ?l)
    )
    :effect (and
        (carrying ?r ?m)
        (not (at-mineral ?m ?l))
    )
  )

  (:action drop
    :parameters (?r ?m ?l)
    :precondition (and
        (at ?r ?l)
        (carrying ?r ?m)
        (lab ?l)
    )
    :effect (and
        (not (carrying ?r ?m))
        (at-lab ?m ?l)
    )
  )

)
