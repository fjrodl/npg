(define (problem omni_plan_problem)

(:domain omni_plan_domain)

(:objects
  bar - room
  bar_counter0 - location
  charger1 - location
  charger2 - location
  charger3 - location
  dining_room - room
  dumpster - location
  entrance - room
  kitchen - room
  kitchen_counter - location
  order4_dish_order - item
  order4_drink_order - item
  order6_dish_order - item
  order6_drink_order - item
  reception - location
  restaurant - restaurant
  table1 - location
  table2 - location
  table3 - location
  table4 - location
  table5 - location
  table6 - location
  trash_room - room
  waiter1 - robot
  waiter2 - robot
  waiter3 - robot
  waste_order2 - item
  waste_order3 - item
  waste_order5 - item
)

(:init
  (carrying waiter3 order6_drink_order)
  (has restaurant bar)
  (has restaurant dining_room)
  (has restaurant entrance)
  (has restaurant kitchen)
  (has restaurant trash_room)
  (in bar_counter0 bar)
  (in charger1 kitchen)
  (in charger2 kitchen)
  (in charger3 bar)
  (in dumpster trash_room)
  (in kitchen_counter kitchen)
  (in reception entrance)
  (in table1 dining_room)
  (in table2 dining_room)
  (in table3 dining_room)
  (in table4 dining_room)
  (in table5 dining_room)
  (in table6 dining_room)
  (is_charger charger1)
  (is_charger charger2)
  (is_charger charger3)
  (item_at order4_dish_order kitchen_counter)
  (item_at order4_drink_order table6)
  (item_at order6_dish_order kitchen_counter)
  (item_at waste_order2 table2)
  (item_at waste_order3 table5)
  (item_at waste_order5 table1)
  (order_pending table3)
  (order_ready table1 kitchen_counter)
  (order_ready table2 kitchen_counter)
  (order_ready table4 kitchen_counter)
  (order_ready table5 kitchen_counter)
  (order_ready table6 kitchen_counter)
  (robot_at waiter1 kitchen_counter)
  (robot_at waiter2 bar_counter0)
  (robot_at waiter3 table4)
  (gripper_free waiter1)
  (gripper_free waiter2)
)

(:goal
  (and
    (battery_ok waiter1)
    (battery_ok waiter2)
    (battery_ok waiter3)
    (item_at order4_dish_order table6)
    (item_at order6_dish_order table4)
    (item_at order6_drink_order table4)
    (item_at waste_order2 dumpster)
    (item_at waste_order3 dumpster)
    (item_at waste_order5 dumpster)
    (order_ready table3 kitchen_counter)
  )
)
)
