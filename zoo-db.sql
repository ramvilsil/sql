/*
Returns all data in the habitat table.
*/
SELECT * FROM tbl_habitat;

/*
Retrieve all names from the species_name column of the tbl_species table that have a species_order value of 3.
*/
SELECT species_name FROM tbl_species WHERE species_order = 3;

/*
Retrieve only the types from the column nutrition_type of the tbl_nutrition table that have a nutrition_cost of 600.00 or less.
*/
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

/*
Retrieve all species_names from tbl_nutrition that have a nutrition_id between 2202 and 2206. 
*/
SELECT tbl_species.species_name
FROM tbl_species 
INNER JOIN tbl_nutrition 
ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id 
WHERE tbl_nutrition.nutrition_id BETWEEN 2202 AND 2206;

/*
Retrieve all names from the species_name column in
the tbl_species table and their corresponding nutrition_type
from the tbl_nutrition table.

Ensure that the data is returned using these aliases: 
"Species Name: " for the species_name column and "Nutrition Type: " for the nutrition_type column.
*/
SELECT tbl_species.species_name AS 'Species Name: ', tbl_nutrition.nutrition_type AS 'Nutrition Type: ' 
FROM tbl_species 
INNER JOIN tbl_nutrition 
ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;

/* 
From the specialist table, retrieve the first name, 
last name and contact number for the people that provide 
care to penguins. You will need to use two INNER JOINs
 to connect the three tables needed: tbl_specialist, 
 tbl_species, and tbl_care.
*/
SELECT tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact 
FROM tbl_specialist 
INNER JOIN tbl_care
ON tbl_specialist.specialist_id = tbl_care.care_specialist
INNER JOIN tbl_species
ON tbl_care.care_id = tbl_species.species_care
WHERE tbl_species.species_care = 'care_6';