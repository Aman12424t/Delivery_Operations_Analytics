USE DeliveryOperations


----How many total orders are present in the dataset?
select * from delivery_operations

select COUNT(*) [Total orders] from delivery_operations


-----How many different customer cities are present in the dataset?

select COUNT(distinct customer_city)["Total Cities"] from delivery_operations


---What are the different product categories in the dataset?
select distinct product_category  from delivery_operations


---How many orders are there for each customer city?
select customer_city,COUNT(order_id) [Total orders]from Delivery_operations
group by customer_city


----What is the total order value for each product category?
select product_category ,sum(order_value) [Total order value] from delivery_operations
group by product_category


----What is the average order value for each customer segment?
select customer_segment ,AVG(order_value) [Avg order value] from delivery_operations
group by customer_segment

---Which delivery partner has the highest number of orders?
select delivery_partner,count(*) [Total order] from delivery_operations
GROUP BY delivery_partner 
ORDER BY [Total order] DESC


----How many orders were delayed?
select COUNT(delivery_status) [Total orders delayed] from delivery_operations 
where delivery_status = 'Delayed'

select COUNT(delivery_status) [Total orders Delivered] from delivery_operations 
where delivery_status = 'Delivered'

---What is the delay rate (%) for each delivery partner?
SELECT
    delivery_partner,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) AS delayed_orders,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) * 100.0 / COUNT(*) AS delay_rate
FROM delivery_operations
GROUP BY delivery_partner
ORDER BY delay_rate DESC

---What is the average delay_days for each weather_condition?
select weather_condition ,AVG(delay_days)[Average delay days] from delivery_operations
GROUP BY weather_condition


---What is the average delay_days for each vehicle_type and shipping_mode?
select vehicle_type,shipping_mode ,AVG(delay_days)[Average delay days] from delivery_operations
group by vehicle_type ,shipping_mode 


---What is the return rate (%) by product_category
select product_category,
COUNT(case 
        when return_flag = 1 then 1 end 
) [Total delay],
COUNT(*) [Total orders],
COUNT(
    CASE WHEN return_flag = 1 then 1   END) * 100.0 / COUNT(*) AS delay_rate
from delivery_operations
group by product_category


--- What is the average customer_rating for each delivery_status
select delivery_status ,avg(CAST(customer_rating AS FLOAT)) [Average Rating] from delivery_operations
group by delivery_status




---Which customer cities have more than 100 orders?
select customer_city , count(*)[Total orders] from delivery_operations
group by customer_city
having count(*)>100


/*What is the average delay for 
each warehouse_city + customer_city combination (route)? Which top 10 routes have the highest average delay */
select warehouse_city,customer_city,avg(delay_days) [Avg delay ] from delivery_operations
group by warehouse_city,customer_city
order by [avg delay] DESC



----Which delivery partner has an above-average delay rate?
select * from(
SELECT
    delivery_partner,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) AS delayed_orders,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) * 100.0 / COUNT(*) AS delay_rate
FROM delivery_operations
GROUP BY delivery_partner) [Partner Rates]
WHERE delay_rate > (
    SELECT AVG(delay_rate)
    FROM (
        SELECT 
            COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) * 100.0
            / COUNT(*) AS delay_rate
        FROM delivery_operations
        GROUP BY delivery_partner
    ) AS rates
)

----Rank delivery partners by number

select delivery_partner, count(*)[Total Delivery],Rank() over (order by count(*) DESC) [Rank]
from delivery_operations
group by delivery_partner


-----For each customer_segment, find the top 3 product categories by total order value
select customer_segment, sum(order_value) [Total oder value],row_number() over (order by sum(order_value) ) [Row number]
from delivery_operations
group by customer_segment


-----Write a CTE that calculates delay rate per partner, then select only partners 
------with delay rate above the overall average

with CTE AS(
    SELECT
    delivery_partner,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) AS delayed_orders,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) * 100.0 / COUNT(*) AS delay_rate
FROM delivery_operations
GROUP BY delivery_partner
)

select * from CTE where delay_rate > (select AVG(delay_rate) FROM CTE)