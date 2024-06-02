-- Add your sql here
SELECT orders.order_status, customers.customer_name AS Customer 
FROM orders
JOIN customers;