-- 1. Retrieve the total number of orders placed. 
use pizzhut;
SELECT 
    COUNT(order_id) AS total_no_of_orders
FROM
    orders;
    
-- 2. Calculate the total revenue generated from pizza sales. 

SELECT 
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM
    pizzas
        JOIN
    order_detailes ON pizzas.pizza_id = order_detailes.pizza_id ;

-- 3. Identify the highest-priced pizza. 

SELECT 
    name, price
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY price DESC
LIMIT 1;

-- 4. Identify the most common pizza size ordered.
SELECT 
    size, SUM(quantity)
FROM
    order_detailes
        JOIN
    pizzas ON order_detailes.pizza_id = pizzas.pizza_id
GROUP BY size
ORDER BY SUM(quantity) DESC
LIMIT 1;

-- 5. List the top 5 most ordered pizza types along with their quantities.

SELECT 
    name, SUM(quantity) AS quantity_ordered
FROM
    order_detailes
        JOIN
    pizzas ON order_detailes.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY name
ORDER BY quantity_ordered DESC
LIMIT 5;

-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    category, SUM(quantity)
FROM
    order_detailes
        JOIN
    pizzas ON order_detailes.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY category
ORDER BY SUM(quantity) DESC;

-- 7. Determine the distribution of orders by hour of the day. 

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS no_of_orders
FROM
    orders
GROUP BY hour
ORDER BY no_of_orders DESC;

-- 8. Join relevant tables to find the category-wise distribution of pizzas. 

SELECT 
    category, COUNT(pizza_type_id) AS pizzas_count
FROM
    pizza_types
GROUP BY category
ORDER BY pizzas_count DESC
;

-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.
 
 
SELECT 
    ROUND(AVG(total_ordered_per_day), 0)  as avg_no_pizzas_ordered_per_day
FROM
    (SELECT 
        order_date, SUM(quantity) AS total_ordered_per_day
    FROM
        orders
    JOIN order_detailes ON orders.order_id = order_detailes.order_id
    GROUP BY order_date
    ORDER BY SUM(quantity) DESC) AS subquery;
    

-- 10. Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.name, SUM(pizzas.price * order_detailes.quantity) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_detailes ON pizzas.pizza_id = order_detailes.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3
;

 -- 11. Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.name,
    ROUND(SUM(pizzas.price * order_detailes.quantity) / (SELECT 
                    ROUND(SUM(price * quantity), 2) AS total_revenue
                FROM
                    pizzas
                        JOIN
                    order_detailes ON pizzas.pizza_id = order_detailes.pizza_id) * 100,
            2) AS percentage_contribution
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_detailes ON pizzas.pizza_id = order_detailes.pizza_id
GROUP BY pizza_types.name
ORDER BY percentage_contribution DESC;
 
 -- 12. Analyze the cumulative revenue generated over time.
select 
order_date , 
daily_revenue , 
round(sum(daily_revenue) over( order by order_date ),2) as cum_revenue
from(
	select orders.order_date  , 
	round(sum(order_detailes.quantity * pizzas.price),2) as daily_revenue 
	from orders join order_detailes 
	on orders.order_id = order_detailes.order_id 
	join pizzas on order_detailes.pizza_id = pizzas.pizza_id 
    group by orders.order_date ) as subquery

-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

 select 
 name, revenue
 from (
 select 
 category ,
 name, 
 sum(price*quantity) as revenue , 
 rank() over( partition by category order by  sum(price*quantity) desc )   as ranking
 from 
 pizza_types 
 join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
 join order_detailes on pizzas.pizza_id=order_detailes.pizza_id 

 group by category ,name) as a 
 where ranking <4 ;
