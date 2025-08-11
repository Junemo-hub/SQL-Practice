with callers_with AS (
SELECT
  policy_holder_id,
  COUNT(DISTINCT case_id) AS number_of_call
FROM callers
GROUP BY policy_holder_id)

SELECT 
  COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM callers_with
WHERE number_of_call >= 3
