WITH q3_queries AS (
    SELECT *
    FROM queries
    WHERE query_starttime >= '2023-07-01'
      AND query_starttime < '2023-10-01'
),
employee_query_counts AS (
    SELECT 
        em.employee_id,
        COUNT(DISTINCT q.query_id) AS unique_queries
    FROM employees em
    LEFT JOIN q3_queries q ON em.employee_id = q.employee_id
    GROUP BY em.employee_id
)
SELECT 
    unique_queries,
    COUNT(*) AS employee_count
FROM employee_query_counts
GROUP BY unique_queries
ORDER BY unique_queries;
