-- Calculate the percentage contribution of each pizza type to total revenue.


select name as pizz_type, round(percentage*100,2) as percentage_contribution from (
select name, revenue , revenue/sum(revenue) over() as percentage
from (
SELECT 
    pizza_types.name as name ,
    
    SUM(price * quantity) as revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_detailes ON pizzas.pizza_id = order_detailes.pizza_id
group by name 

) as subquery ) as subquery1 
order by percentage_contribution desc

;
