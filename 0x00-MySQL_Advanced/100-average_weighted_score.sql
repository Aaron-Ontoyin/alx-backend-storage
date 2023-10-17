-- Average weighted score

-- This script creates a stored procedure to compute the average weighted score for a given user.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_weight INT DEFAULT 0;
    DECLARE total_weighted_score FLOAT DEFAULT 0.0;

    SELECT 
        SUM(p.weight) INTO total_weight,
        SUM(p.weight * c.score) INTO total_weighted_score
    FROM corrections c
    INNER JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    UPDATE users
    SET average_score = total_weighted_score / total_weight
    WHERE id = user_id;

END //
DELIMITER ;
