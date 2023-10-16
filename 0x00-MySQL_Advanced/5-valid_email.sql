-- Email validation to sent

-- This script creates a trigger to reset the 'valid_email' attribute in the 'users' table
-- only when the 'email' attribute has been changed.
CREATE TRIGGER email_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    END IF;
END;
