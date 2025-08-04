WITH ctr_2022 AS (
  SELECT
    app_id,
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS click_count,
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS impression_count
  FROM events
  WHERE EXTRACT(YEAR FROM timestamp) = 2022
  GROUP BY app_id
)
SELECT
  app_id,
  ROUND(100.0 * click_count / impression_count, 2) AS ctr
FROM ctr_2022;
