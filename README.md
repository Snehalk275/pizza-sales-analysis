🍕 Pizza Sales Data Analysis Project (SQL + Power BI)
📌 Project Overview
This project analyzes pizza sales data to understand business performance, customer demand, revenue trends, and product insights using SQL and Power BI.
The goal of this project is to simulate real-world data analyst work:
Writing SQL queries to answer business questions
calculating key metrics like revenue, orders, and sales distribution
Visualizing insights using Power BI dashboards

🧰 Tools Used
MySQL – Data analysis using SQL queries
Power BI – Interactive dashboard & visualization
Excel (CSV files) – Raw dataset
GitHub – Project documentation & version control

📂 Dataset Description
Dataset used: Maven Pizza Challenge DatasetTables Used:
orders – Order ID and order date
order_details – Order ID, pizza ID, quantity
pizzas – Pizza ID, size, price
pizza_types – Pizza name and category

🧠 Business Questions Answered
1️⃣ Total Number of Orders

Question: How many total orders were placed?

SELECT COUNT(*) AS total_orders FROM orders;


📊 Insight:
Shows overall demand and customer activity.

2️⃣ Total Revenue Generated

Question: How much total revenue did the business generate?

SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id;


📊 Insight:
Calculates total sales revenue using quantity × price.

3️⃣ Total Pizzas Sold

Question: How many pizzas were sold in total?

SELECT SUM(quantity) AS pizzas_sold FROM order_details;


📊 Insight:
Measures overall product demand.

4️⃣ Orders Per Day

Question: How many orders are placed each day?

SELECT orders.date, COUNT(*) AS total_orders
FROM orders
GROUP BY orders.date
ORDER BY orders.date ASC;


📊 Insight:
Helps understand daily order trends.

5️⃣ Highest Revenue Day

Question: Which day generated the highest revenue?

SELECT orders.date,
ROUND(SUM(order_details.quantity * pizzas.price),2) AS revenue
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY orders.date
ORDER BY revenue DESC
LIMIT 1;


📊 Insight:
Identifies peak business performance days.

6️⃣ Sales by Pizza Size

Question: Which pizza size sells the most?

SELECT pizzas.size, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY total_sold DESC;


📊 Insight:
Helps optimize inventory and pricing strategies.

7️⃣ Sales by Pizza Category

Question: Which category (Classic, Veggie, Supreme, Chicken) sells the most?

SELECT pizza_types.category, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_sold DESC;


📊 Insight:
Shows customer preference by category.

8️⃣ Top 5 Best Selling Pizzas

Question: Which pizzas are the top performers?

SELECT pizza_types.name, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_sold DESC
LIMIT 5;


📊 Insight:
Identifies star products.

9️⃣ Bottom 5 Least Selling Pizzas

Question: Which pizzas perform the worst?

SELECT pizza_types.name, SUM(order_details.quantity) AS total_sold
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_sold ASC
LIMIT 5;


📊 Insight:
Helps decide product removal or promotions.

🔟 Revenue by Category

Question: Which category generates the most revenue?

SELECT pizza_types.category,
ROUND(SUM(order_details.quantity * pizzas.price),2) AS revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;


📊 Insight:
Revenue-based category performance.

1️⃣1️⃣ Average Order Value

Question: What is the average value of an order?

SELECT AVG(order_total) AS average_order_price
FROM (
    SELECT orders.order_id,
    SUM(order_details.quantity * pizzas.price) AS order_total
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    GROUP BY orders.order_id
) AS sub;


📊 Insight:
Important KPI for business growth.

📊 Power BI Dashboard

The Power BI dashboard includes:

Total Revenue

Total Orders

Total Pizzas Sold

Sales by Category

Sales by Size

Top Selling Pizzas



🚀 Conclusion

This project demonstrates practical data analyst skills using SQL and Power BI.
It reflects how businesses analyze sales data to improve decision-making and performance.

