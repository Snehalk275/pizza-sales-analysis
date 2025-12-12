use mysql_project;
SELECT COUNT(*) AS total_orders from orders;
SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue FROM order_details JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id;
SELECT Sum(quantity) as pizzas_sold from order_details;
SELECT orders.date, COUNT(*) AS total_orders FROM orders GROUP BY orders.date ORDER BY date asc;
SELECT orders.date, ROUND(SUM(order_details.quantity * pizzas.price),2) AS revenue FROM orders JOIN order_details ON 
orders.order_id = order_details.order_id JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id GROUP BY orders.date ORDER BY revenue DESC LIMIT 1;
SELECT pizzas.size, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY total_sold DESC;
SELECT pizza_types.category, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_sold DESC;
SELECT pizza_types.name, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_sold DESC
LIMIT 5;
SELECT pizza_types.name, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_sold ASC
LIMIT 5;
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS total_pizzas_sold
FROM order_details
JOIN pizzas 
    ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types 
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_pizzas_sold DESC;
SELECT pizza_types.category,
       ROUND(SUM(order_details.quantity * pizzas.price),2) AS revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;
SELECT 
AVG(SUM(order_details.quantity * pizzas.price)) AS average_order_price
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY orders.order_id;


 




