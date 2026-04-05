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
  order2_dish_order - item
  order2_drink_order - item
  order4_dish_order - item
  order4_drink_order - item
  order5_dish_order - item
  order5_drink_order - item
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
  tray1 - item
  waiter1 - robot
  waiter2 - robot
  waiter3 - robot
  waste_order1 - item
  waste_order3 - item
)

(:init
  (carrying waiter3 waste_order1)
  (gripper_free waiter2)
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
  (item_at order2_dish_order kitchen_counter)
  (item_at order2_drink_order bar_counter0)
  (item_at order4_dish_order kitchen_counter)
  (item_at order4_drink_order bar_counter0)
  (item_at order5_dish_order kitchen_counter)
  (item_at order5_drink_order bar_counter0)
  (item_at order6_dish_order kitchen_counter)
  (item_at order6_drink_order bar_counter0)
  (item_at tray1 reception)
  (item_at waste_order3 table2)
  (order_ready table1 kitchen_counter)
  (order_ready table2 kitchen_counter)
  (order_ready table3 kitchen_counter)
  (order_ready table4 kitchen_counter)
  (order_ready table5 kitchen_counter)
  (order_ready table6 kitchen_counter)
  (robot_at waiter1 bar_counter0)
  (robot_at waiter2 bar_counter0)
  (robot_at waiter3 dumpster)
  (gripper_free waiter1)

)

(:goal
  (and
    (battery_ok waiter1)
    (battery_ok waiter2)
    (battery_ok waiter3)
    (item_at order2_dish_order table4)
    (item_at order2_drink_order table4)
    (item_at order4_dish_order table6)
    (item_at order4_drink_order table6)
    (item_at order5_dish_order table3)
    (item_at order5_drink_order table3)
    (item_at order6_dish_order table5)
    (item_at order6_drink_order table5)
    (item_at waste_order1 dumpster)
    (item_at waste_order3 dumpster)
  )
)
)
