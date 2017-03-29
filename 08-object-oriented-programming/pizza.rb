def order_pizza(dough, ingredient)
  cost = 10

  cost += 4 if dough == :gluten_free

  ingredient_cost = case ingredient
  when :pepperoni
    3
  when :cheese
    2
  when :sausage
    6
  end
  cost += ingredient_cost

  return cost
end

regular_pizza_cost = order_pizza(:regular, :pepperoni)
puts "Cost of regular pepperoni pizza is $#{ regular_pizza_cost }"

gf_pizza_cost = order_pizza(:gluten_free, :pepperoni)
puts "Cost of gluten free pepperoni pizza is $#{ gf_pizza_cost }"

gf_cheeze_pizza_cost = order_pizza(:gluten_free, :cheese)
puts "Cost of gluten free cheese pizza is $#{ gf_cheeze_pizza_cost }"
