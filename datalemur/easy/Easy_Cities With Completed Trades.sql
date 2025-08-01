SELECT 
  city,
  COUNT(users.user_id) AS total_orders
FROM trades
JOIN users
ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY city
ORDER BY total_orders DESC
LIMIT 3
