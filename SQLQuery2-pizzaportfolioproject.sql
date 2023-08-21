
-- finfing total revenue
select *
from [pizzaportfolioproject].[dbo].[pizza_sales]


select  SUM(total_price) as TOTALPIZZAREVENUE
from [pizzaportfolioproject].[dbo].[pizza_sales]


-- AVG order value 


select   SUM(total_price)/ count(DISTINCT(order_id)) as Averageordervalue
from pizza_sales

-- total pizza sold 

 select SUM(quantity) as totalpizzasold 
 from pizza_sales

 --total orders placed 

 select COUNT(Distinct(order_id)) as TOTALORDERS
 from pizza_sales

 -- Avg pizza per order 

 select SUM(quantity) / count(DISTINCT(order_id)) as Averagepizzaperorder
 from pizza_sales

 -- daily trend for total order 
  
  select DATENAME(DW,order_date ) as order_day ,  count(DISTINCT(order_id)) as totalorder
  from pizza_sales
  group by  DATENAME(DW,order_date ) 

  -- hourly trend 
  select DATEPART(HOUR, order_time) as Orderhours , count(DISTINCT(order_id)) as totalorder
  from pizza_sales
  group by DATEPART(HOUR, order_time)
  order by 1

  -- % of sale of pizza category 

  select pizza_category,SUM(total_price)*100 / (Select sum(total_price) from pizza_sales) as percentageofsales
  from pizza_sales 
  group by pizza_category
  order by 2

  --- % of sale by pizza size 

  select pizza_size,sum(total_price) as totalsales , SUM(total_price)*100 / (Select sum(total_price) from pizza_sales) as percentageofsalesassize where DATEPART(quarter, order_date) = 1 
  from pizza_sales 
  where DATEPART(quarter, order_date) = 1 
  group by pizza_size 
  order by 2

  -- total pizza sold by pizza category 
  select pizza_category,SUM(quantity)  as totalpizzasoldpercategory
  from pizza_sales 
  group by pizza_category
  order by 2

  -- top 5 best sellers 
  select TOP 5 pizza_name , sum(quantity)
  from pizza_sales 
  group by pizza_name
  order by 2 DESC
  
  -- least sellers 

    select TOP 5 pizza_name , sum(quantity)
  from pizza_sales 
  WHERE month(order_date) = 1
  group by pizza_name
  order by 2 