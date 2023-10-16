-- Average Score

-- This script creates a stored procedure to compute and store the average score for a student.

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE average_score_calc FLOAT;

    SELECT AVG(score) INTO average_score_calc FROM corrections WHERE user_id = user_id;

    UPDATE users SET average_score = average_score_calc WHERE id = user_id;
END;
//

DELIMITER ;
