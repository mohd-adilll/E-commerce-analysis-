USE ecommerce;

-- Raw records from Orders and Customers tables
SELECT * FROM orders,customer;


-- Q1: State with the highest revenue
SELECT State, SUM(Price*Qty) AS Revenue
FROM Orders
GROUP BY State
ORDER BY Revenue DESC
LIMIT 1;


-- Q2: Daily sales for the most recent 3 days
SELECT Customer_ID, COUNT(Order_ID) AS Orders_Count
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1;


-- Q3: Customers who placed more than one order
SELECT Date, SUM(Price*Qty) AS Daily_Sales
FROM Orders
GROUP BY Date
ORDER BY Date DESC
LIMIT 3;


-- Data cleaning using TRIM on Customer_ID in both customer and Orders tables
UPDATE customer
SET Customer_ID = TRIM(Customer_ID);

UPDATE Orders
SET Customer_ID = TRIM(Customer_ID);


-- Q4: Loss-making orders with customer names using JOIN
SELECT c.Name, o.state,o.product,o.profit
FROM customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE profit < 0;
