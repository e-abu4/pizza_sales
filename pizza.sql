create database pizzasales;
use  pizzasales;
---- Total Revenuue
select cast(sum(total_price) as decimal(10,2)) as TotalRevenue 
from pizza_sales;

----- Average order values
select sum(total_price) / count(distinct order_id) as Averageorderid
from pizza_sales;

--- Total Pizza sold
select count(quantity) as Totalpizzasold 
from pizza_sales;

--- Total orders
select count(distinct order_id) as Totalorders 
from pizza_sales;

--- Average pizza per orders
select cast(cast(sum(quantity) AS DECIMAL(10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) As avg_pizza_per_orders
from pizza_sales;

---  Daily Trend for Total Orders
SELECT dayname( order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY  order_date;

--- monthly Trend for Total Orders
select count(Distinct order_id) as Totalorders , monthname(order_date) AS month
from pizza_sales
Group by order_date
order by order_date;


--- %  Sales per  Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

 --- % Sales per Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

--- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

---  Top 5 Best Sellung pizza per Total Pizzas Sold
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

--- Bottom 5 Best Sellers per Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
limit 5;

set sql_safe_updates = 0;
SELECT DISTINCT date_format(order_date, '%Y-%m') AS month
FROM pizza_sales;

UPDATE pizza_sales
SET order_date = DATE_FORMAT(STR_TO_DATE(order_date, '%m-%d-%Y'), '%Y-%m-%d')
WHERE order_date IS NOT NULL;


select dayname(order_date) from pizza_sales;


