CREATE DATABASE IF NOT EXISTS Music;
USE Music;

-- Record Label table
CREATE TABLE record_label (
ID INT UNSIGNED  NOT NULL PRIMARY KEY,
Name VARCHAR(50) NOT NULL UNIQUE KEY);

-- Record Label data
INSERT INTO record_label VALUES(1,'Blackened');
INSERT INTO record_label VALUES(2,'Warner Bros');
INSERT INTO record_label VALUES(3,'Universal');
INSERT INTO record_label VALUES(4,'MCA');
INSERT INTO record_label VALUES(5,'Elektra');
INSERT INTO record_label VALUES(6,'Capitol');

-- Artist table
CREATE TABLE artist (
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  record_label_id INT UNSIGNED NOT NULL,
  Name varchar(50) NOT NULL,
  KEY fk_record_label_in_artist (record_label_id),
  FOREIGN KEY (record_label_id) REFERENCES record_label(ID) ON UPDATE CASCADE ON DELETE CASCADE);

-- Artist data
INSERT INTO Artist VALUES(1, 1,'Metallica');
INSERT INTO Artist VALUES(2, 1,'Megadeth');
INSERT INTO Artist VALUES(3, 1,'Anthrax');
INSERT INTO Artist VALUES(4, 2,'Eric Clapton');
INSERT INTO Artist VALUES(5, 2,'ZZ Top');
INSERT INTO Artist VALUES(6, 2,'Van Halen');
INSERT INTO Artist VALUES(7, 3,'Lynyrd Skynyrd');
INSERT INTO Artist VALUES(8, 3,'AC/DC');
INSERT INTO Artist VALUES(9, 6,'The Beatles');


-- Album Table
CREATE TABLE album (
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  artist_id INT UNSIGNED NOT NULL,
  Name VARCHAR(50)  NOT NULL,
  year INT UNSIGNED NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(id) ON UPDATE CASCADE ON DELETE CASCADE);

-- Album data
INSERT INTO album VALUES(1, 1, '...And Justice For All',1988);
INSERT INTO album VALUES(2, 1, 'Black Album',1991);
INSERT INTO album VALUES(3, 1, 'Master of Puppets',1986);
INSERT INTO album VALUES(4, 2, 'Endgame',2009);
INSERT INTO album VALUES(5, 2, 'Peace Sells',1986);
INSERT INTO album VALUES(6, 3, 'The Greater of 2 Evils',2004);
INSERT INTO album VALUES(7, 4, 'Reptile',2001);
INSERT INTO album VALUES(8, 4, 'Riding with the King',2000);
INSERT INTO album VALUES(9, 5, 'Greatest Hits',1992);
INSERT INTO album VALUES(10, 6, 'Greatest Hits',2004);
INSERT INTO album VALUES(11, 7, 'All-Time Greatest Hits',1975);
INSERT INTO album VALUES(12, 8, 'Greatest Hits',2003);
INSERT INTO album VALUES(13, 9, 'Sgt. Pepper''s Lonely Hearts Club Band', 1967);


-- Song table
CREATE TABLE song (
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  album_id INT UNSIGNED NOT NULL,
  Name VARCHAR(50) NOT NULL,
  duration REAL NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(id) ON UPDATE CASCADE ON DELETE CASCADE);

-- Song data
INSERT INTO song VALUES(1,1,'One',7.25);
INSERT INTO song VALUES(2,1,'Blackened',6.42);

INSERT INTO song VALUES(3,2,'Enter Sandman',5.3);
INSERT INTO song VALUES(4,2,'Sad But True',5.29);

INSERT INTO song VALUES(5,3,'Master of Puppets',8.35);
INSERT INTO song VALUES(6,3,'Battery',5.13);

INSERT INTO song VALUES(7,4,'Dialectic Chaos',2.26);
INSERT INTO song VALUES(8,4,'Endgame',5.57);

INSERT INTO song VALUES(9,5,'Peace Sells',4.09);
INSERT INTO song VALUES(10,5,'The Conjuring',5.09);

INSERT INTO song VALUES(11,6,'Madhouse',4.26);
INSERT INTO song VALUES(12,6,'I am the Law',6.03);

INSERT INTO song VALUES(13,7,'Reptile',3.36);
INSERT INTO song VALUES(14,7,'Modern Girl',4.49);

INSERT INTO song VALUES(15,8,'Riding with the King',4.23);
INSERT INTO song VALUES(16,8,'Key to the Highway',3.39);

INSERT INTO song VALUES(17,9,'Sharp Dressed Man',4.15);
INSERT INTO song VALUES(18,9,'Legs',4.32);

INSERT INTO song VALUES(19,10,'Eruption',1.43);
INSERT INTO song VALUES(20,10,'Hot For Teacher',4.43);

INSERT INTO song VALUES(21,11,'Sweet Home Alabama',4.45);
INSERT INTO song VALUES(22,11,'Free Bird',14.23);

INSERT INTO song VALUES(23,12,'Thunderstruck',4.52);
INSERT INTO song VALUES(24,12,'T.N.T',3.35);

INSERT INTO song VALUES(25,13,'Sgt. Pepper''s Lonely Hearts Club Band', 2.0333);
INSERT INTO song VALUES(26,13,'With a Little Help from My Friends', 2.7333);
INSERT INTO song VALUES(27,13,'Lucy in the Sky with Diamonds', 3.4666);
INSERT INTO song VALUES(28,13,'Getting Better', 2.80);
INSERT INTO song VALUES(29,13,'Fixing a Hole', 2.60);
INSERT INTO song VALUES(30,13,'She''s Leaving Home', 3.5833);
INSERT INTO song VALUES(31,13,'Being for the Benefit of Mr. Kite!',2.6166);
INSERT INTO song VALUES(32,13,'Within You Without You',5.066);
INSERT INTO song VALUES(33,13,'When I''m Sixty-Four',2.6166);
INSERT INTO song VALUES(34,13,'Lovely Rita', 2.7);
INSERT INTO song VALUES(35,13,'Good Morning Good Morning', 2.6833);
INSERT INTO song VALUES(36,13,'Sgt. Pepper''s Lonely Hearts Club Band (Reprise)', 1.3166);
INSERT INTO song VALUES(37,13,'A Day in the Life', 5.65);

SHOW TABLES;

	/* =================== STORED PROCEDURE QUERY QUESTIONS =================================== */
    
-- 1. List all artists for each record label sorted by artist name.

SELECT Artist.Name AS Artist_Name ,record_label.name AS record_label
FROM artist
INNER JOIN record_label
ON artist.record_label_id=record_label.id
ORDER BY Artist_Name ASC;

-- 2. Which record labels have no artists?

SELECT rl.name AS recorde_label
FROM record_label as rl
LEFT Join artist as a
ON rl.id=a.record_label_id
WHERE a.record_label_id IS NULL;

-- 3. List the number of songs per artist in descending order.

SELECT ar.name, count(*)
FROM song AS s
JOIN album AS al 
on s.album_id = al.id
JOIN artist AS ar ON al.artist_id = ar.id
GROUP BY ar.name
ORDER BY count(*) desc;   

-- 4. Which artist or artists have recorded the most number of songs?

SELECT ar.name, count(*)
FROM song AS s
JOIN album AS al 
on s.album_id = al.id
JOIN artist AS ar ON al.artist_id = ar.id
GROUP BY ar.name
ORDER BY count(*) desc
LIMIT 1;

-- 5. Which artist or artists have recorded the least number of songs?

SELECT artist.name, COUNT(song.name) AS num_songs
FROM artist
JOIN song
GROUP BY artist.name
ORDER BY num_songs;