SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;


# Better solution.

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING 
    COUNT(DISTINCT CASE WHEN skill = 'Python' THEN 'Python' END) > 0 AND
    COUNT(DISTINCT CASE WHEN skill = 'Tableau' THEN 'Tableau' END) > 0 AND
    COUNT(DISTINCT CASE WHEN skill = 'PostgreSQL' THEN 'PostgreSQL' END) > 0;