WITH FSEQ AS (
    SELECT 1 AS SeqNum
    UNION ALL
    SELECT SeqNum + 1
    FROM FSEQ
    WHERE SeqNum < 10
),
-- 1,1,2,2,3,3,4,4....10,10
DSEQ AS (
    SELECT * FROM FSEQ
    UNION ALL
    SELECT * FROM FSEQ
)
/*
2*2 + 2*2 + 2*2 + ..... = 40通り
*/
SELECT * 
FROM DSEQ AS d1 
INNER JOIN DSEQ AS d2
ON d1.SeqNum = d2.SeqNum
