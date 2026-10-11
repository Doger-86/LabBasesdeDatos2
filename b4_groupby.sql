SELECT side,
    COUNT(*) AS participations,
    ROUND(AVG(goals), 2) AS avg_goals,
    ROUND(AVG(shots_on_target), 2) AS avg_shots_on_target,
    ROUND(AVG(possession), 1) AS avg_possession,
    SUM(red_cards) AS total_red_cards
FROM participation
GROUP BY side
ORDER BY side;
