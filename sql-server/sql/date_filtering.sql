-- DATEADDで日付を進めた値で範囲指定すればオーケー
DECLARE @startdate VARCHAR(50)
SET @startdate = '2016-07-04'

SELECT *
FROM PROGRAMLOGS
WHERE LogDate >= CONVERT(datetime, @startdate, 120)
AND LogDate < CONVERT(datetime, DATEADD(DAY, 1, @startdate), 120)

-- 2016-07-04 00:00:00.000に一致するレコードしかヒットしない
SELECT *
FROM PROGRAMLOGS
WHERE LogDate = CONVERT(datetime, '2016-07-04', 120)

-- 正しい結果を返すが、インデックスを利用できない
SELECT *
FROM PROGRAMLOGS
WHERE CAST(LogDate AS date) = CONVERT(datetime, '2016-07-04', 120)