USE db_zoo
GO

/* Zoo Database Assignment One */

CREATE DATABASE db_zoo;

USE db_zoo;

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(30) NOT NULL
);

/* Zoo Database Assignment Two */

SELECT species_name FROM tbl_species WHERE species_order = 3;

/* Zoo Database Assignment Three */

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

/* Zoo Database Assignment Four */

SELECT species_name FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;

/* Zoo Database Assignment Five */

SELECT species_name "Species Name:", nutrition_type "Nutrition Type:" FROM tbl_species, tbl_nutrition WHERE species_nutrition = nutrition_id;

/* Zoo Database Assignment Six */

SELECT 
	tbl_specialist.specialist_fname, tbl_specialist.specialist_lname,
	tbl_specialist.specialist_contact
	FROM tbl_specialist
	INNER JOIN tbl_care ON tbl_specialist.specialist_id = tbl_care.care_specialist
	WHERE tbl_care.care_id = 'care_6';
	