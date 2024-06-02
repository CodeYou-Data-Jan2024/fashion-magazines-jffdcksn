-- Add your sql here
--SELECT orders.order_status, customers.customer_name AS Customer 
--FROM orders
--JOIN customers
--WHERE orders.order_status = "unpaid";

--WITH previous_query AS (SELECT orders.order_status, customers.customer_name AS Customer, orders.subscription_id AS subid
--FROM orders
--JOIN customers
--WHERE orders.order_status = "unpaid")
--SELECT previous_query.Customer, subscriptions.description, previous_query.subid
--FROM previous_query
--JOIN subscriptions
--ON previous_query.subid = subscriptions.subscription_id;


--WITH previous_query AS (
--SELECT orders.customer_id, customers.customer_name AS 'Customer', orders.subscription_id AS 'subid', 
  -- COUNT(orders.subscription_id) AS 'subscriptions'
--FROM orders
--JOIN customers
--ON orders.customer_id = customers.customer_id
--WHERE orders.order_status = "unpaid"
--GROUP BY orders.customer_id)
--SELECT previous_query.Customer, 
--previous_query.subscriptions
--FROM previous_query
--JOIN subscriptions
--ON previous_query.subid = subscriptions.subscription_id;


WITH previous_query AS (
SELECT orders.customer_id, customers.customer_name AS 'Customer', orders.subscription_id AS 'subid', 
   COUNT(orders.subscription_id) AS 'subscriptions'
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE orders.order_status = "unpaid"
GROUP BY orders.customer_id)
SELECT previous_query.Customer, 
--previous_query.subscriptions, 
subscription_length * price_per_month * previous_query.subscriptions AS 'Amount Due'
FROM previous_query
JOIN subscriptions
ON previous_query.subid = subscriptions.subscription_id;