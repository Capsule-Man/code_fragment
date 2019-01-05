USE ITEM30EXAMPLE
GO

-- SELECT Color, Dimension, SUM(Quantity)
-- FROM Inventory
-- GROUP BY Color, Dimension
-- HAVING Color = 'Red'

/*
Red	L	10
Red	M	15
*/

-- SELECT Color, Dimension, SUM(Quantity) 
-- FROM Inventory
-- GROUP BY ROLLUP(Color, Dimension)

/*
Blue	L	5
Blue	M	20
Blue	NULL	25
Red	    L	10
Red	    M	15
Red	    NULL	25
NULL	NULL	50
*/

-- SELECT Color, Dimension, SUM(Quantity) 
-- FROM Inventory
-- GROUP BY CUBE(Color, Dimension)

/*
Blue	L	5
Red	    L	10
NULL	L	15
Blue	M	20
Red	    M	15
NULL	M	35
NULL	NULL	50
Blue	NULL	25
Red	    NULL	25
*/

/*
下の２つのクエリは同じ意味
UNION ALLではSELECTでの指定が面倒だから、GROUPING SETSの方がラク
*/

SELECT Color, Dimension, SUM(Quantity) 
FROM Inventory
GROUP BY GROUPING SETS
 (
    (Color),
    (Dimension),
    (Color, Dimension)
 )

SELECT Color, NULL AS Dimension, SUM(Quantity) AS QSUM
FROM Inventory
GROUP BY Color
UNION ALL 
SELECT NULL AS Color, Dimension, SUM(Quantity) AS QSUM 
FROM Inventory
GROUP BY Dimension
UNION ALL 
SELECT Color, Dimension, SUM(Quantity)
FROM Inventory
GROUP BY Color, Dimension