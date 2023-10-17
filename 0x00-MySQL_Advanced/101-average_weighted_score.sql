-- Average weighted score for all!

-- This script creates a stored procedure to compute the average weighted score for all users.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE current_user_id INT;
    
    DECLARE user_cursor CURSOR FOR SELECT id FROM users;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN user_cursor;

    loop_user: LOOP
        FETCH user_cursor INTO current_user_id;

        IF done = 1 THEN
            LEAVE loop_user;
        END IF;
        
        UPDATE users
        SET average_score = (
            SELECT SUM(c.score * p.weight) / SUM(p.weight)
            FROM corrections c
            INNER JOIN projects p ON c.project_id = p.id
            WHERE c.user_id = current_user_id
        )
        WHERE id = current_user_id;

    END LOOP loop_user;

    CLOSE user_cursor;
END //
DELIMITER ;
