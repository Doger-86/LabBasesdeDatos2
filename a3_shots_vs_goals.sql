SELECT team.name AS team,
    season.name AS season,
    COUNT(*) AS played,
    SUM(participation.shots_on_target) AS shots_on_target,
    SUM(participation.goals) AS goals,
    SUM(participation.shots_on_target)
        - SUM(participation.goals) AS difference,
    ROUND(100.0 * SUM(participation.goals)
        / SUM(participation.shots_on_target), 1)
        AS conversion_pct
FROM participation
JOIN team ON team.team_id = participation.team_id
JOIN game ON game.game_id = participation.game_id
JOIN season ON season.season_id = game.season_id
GROUP BY team.team_id, team.name,
    season.season_id, season.name
ORDER BY difference DESC
LIMIT 10;
