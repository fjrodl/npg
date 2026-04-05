(define (problem omni_plan_problem)

(:domain omni_plan_domain)

(:objects
  restaurant - restaurant
  bar - room
  bar_counter0 - location
  dining_room - room
  dumpster - location
  entrance - room
  kitchen - room
  kitchen_counter - location
  order10_dish_order - item
  order10_drink_order - item
  order11_dish_order - item
  order12_dish_order - item
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
  waste_order8 - item
  waste_order9 - item
)

(:init
  (gripper_free waiter1)
  (gripper_free waiter2)
  (gripper_free waiter3)
  (has restaurant bar)
  (has restaurant dining_room)
  (has restaurant entrance)
  (has restaurant kitchen)
  (has restaurant trash_room)
  (in bar_counter0 bar)
  (in dumpster trash_room)
  (in kitchen_counter kitchen)
  (in table1 dining_room)
  (in table2 dining_room)
  (in table3 dining_room)
  (in table4 dining_room)
  (in table5 dining_room)
  (in table6 dining_room)
  (item_at order10_dish_order table5)
  (item_at order10_drink_order table5)
  (item_at order11_dish_order kitchen_counter)
  (item_at order12_dish_order kitchen_counter)
  (item_at waste_order8 table1)
  (item_at waste_order9 table3)
  (order_pending table2)
  (order_ready table1 kitchen_counter)
  (order_ready table3 kitchen_counter)
  (order_ready table4 kitchen_counter)
  (order_ready table5 kitchen_counter)
  (order_ready table6 kitchen_counter)
  (robot_at waiter1 kitchen_counter)
  (robot_at waiter2 table3)
  (robot_at waiter3 table5)
)

(:goal
  (and
    (item_at order11_dish_order table4)
    (item_at order12_dish_order table6)
    (item_at waste_order8 dumpster)
    (item_at waste_order9 dumpster)
    (order_ready table2 kitchen_counter)
  )
)
)