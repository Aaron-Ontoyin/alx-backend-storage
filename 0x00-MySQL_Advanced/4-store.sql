-- This script creates a trigger to decrease the quantity
-- of an item in the 'items' table 
-- whenever a new order is added to the 'orders' table.

CREATE TRIGGER decrease_quantity
AFTER INSERT ON orders 
FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name;
