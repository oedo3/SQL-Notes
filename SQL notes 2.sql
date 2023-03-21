/*Standard way to create table*/
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE albums(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);

/*Single Insertion of a value*/
INSERT INTO bands (name)
VALUES ('Iron Maiden');
/*Multi Insertion of a value*/
INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

/*Query data/ Query data with limits*/
SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
/*Select a column*/
SELECT name FROM bands;
/*rename columns with aliases*/
SELECT id AS 'ID', name AS 'Band Name'
FROM bands;
/*reorder values ASC or DESC*/
SELECT * FROM bands ORDER BY name;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The worst of the world', 1950, 1),
	   ('Power Slave', 1984, 1),
       ('Nightmare', 2018, 2),
       ('Nightmare', 2010, 3),
       ('Test Album', NULL, 3);
       
SELECT * FROM albums;
/*DISTINCT shows no duplicates*/
SELECT DISTINCT name FROM albums;
/*UPDATE query and WHERE statment*/
UPDATE albums
SET release_year = 1982
WHERE id = 1;

SELECT *FROM albums
WHERE release_year < 2000;

SELECT *FROM albums
WHERE name LIKE '%ER%' OR band_ID = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year = 1984 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums WHERE id = 5;

SELECT * FROM albums;

/*Join */
SELECT * FROM BANDS
JOIN albums ON bands.id = albums.band_id;
/*Inner, left, right join*/
SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id;

/*agrogate function*/
SELECT AVG(release_year) FROM albums;
SELECT SUM(release_year) FROM albums;
/*gorup by*/
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

/*aliases for table*/
SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
/*left join to get bands with no records*/
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 1;
/*where statements are before the groupby use HAVING*/