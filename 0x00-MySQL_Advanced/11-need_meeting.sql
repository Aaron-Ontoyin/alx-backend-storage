-- No table for a meeting

-- This script creates a view named need_meeting that lists students requiring a meeting.
DROP VIEW IF EXISTS need_meeting;

CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80 AND (
    last_meeting IS NULL OR
    last_meeting < DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
);
