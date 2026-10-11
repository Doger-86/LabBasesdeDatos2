SELECT team.name AS team,
    COUNT(*) AS wins,
    ROUND(AVG(team_result.possession), 1)
        AS avg_possession_in_wins
FROM team_result
JOIN team ON team.team_id = team_result.team_id
WHERE team_result.points = 3
GROUP BY team.team_id, team.name
ORDER BY avg_possession_in_wins DESC;

SELECT
    CASE
        WHEN possession < 40 THEN '1. < 40'
        WHEN possession < 50 THEN '2. 40-49.9'
        WHEN possession < 60 THEN '3. 50-59.9'
        ELSE '4. >= 60'
    END AS possession_range,
    COUNT(*) AS wins,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1)
        AS pct_of_wins
FROM team_result
WHERE points = 3
GROUP BY possession_range
ORDER BY possession_range;
