-- テーブルとビューのリストを取得
SELECT *
FROM INFORMATION_SCHEMA.TABLES AS t
WHERE t.TABLE_TYPE IN ('BASE TABLE', 'VIEW')