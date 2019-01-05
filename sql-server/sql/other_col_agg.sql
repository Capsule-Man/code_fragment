USE Item33Example
GO

/*
カテゴリごとの最大値を集計し、さらにはその生産国を見たいが、
下のようにすると文字数が最大のCountryがヒットしてしまう
*/

SELECT Category, MAX(Country), MAX(MaxABV) AS MaxABV
FROM BeerStyles 
GROUP BY Category;

/*
一度集計しておいて、CategoryとMaxABVで引っ掛けて
Countryを持ってくるのが一番良いと思う
*/
WITH AGG AS (
SELECT Category, MAX(MaxABV) AS MaxABV
FROM BeerStyles
GROUP BY Category
)
SELECT ag.Category, bs.Country, ag.MaxABV
FROM AGG AS ag 
INNER JOIN BeerStyles AS bs
ON ag.Category = bs.Category
AND ag.MaxABV = bs.MaxABV;

/*
下のようにもできるが、
パット見てやっていることが分かりにくい
*/
WITH TBL AS (
SELECT l.Category, l.Country, l.MaxABV AS LeftMaxABV, r.MaxABV AS RightMaxABV
FROM BeerStyles AS l
LEFT JOIN BeerStyles AS r
ON l.Category = r.Category
AND l.MaxABV < r.MaxABV
)
SELECT Category, Country, LeftMaxABV AS MaxABV
FROM TBL
WHERE RightMaxABV IS NULL;
