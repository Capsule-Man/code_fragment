/*
Orders_Detail.ProductNumber = 1 で SUM
=> Orders_Detail.ProductNumber = 2 で SUM
=> Orders_Detail.ProductNumber = 3 で SUM
.....
*/

SELECT p.ProductNumber, p.ProductName,
CASE WHEN
(
    SELECT SUM(QuantityOrdered)
    FROM Order_Details
    WHERE Order_Details.ProductNumber = p.ProductNumber
) <= 200 THEN 'Poor'
WHEN
(
    SELECT SUM(QuantityOrdered)
    FROM Order_Details
    WHERE Order_Details.ProductNumber = p.ProductNumber
) <= 500 THEN 'Average'
ELSE 'Other'
END
FROM Products AS p