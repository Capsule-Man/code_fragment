-- 相関サブクエリ
SELECT *
FROM STOCK_PRICE_M SPM
LEFT JOIN STOCK_ATTR_ACCOUNT ATR
ON SPM.CODE = ATR.CODE
AND ATR.FTERM = (
    SELECT MAX(FTERM)
    FROM STOCK_ATTR_ACCOUNT
    WHERE SPM.TRADING_DATE >= FTERM
    )

-- LEFT JOIN

SELECT SPM.CODE, SPM.TRADING_DATE, ATR.FTERM
INTO #TBL
FROM STOCK_PRICE_M SPM
LEFT JOIN STOCK_ATTR_ACCOUNT ATR
ON SPM.CODE = ATR.CODE
AND SPM.TRADING_DATE >= ATR.FTERM

SELECT *
FROM #TBL a
LEFT JOIN #TBL b
ON a.CODE = b.CODE
AND a.TRADING_DATE = b.TRADING_DATE
AND a.FTERM < b.FTERM
WHERE b.FTERM IS NULL