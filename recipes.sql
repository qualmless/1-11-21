/* SQL Script for Recipe App MySQL database.  This is the SQL code to perform CRUD operations in a SQL database. */

/* This is the schema (meaning just the structure, not the data) and it is rarely created by hand... most of the time, database administrators will use some kind of GUI software that exports this SQL code.  Running this portion of the script in sqlfiddle.com will define your schema. */

create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(40), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 

	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 

	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 

	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 

	ENGINE=InnoDB DEFAULT CHARSET=utf8; INSERT INTO Measure (name) VALUES('CUP'), ('TEASPOON'), ('TABLESPOON'), ('WHOLE'), ('OUNCE'), ('LITER'), ('GRAM'), ('SLICE');

INSERT INTO Ingredient (name) VALUES('egg'), ('salt'), ('sugar'), ('chocolate'), ('vanilla extract'), ('flour'), ('cheese'), ('bread'), ('strawberries'), ('Tea'), ('Water');

INSERT INTO Recipe (name, description, instructions) VALUES('Boiled Egg', 'A single boiled egg', 'Add egg to cold water. Bring water to boil. Cook.');
INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate Cake', 'Yummy cake', 'Add eggs, flour, chocolate to pan. Bake at 350 for 1 hour');

INSERT INTO Recipe (name, description, instructions) VALUES('Brewed Tea', 'A liter of tea', 'Boil water, then steep tea in water for 5 minutes. Strain. Sweeten if you\'d like!');
INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate-dipped strawberries', 'fruit and chocolate snack', 'Melt chocolate. Dips strawberries in melted chocolate. Enjoy!');
INSERT INTO Recipe (name, description, instructions) VALUES('Grilled Cheese', 'Bread and cheese, hot and crispy', 'oil pan, place bread, then cheese, then bread. crisp both sides until cheese melts.');

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 1, NULL, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 1, NULL, 3);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 2, 2, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 3, 1, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 4, 1, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 10, 7, 3);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 11, 6, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 4, 1, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 9, 4, 10);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 7, 8, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 8, 8, 2);



/* The SELECT statement is the most common way to read data from the database.  This is the "Read" in CRUD */

/*get a list of all recipes */ 
SELECT * from Recipe

/*
get a specific ingredient 
this command is incomplete, the last item on the right hand side of the equals sign needs to be added
*/ 

SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = "chocolate"

/* get all the ingredients and names. Notice that this is getting kind of messy?  That's one reason for the growth of MongoDB and NoSQL in general */ 
SELECT r.name AS 'Recipe', r.instructions, ri.amount AS 'Amount', mu.name AS 'Unit of Measure', i.name AS 'Ingredient' 
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id;

/* Update is the U in CRUD */

UPDATE Ingredient
SET name = 'Brown Sugar'
WHERE name = 'Sugar';

/* Delete, the D in CRUD */

/* Delete the row of data from the Recipe table where the id is 1. */
DELETE FROM Recipe WHERE id=1;

/* Insert 3 new recipes and their ingredients, amounts, and measures in to the Database */
	-- added some new ingredients and measurements and used some old in the new recipes
	
/* Write a query to get a list of all the Recipes */
	SELECT * from Recipe
	
/* Write a query to get a list of Recipes that use a certain Ingredient */
	SELECT * 
	FROM RecipeIngredient
	WHERE ingredient_id = 4
	
/* Write a query to update a recipe you added */
	UPDATE Ingredient
	SET name = 'flax egg'
	WHERE name = 'egg';
	
	
/* Put your SQL commands in a file in a Github repo and submit the repo link to Lab 1 */