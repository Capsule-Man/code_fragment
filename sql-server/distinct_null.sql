DROP TABLE IF EXISTS Test;

CREATE TABLE Test
(
    A INTEGER,
    B INTEGER,
    C INTEGER
);

INSERT INTO Test
    (
    A,
    B,
    C
    )
VALUES
    (1, 2, 1),
    (1, NULL, 1),
    (2, NULL, 1),
    (2, NULL, 1),
    (3, 1, 5),
    (3, 2, 5);

SELECT * FROM Test;

/********** 
 a | b | c 
---+---+---
 1 | 2 | 1
 1 |   | 1
 2 | 3 | 3
 2 |   | 4
 3 | 1 | 5
 3 | 2 | 5
 **********/

SELECT DISTINCT a, b, c FROM Test;
SELECT a, max(b), c FROM Test GROUP BY a, c;

