/*
1. スケートボードもヘルメットも膝当ても手袋も買った
2. スケートボードは買った、しかし、ヘルメット、膝当て、手袋のうち買っていないものが一つ以上ある
*/
WITH
    HELMET
    AS
    (
        SELECT DISTINCT o.CustomerID
        FROM Orders AS o
            INNER JOIN Order_Details AS od
            ON o.OrderNumber = od.OrderNumber
            INNER JOIN Products AS p
            ON od.ProductNumber = p.ProductNumber
        WHERE p.ProductName LIKE '%Helmet%'
    )
,
    SKATEBOARD
    AS
    (
        SELECT DISTINCT o.CustomerID
        FROM Orders AS o
            INNER JOIN Order_Details AS od
            ON o.OrderNumber = od.OrderNumber
            INNER JOIN Products AS p
            ON od.ProductNumber = p.ProductNumber
        WHERE p.ProductName LIKE '%Skateboard%'
    )
,
    KNEEPADS
    AS
    (
        SELECT DISTINCT o.CustomerID
        FROM Orders AS o
            INNER JOIN Order_Details AS od
            ON o.OrderNumber = od.OrderNumber
            INNER JOIN Products AS p
            ON od.ProductNumber = p.ProductNumber
        WHERE p.ProductName LIKE '%Knee Pads%'
    )
,
    GLOVES
    AS
    (
        SELECT DISTINCT o.CustomerID
        FROM Orders AS o
            INNER JOIN Order_Details AS od
            ON o.OrderNumber = od.OrderNumber
            INNER JOIN Products AS p
            ON od.ProductNumber = p.ProductNumber
        WHERE p.ProductName LIKE '%Gloves%'
    )
-- 1
SELECT CustomerID
FROM Customers AS c
WHERE EXISTS (
    SELECT NULL
    FROM SKATEBOARD AS s
    WHERE c.CustomerID = s.CustomerID
)
AND EXISTS (
    SELECT NULL
    FROM HELMET AS h
    WHERE c.CustomerID = h.CustomerID
)
AND EXISTS (
    SELECT NULL
    FROM KNEEPADS AS k
    WHERE c.CustomerID = k.CustomerID
)
AND EXISTS (
    SELECT NULL
    FROM GLOVES AS g
    WHERE c.CustomerID = g.CustomerID
)
-- 2 
SELECT CustomerID
FROM Customers AS c
WHERE EXISTS (
    SELECT NULL
    FROM SKATEBOARD AS s
    WHERE c.CustomerID = s.CustomerID
)
AND NOT EXISTS (
    SELECT NULL
    FROM HELMET AS h
    WHERE c.CustomerID = h.CustomerID
)
OR NOT EXISTS (
    SELECT NULL
    FROM KNEEPADS AS k
    WHERE c.CustomerID = k.CustomerID
)
OR NOT EXISTS (
    SELECT NULL
    FROM GLOVES AS g
    WHERE c.CustomerID = g.CustomerID
)
