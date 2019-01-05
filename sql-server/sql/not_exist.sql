-- EXIST
SELECT p.ProductNumber, p.ProductName
FROM Products AS p
WHERE NOT EXISTS
(
    SELECT NULL
    FROM Order_Details AS od
    WHERE od.ProductNumber = p.ProductNumber 
)

-- NOT IN
SELECT p.ProductNumber, p.ProductName
FROM Products AS p
WHERE p.ProductNumber NOT IN (
    SELECT ProductNumber
    FROM Order_Details
)

-- 挫折結合
SELECT p.ProductNumber, p.ProductName
FROM Products AS p
LEFT JOIN Order_Details AS od
ON p.ProductNumber = od.ProductNumber
WHERE od.ProductNumber IS NULL