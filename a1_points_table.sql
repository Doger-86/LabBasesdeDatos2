SELECT team.name AS team,
    COUNT(*) AS played,
    SUM(team_result.points = 3) AS won,
    SUM(team_result.points = 1) AS drawn,
    SUM(team_result.points = 0) AS lost,
    SUM(team_result.points) AS points,
    ROUND(AVG(team_result.points), 2) AS points_per_game
FROM team_result
JOIN team ON team.team_id = team_result.team_id
GROUP BY team.team_id, team.name
ORDER BY points DESC, played DESC;
