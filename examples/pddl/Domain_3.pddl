(define (domain omni_plan_domain)

(:requirements :durative-actions :negative-preconditions :typing)

(:types
  item
  location
  restaurant
  robot
  room
)

(:predicates
  (battery_ok ?r0 - robot)
  (carrying ?r0 - robot ?i1 - item)
  (gripper_free ?r0 - robot)
  (has ?r0 - restaurant ?r1 - room)
  (in ?l0 - location ?r1 - room)
  (is_charger ?l0 - location)
  (item_at ?i0 - item ?l1 - location)
  (order_pending ?l0 - location)
  (order_ready ?l0 - location ?l1 - location)
  (robot_at ?r0 - robot ?l1 - location)
)

(:durative-action navigate
  :parameters (?robot - robot ?from - location ?to - location)
  :duration (= ?duration 10.000000)
  :condition (and (at start (robot_at ?robot ?from)) (at start (battery_ok ?robot)) )
  :effect (and (at start (not (robot_at ?robot ?from))) (at end (robot_at ?robot ?to)) )
)
(:durative-action navigate_to_charger
  :parameters (?robot - robot ?from - location ?to - location)
  :duration (= ?duration 10.000000)
  :condition (and (at start (robot_at ?robot ?from)) (at start (is_charger ?to)) )
  :effect (and (at start (not (robot_at ?robot ?from))) (at end (robot_at ?robot ?to)) )
)
(:durative-action pick
  :parameters (?robot - robot ?item - item ?location - location)
  :duration (= ?duration 5.000000)
  :condition (and (at start (robot_at ?robot ?location)) (at start (item_at ?item ?location)) (at start (gripper_free ?robot)) (at start (battery_ok ?robot)) )
  :effect (and (at end (carrying ?robot ?item)) (at start (not (gripper_free ?robot))) (at end (not (item_at ?item ?location))) )
)
(:durative-action place
  :parameters (?robot - robot ?item - item ?location - location)
  :duration (= ?duration 5.000000)
  :condition (and (at start (robot_at ?robot ?location)) (at start (carrying ?robot ?item)) (at start (battery_ok ?robot)) )
  :effect (and (at end (not (carrying ?robot ?item))) (at end (gripper_free ?robot)) (at end (item_at ?item ?location)) )
)
(:durative-action take_order
  :parameters (?robot - robot ?table - location ?kitchen - location)
  :duration (= ?duration 3.000000)
  :condition (and (at start (robot_at ?robot ?table)) (at start (order_pending ?table)) (at start (battery_ok ?robot)) )
  :effect (and (at end (not (order_pending ?table))) (at end (order_ready ?table ?kitchen)) )
)
(:durative-action charge
  :parameters (?robot - robot ?charger - location)
  :duration (= ?duration 60.000000)
  :condition (and (at start (robot_at ?robot ?charger)) (at start (is_charger ?charger)) )
  :effect (and (at end (battery_ok ?robot)) )
)
)
