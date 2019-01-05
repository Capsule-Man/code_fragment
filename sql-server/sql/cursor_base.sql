DECLARE @DBName VARCHAR(MAX);

DECLARE sys_db_cursor CURSOR  
    FOR SELECT name FROM sys.databases  

OPEN sys_db_cursor

FETCH NEXT FROM sys_db_cursor
INTO @DBName

WHILE @@FETCH_STATUS = 0

BEGIN
FETCH NEXT FROM sys_db_cursor
INTO @DBName
SELECT @DBName
END

CLOSE sys_db_cursor
SELECT @DBName