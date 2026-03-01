(define (domain Robotrover-Minerales)

  ;; Requisitos del lenguaje
  (:requirements :strips :negative-preconditions)

  ;; ============================
  ;; PREDICADOS
  ;; ============================

  (:predicates

    ;; El rover esta en una localidad
    (esta-en ?r ?l)

    ;; Conexion entre localidades (direccion definida)
    (conectado ?l1 ?l2)

    ;; Un mineral esta ubicado en una localidad
    (mineral-en ?m ?l)

    ;; El rover transporta un mineral
    (transportando ?r ?m)

    ;; Una localidad es laboratorio
    (es-laboratorio ?l)

    ;; El mineral ya fue entregado en el laboratorio
    (mineral-en-lab ?m ?l)
  )

  ;; ============================
  ;; ACCION: MOVER
  ;; ============================

  (:action mover
    :parameters (?r ?desde ?hasta)
    :precondition (and
        (esta-en ?r ?desde)
        (conectado ?desde ?hasta)
    )
    :effect (and
        (not (esta-en ?r ?desde))
        (esta-en ?r ?hasta)
    )
  )

  ;; ============================
  ;; ACCION: RECOGER MINERAL
  ;; ============================

  (:action recoger
    :parameters (?r ?m ?l)
    :precondition (and
        (esta-en ?r ?l)
        (mineral-en ?m ?l)
    )
    :effect (and
        (transportando ?r ?m)
        (not (mineral-en ?m ?l))
    )
  )

  ;; ============================
  ;; ACCION: ENTREGAR MINERAL
  ;; ============================

  (:action entregar
    :parameters (?r ?m ?l)
    :precondition (and
        (esta-en ?r ?l)
        (transportando ?r ?m)
        (es-laboratorio ?l)
    )
    :effect (and
        (not (transportando ?r ?m))
        (mineral-en-lab ?m ?l)
    )
  )

)
