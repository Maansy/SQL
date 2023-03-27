-- https://datalemur.com/questions/pizzas-topping-cost

SELECT concat(p1.topping_name , ',', p2.topping_name, ',',p3.topping_name) AS pizza,
p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1
INNER JOIN pizza_toppings AS p2
ON p1.topping_name < p2.topping_name
INNER JOIN pizza_toppings AS p3
ON p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, pizza;