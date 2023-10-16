-- Optimize search and score

-- This script creates an index on the first letter of the name column and the score column in the names table.
-- Create a composite index on the first letter of the name column and the score column.
CREATE INDEX idx_name_first_score ON names (name(1), score);
