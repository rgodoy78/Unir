(define (problem Robotrover-p01)
  (:domain Robotrover-Minerales)

  ;; ============================
  ;; OBJETOS
  ;; ============================

  (:objects
    rover1
    loc1 loc2 loc3 loc4 loc5
    roca1 roca2
  )

  ;; ============================
  ;; ESTADO INICIAL
  ;; ============================

  (:init

    ;; Posicion inicial del rover
    (esta-en rover1 loc3)

    ;; Minerales excavados previamente
    (mineral-en roca1 loc1)
    (mineral-en roca2 loc2)

    ;; Laboratorio ubicado en loc5
    (es-laboratorio loc5)

    ;; ============================
    ;; RESTRICCIONES DE CAMINO
    ;; ============================

    ;; 3 <-> 1 (bidireccional)
    (conectado loc3 loc1)
    (conectado loc1 loc3)

    ;; 3 -> 2 (una sola direccion)
    (conectado loc3 loc2)

    ;; 2 -> 4 (una sola direccion)
    (conectado loc2 loc4)

    ;; 3 <-> 4 (bidireccional)
    (conectado loc3 loc4)
    (conectado loc4 loc3)

    ;; 4 <-> 5 (bidireccional)
    (conectado loc4 loc5)
    (conectado loc5 loc4)
  )

  ;; ============================
  ;; OBJETIVO
  ;; ============================

  ;; Ambos minerales deben estar entregados en el laboratorio
  (:goal
    (and
      (mineral-en-lab roca1 loc5)
      (mineral-en-lab roca2 loc5)
    )
  )
)
