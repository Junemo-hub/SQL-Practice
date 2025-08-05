SELECT
  e.user_id
FROM emails e
JOIN texts t1 
  ON e.email_id = t1.email_id
  AND t1.signup_action = 'Confirmed'
  AND t1.action_date::date = e.signup_date::date + INTERVAL '1 day'
WHERE NOT EXISTS (
  SELECT 1
  FROM texts t2
  WHERE t2.email_id = e.email_id
    AND t2.signup_action = 'Confirmed'
    AND t2.action_date::date = e.signup_date::date
);
