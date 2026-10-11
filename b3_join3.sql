SELECT team.name AS team,
    game.game_date,
    participation.side,
    participation.red_cards
FROM participation
JOIN team ON team.team_id = participation.team_id
JOIN game ON game.game_id = participation.game_id
JOIN season ON season.season_id = game.season_id
WHERE season.name = '20/21'
    AND participation.red_cards > 0
ORDER BY game.game_date;
