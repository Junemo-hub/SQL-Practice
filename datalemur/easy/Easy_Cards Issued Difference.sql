WITH cards_cte AS (
  SELECT
    card_name,
    MAX(issued_amount) AS cardsmax,
    MIN(issued_amount) AS cardsmin
  FROM monthly_cards_issued
  GROUP BY card_name
)
SELECT 
  card_name,
  (cardsmax - cardsmin) AS difference
FROM cards_cte
ORDER BY difference DESC;
