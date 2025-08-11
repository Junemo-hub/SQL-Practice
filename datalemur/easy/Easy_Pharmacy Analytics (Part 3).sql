WITH pharmacy_table AS (
  SELECT
    manufacturer,
    -- numeric로 강제 후 0자리 반올림 (백만 단위)
    ROUND( (SUM(total_sales)::numeric) / 1000000, 0 ) AS sale_million
  FROM pharmacy_sales
  GROUP BY manufacturer
)
SELECT
  manufacturer,
  '$' || sale_million::text || ' million' AS sale
FROM pharmacy_table
ORDER BY sale_million DESC, manufacturer ASC;


-- This is real answer, but the solution on the website might be wrong.
