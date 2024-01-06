CREATE DATABASE Shopping;
USE Shopping;

SELECT * FROM Products;

SELECT * FROM Customers;

SELECT * FROM Orders;

-- Q1: Retrieve all products --
SELECT * FROM Products;

-- Q2: Retrieve all customers --
SELECT * FROM Customers;

-- Q3: Retrieve all orders with customer and product details: --
SELECT O.OrderID, C.FirstName, C.LastName, P.ProductName, O.Quantity, O.TotalAmount, O.OrderDate
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Products P ON O.ProductName = P.ProductName;

-- Q4: Retrieve the total quantity of each product sold: --
SELECT ProductName, SUM(Quantity) AS TotalQuantitySold
FROM Orders
GROUP BY ProductName;

-- Q5: Retrieve the total amount spent by each customer: --
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.TotalAmount) AS TotalAmountSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

-- Q6: Retrieve the most expensive product: --
SELECT * FROM Products 
ORDER BY Price DESC 
LIMIT 1;

-- Q7: Retrieve the customer with the highest total spending: --
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.TotalAmount) AS TotalAmountSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalAmountSpent DESC 
LIMIT 1;

-- Q8: Retrieve the average quantity of products sold: --
SELECT AVG(Quantity) AS AverageQuantitySold 
FROM Orders;

-- Q9: Retrieve customers who have not placed any orders: --
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;

-- Q10: Retrieve products that have never been ordered: --
SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductName = O.ProductName
WHERE O.OrderID IS NULL;

-- Q11: Retrieve the total number of orders for each customer: --
SELECT C.CustomerID, C.FirstName, C.LastName, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

-- Q12: Retrieve the top 5 products by total quantity sold: --
SELECT ProductName, SUM(Quantity) AS TotalQuantitySold
FROM Orders
GROUP BY ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 5;




