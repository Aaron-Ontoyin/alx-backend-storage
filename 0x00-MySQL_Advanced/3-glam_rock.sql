-- Old School band

SOURCE metal_bands.sql;

CREATE TEMPORARY TABLE glam_rock_bands AS
SELECT band_name,
       CAST(SUBSTRING_INDEX(lifespan, '-', 1) AS UNSIGNED) AS start_year,
       CAST(SUBSTRING_INDEX(lifespan, '-', -1) AS UNSIGNED) AS end_year
FROM metal_bands
WHERE main_style = 'Glam rock';

UPDATE glam_rock_bands
SET end_year = IFNULL(end_year, 2022);

UPDATE glam_rock_bands
SET lifespan = end_year - start_year;

SELECT band_name, lifespan
FROM glam_rock_bands
ORDER BY lifespan DESC;