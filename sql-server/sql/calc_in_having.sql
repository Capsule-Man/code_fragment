DECLARE @Q4_STARTDATE VARCHAR(50);
DECLARE @Q4_ENDDATE VARCHAR(50);
SET @Q4_STARTDATE = '2015-10-01';
SET @Q4_ENDDATE = '2015-12-31';

DECLARE @Q4_AVG INTEGER

SET @Q4_AVG = (
    SELECT AVG(DATEDIFF(DAY, p.OrderDate, p.DeliveryDate))
    FROM PurchaseOrders AS p
    WHERE p.DeliveryDate IS NOT NULL
    AND p.OrderDate >= CONVERT(datetime, @Q4_STARTDATE, 120)
    AND p.OrderDate < DATEADD(DAY, 1, CONVERT(datetime, @Q4_ENDDATE, 120))
    )

SELECT v.VendName, AVG(DATEDIFF(DAY, p.OrderDate, p.DeliveryDate)) AS DeliveryDays
FROM Vendors AS v
INNER JOIN PurchaseOrders AS p
ON v.VendorID = p.VendorID
WHERE p.DeliveryDate IS NOT NULL
AND p.OrderDate >= CONVERT(datetime, @Q4_STARTDATE, 120)
AND p.OrderDate < DATEADD(DAY, 1, CONVERT(datetime, @Q4_ENDDATE, 120))
GROUP BY v.VendName
HAVING AVG(DATEDIFF(DAY, p.OrderDate, p.DeliveryDate)) > @Q4_AVG