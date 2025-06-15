select * from pizza_sales;

--Total Revenue of sales--
select sum(total_price) as Total_Revenue from pizza_sales;

--Average order value--
select (sum(total_price)/ COUNT(distinct(order_id))) Average_order from pizza_sales;

--Total Pizza Solds.
select sum(quantity) as total_pizza_sold from pizza_sales;

--Total order pizza sales--
select count(distinct(order_id)) as total_order_pizza_sales from pizza_sales;

--Average Pizza Per Order--
select cast(cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) from pizza_sales;

--Daily Trend for Total Sales--
select datename(dw, order_date), count(distinct order_id) as Daily_order from pizza_sales
group by datename(dw, order_date)
order by Daily_order desc;

--Monthly Trend for Total Sales--
select datename(month, order_date) as order_by_month, count(distinct order_id) as total_order from pizza_sales 
group by datename(month, order_date)
order by total_order desc;

--% of sales by pizza category--
SELECT pizza_category, sum(total_price) as total_revenue, sum(total_price) * 100 / (select sum(total_price) from Pizza_Sales where month(order_date) = 1) as PCT
from Pizza_Sales
where month(order_date) = 1
group by pizza_category

--% of sales by pizza size--
select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_revenue, cast(sum(total_price) * 100 / (select sum(total_price) from Pizza_Sales) as decimal(10,2)) as PCT
from Pizza_Sales
group by pizza_size
order by pizza_size;

--Total Pizza Sold By Pizza Category-- 
select Pizza_category, sum(quantity) as TOTAL_QTY_SOLD from Pizza_Sales
where month(order_date) = 1
group by pizza_category
order by TOTAL_QTY_SOLD DESC;

--Top 5 Pizza By Revenue--
select top 5 pizza_name, sum(total_price) as total_revenue 
from Pizza_Sales
group by pizza_name
order by total_revenue desc;

-- Bottom 5 Pizza Revenue--
select top 5 pizza_name, sum(total_price) as total_revenue 
from Pizza_Sales
group by pizza_name
order by total_revenue asc;

--Top 5 Pizza By Quantity--
select top 5 pizza_name, sum(quantity) as total_pizza_sold
from Pizza_Sales
group by pizza_name
order by total_pizza_sold desc;

--Bottom 5 pizza Quantity--
select top 5 pizza_name, sum(quantity) as total_pizza_sold
from Pizza_Sales
group by pizza_name
order by total_pizza_sold asc;

--top 5 pizza by total order--
select top 5 pizza_name, count(distinct order_id) as total_order 
from Pizza_Sales
group by pizza_name
order by total_order desc;

--Bottom 5 pizza by total order--
select top 5 pizza_name, count(distinct order_id) as total_order
from Pizza_Sales
group by pizza_name
order by total_order asc;














