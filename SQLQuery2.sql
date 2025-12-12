Select * From pizza_sales  

Select Sum(total_price) As Total_Revenue From pizza_sales 

Select Sum(total_price)/count(DISTINCT Order_id) As AVG_Order_Value from pizza_sales

Select Sum(quantity) As Total_Pizza_Sold from pizza_sales

Select Count(DISTINCT Order_id) As Total_order From pizza_sales 

Select Cast(Cast(Sum(quantity)As decimal(10,2))/
(Count(DISTINCT Order_id))As Decimal (10,2))
As AVG_Pizza_per_Oreder  from  pizza_sales 

SELECT DATENAME(DW, order_date) AS order_day,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
Group BY DATENAME(DW, order_date) 

SELECT DATENAME(Month, order_date) AS Month_name,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
Group BY DATENAME(Month, order_date)

/*========================================================================*/
SELECT pizza_category,SUM(total_price)total_sales, SUM(total_price)*100/(select SUM(total_price) from pizza_sales)
AS PCT from pizza_sales
where MONTH(order_date) =1
group by (pizza_category)

SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2))AS total_sales,CAST(SUM(total_price)*100/
(select SUM(total_price) from pizza_sales ) AS DECIMAL(10,2))
AS PCT from pizza_sales
where  DATEPART(quarter,order_date)=1
group by (pizza_size)
order BY PCT DESC

SELECT TOP 5 pizza_name,SUM(total_price)AS total_reven_sales from pizza_sales
GROUP BY pizza_name
ORDER BY total_reven_sales desc

SELECT TOP 5 pizza_name,SUM(quantity)AS Total_quntity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_quntity DESC

SELECT TOP 5 pizza_name,Count(DISTINCT order_id)AS Total_quntity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_quntity DESC