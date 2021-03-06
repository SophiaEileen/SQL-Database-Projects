CREATE DATABASE moviesDB;
USE moviesDB
GO

	CREATE TABLE tbl_actors (
		actor_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		actor_fname VARCHAR(50) NOT NULL,
		actor_lname VARCHAR(50) NOT NULL,
		movie_name VARCHAR(50) NOT NULL
	);
	
	CREATE TABLE tbl_directors (
		director_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		director_fname VARCHAR(50) NOT NULL,
		director_lname VARCHAR(50) NOT NULL,
		actor_id INT NOT NULL CONSTRAINT fk_actors_actor_id FOREIGN KEY REFERENCES tbl_actors(actor_id) ON UPDATE CASCADE ON DELETE CASCADE,
    
	);

	INSERT INTO tbl_actors
			(actor_fname, actor_lname, movie_name)
			VALUES
			('Milla', 'Jovovich', 'The Fifth Element'),
			('Mathew', 'McConaughey', 'Interstellar'),
			('Ethan', 'Hawke', 'Gattaca'),
			('Jake', 'Gyllenhall', 'Donnie Darko'),
			('Shane', 'Carruth', 'Primer')
	;
	SELECT * FROM tbl_actors;

	INSERT INTO tbl_directors
			(director_fname, director_lname, actor_id)
			VALUES
			('Luc', 'Besson', '1'),
			('Christopher','Nolan', '2'),
			('Andrew', 'Niccol', '3'),
			('Richard', 'Kelly', '4'),
			('Shane', 'Carruth', '5')
	;
	SELECT * FROM tbl_directors;


	/* a statement that queries data from both tables. */
	SELECT 
		a1.actor_fname, a1.actor_lname, d1.director_fname,
		d1.director_lname, a1.movie_name 
		FROM tbl_actors a1
		INNER JOIN tbl_directors d1 ON a1.actor_id = d1.actor_id
		WHERE a1.movie_name = 'Gattaca'