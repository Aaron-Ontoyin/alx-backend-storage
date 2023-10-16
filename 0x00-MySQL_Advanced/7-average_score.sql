-- Average Score

-- This script creates a stored procedure to compute and store the average score for a student.

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE v_average_score FLOAT;

    SELECT AVG(score) INTO v_average_score FROM corrections WHERE user_id = user_id;

    UPDATE users SET average_score = v_average_score WHERE id = user_id;
END;
//

DELIMITER ;
