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


/*WITH previous_query AS (
SELECT orders.customer_id, customers.customer_name AS 'Customer', orders.subscription_id AS 'subid', 
   COUNT(orders.subscription_id) AS 'subscriptions'
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE orders.order_status = "unpaid" AND description.subscriptions = "Fashion Magazine"
GROUP BY orders.customer_id)
SELECT previous_query.Customer, 
--previous_query.subscriptions, 
subscription_length * price_per_month * previous_query.subscriptions AS 'Amount Due'
--PRINTF("$%.2f", SUM(price_per_month * previous_query.subscriptions)) AS 'Amount Due'
FROM previous_query
JOIN subscriptions
ON previous_query.subid = subscriptions.subscription_id;
*/

SELECT 
    c.customer_name as 'Customer', 
    PRINTF('$%.2f',SUM(s.price_per_month * s.subscription_length)) AS 'Amount Due'
FROM 
    orders o
INNER JOIN 
    customers c ON o.customer_id = c.customer_id
INNER JOIN 
    subscriptions s ON o.subscription_id = s.subscription_id
WHERE 
    o.order_status = 'unpaid' AND s.description = 'Fashion Magazine'
GROUP BY 
    c.customer_name;