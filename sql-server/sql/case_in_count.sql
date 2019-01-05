USE Item36Example
GO

-- 25
SELECT COUNT(*) AS TotalOrders
FROM OrdersTable

-- 18
SELECT COUNT(*) AS TotalOrders
FROM OrdersTable
 WHERE OrderTotal > 1000;

 -- 18
SELECT COUNT(CASE WHEN OrderTotal > 1000 THEN CustomerID END) AS TotalOrders
FROM OrdersTable

-- 15
SELECT COUNT( DISTINCT CASE WHEN OrderTotal > 1000 THEN CustomerID END) AS TotalOrders
FROM OrdersTable