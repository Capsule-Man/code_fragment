DECLARE @ColName VARCHAR(MAX);
SET @ColName = 'IngredientID'
-- SET @ColName = '%' + 'IngredientID' + '%'

SELECT t.object_id
, t.name AS table_name
, c.column_id
, c.name AS column_name
FROM sys.objects t
    INNER JOIN sys.columns c
    ON t.object_id = c.object_id
WHERE t.type = 'U' 
AND c.name = @ColName
-- AND c.name LIKE @ColName
ORDER BY t.name, c.column_id