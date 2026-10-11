SELECT season.name AS season,
    COUNT(DISTINCT game.game_id) AS games,
    SUM(participation.red_cards) AS total_red_cards,
    SUM(participation.goals) AS total_goals,
    ROUND(SUM(participation.red_cards)
        / COUNT(DISTINCT game.game_id), 3)
        AS red_cards_per_game,
    ROUND(SUM(participation.goals)
        / COUNT(DISTINCT game.game_id), 2)
        AS goals_per_game
FROM participation
JOIN game ON game.game_id = participation.game_id
JOIN season ON season.season_id = game.season_id
GROUP BY season.season_id, season.name
ORDER BY total_red_cards DESC;
