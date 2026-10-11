SELECT game_id, goals, possession, shots_on_target
FROM participation
WHERE side = 'away'
    AND goals >= 3
    AND possession < 40
    AND red_cards = 0
ORDER BY possession ASC, game_id;
