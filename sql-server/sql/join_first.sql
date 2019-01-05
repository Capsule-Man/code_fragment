-- 再帰CTEによる数列作成
-- 1,2,3,4,5,.....15
WITH FSEQ AS (
    SELECT 1 AS SeqNum
    UNION ALL
    SELECT SeqNum + 1
    FROM FSEQ
    WHERE SeqNum < 15
),
-- 1,2,3,4,5,.....10
SSEQ AS (
    SELECT 1 AS SeqNum
    UNION ALL
    SELECT SeqNum + 1
    FROM SSEQ
    WHERE SeqNum < 10
)

SELECT *
FROM FSEQ AS fs
INNER JOIN SSEQ AS ss
ON fs.SeqNum = ss.SeqNum
ORDER BY fs.SeqNum, ss.SeqNum

/*
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
*/

SELECT *
FROM FSEQ AS fs
LEFT JOIN SSEQ AS ss
ON fs.SeqNum = ss.SeqNum
ORDER BY fs.SeqNum, ss.SeqNum

/*
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	NULL
12	NULL
13	NULL
14	NULL
15	NULL
*/

SELECT fs.SeqNum, ss.SeqNum
FROM FSEQ AS fs, SSEQ AS ss

SELECT fs.SeqNum, ss.SeqNum
FROM FSEQ AS fs
CROSS JOIN SSEQ AS ss

/*
10 * 15 = 150通り
1	1
2	1
3	1
4	1
5	1
6	1
7	1
.
.
.
.
14	9
15	9
1	10
2	10
3	10
4	10
5	10
6	10
7	10
8	10
9	10
10	10
11	10
12	10
13	10
14	10
15	10
*/