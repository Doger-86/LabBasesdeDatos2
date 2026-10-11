SELECT game.game_id, game.game_date, season.name AS season
FROM game
JOIN season ON season.season_id = game.season_id
WHERE season.name = '19/20'
    AND game.game_date >= '2020-06-01'
ORDER BY game.game_date, game.game_id;
