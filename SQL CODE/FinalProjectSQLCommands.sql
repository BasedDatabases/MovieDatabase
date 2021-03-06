﻿set search_path = "FinalProject";

CREATE TABLE UserAccount
(
UserID Integer,
Pass VARCHAR(16) NOT NULL,
FName VARCHAR(20) NOT NULL,
LName VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL,
City VARCHAR(20),
Province VARCHAR(20),
Country VARCHAR(20) NOT NULL,
Primary Key (UserID)
);

CREATE TABLE Profile
(
ageRange VARCHAR(4) NOT NULL, 
yearBorn numeric(4,0) NOT NULL,
gender CHAR(1) NOT NULL,
occupation VARCHAR,
device VARCHAR,
CONSTRAINT chk_gender CHECK (gender = 'm' OR gender = 'f' OR gender = 'o')
);

CREATE TABLE Topics
(
TopicID SERIAL PRIMARY KEY,
Description VARCHAR(100)
);

CREATE TABLE Movie
(
MovieID SERIAL PRIMARY KEY,
Name VARCHAR(250) NOT NULL,
Length INTEGER,	
released Date NOT NULL,
description VARCHAR(1200) NOT NULL,
trailerLink VARCHAR(11) NOT NULL
);

CREATE TABLE Watches
(
MovieID Integer,
UserID Integer, 
time Date NOT NULL,
Repeats Integer,
rating SMALLINT NOT NULL,
Primary key (MovieID, UserID),
Foreign Key (MovieID) REFERENCES Movie (MovieID),
Foreign Key (UserID) REFERENCES UserAccount (UserID)
);

CREATE TABLE MovieTopics
(
TopicID INTEGER,
MovieID INTEGER,
languages VARCHAR(30),
subtitles boolean NOT NULL,
country VARCHAR(50) NOT NULL,
PRIMARY KEY (TopicID, MovieID),
FOREIGN KEY (TopicID) REFERENCES Topics (TopicID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Actor
(
ActorID SERIAL PRIMARY KEY,
lname VARCHAR(100),
fname VARCHAR(100) NOT NULL,
dateBirth Date NOT NULL
);

CREATE TABLE Role
(
RoleID SERIAL PRIMARY KEY,
roleName VARCHAR(50) NOT NULL,
ActorID INTEGER,
FOREIGN KEY (ActorID) REFERENCES Actor (ActorID)
);

CREATE TABLE Director
(
DirectorID SERIAL PRIMARY KEY,
lname VARCHAR(100) NOT NULL,
fname VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Studio
(
StudioID SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Sponsors
(
StudioID INTEGER,
MovieID INTEGER,
FOREIGN KEY (StudioID) REFERENCES Studio (StudioID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Actor_Movie
(
ActorID INTEGER,
MovieID INTEGER,
FOREIGN KEY (ActorID) REFERENCES Actor (ActorID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Director_Movie
(
DirectorID INTEGER,
MovieID INTEGER,
FOREIGN KEY (DirectorID) REFERENCES Director (DirectorID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE User_Movie
(
UserID INTEGER,
MovieID INTEGER,
FOREIGN KEY (UserID) REFERENCES UserAccount (UserID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

INSERT INTO Topics (description) values ('Horror');
INSERT INTO Topics (description) values ('Comedy');
INSERT INTO Topics (description) values ('Thriller');
INSERT INTO Topics (description) values ('Action');
INSERT INTO Topics (description) values ('Animation');
INSERT INTO Topics (description) values ('Adventure');
INSERT INTO Topics (description) values ('Crime');
INSERT INTO Topics (description) values ('Drama');
INSERT INTO Topics (description) values ('Fantasy');
INSERT INTO Topics (description) values ('Sci-Fi');
INSERT INTO Topics (description) values ('Family');
INSERT INTO Topics (description) values ('Romance');
INSERT INTO Topics (description) values ('War');

INSERT INTO Studio (name, country) values ('Regency Enterprises', 'United States');
INSERT INTO Studio (name, country) values ('Warner Bros', 'United States');
INSERT INTO Studio (name, country) values ('Universal', 'United States');
INSERT INTO Studio (name, country) values ('Paramount', 'United States');
INSERT INTO Studio (name, country) values ('Sony Pictures', 'United States');
INSERT INTO Studio (name, country) values ('20th Century Fox', 'United States');
INSERT INTO Studio (name, country) values ('Lionsgate', 'United States');
INSERT INTO Studio (name, country) values ('Walt Disney', 'United States');
INSERT INTO Studio (name, country) values ('New Line Cinema', 'United States');

INSERT INTO Movie (Name, Length, released, description) values ('The Revenant', 156, '1/8/2016', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 'QRfj1VCg16Y');
INSERT INTO Actor (lname, fname, dateBirth) values ('DiCaprio', 'Leonardo', '11/11/1974');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hardy', 'Tom', '9/15/1977');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gleeson', 'Domhall', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Poulter', 'Will', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'G. Iñárritu' , 'Alejandro', 'Mexico');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Revenant';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hardy' AND Movie.name = 'The Revenant';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gleeson' AND Movie.name = 'The Revenant';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Poulter' AND Movie.name = 'The Revenant';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'G. Iñárritu' AND Movie.name = 'The Revenant';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 1, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,1);


INSERT INTO Movie (Name, Length, released, description) values ('Batman Vs Superman', 151, '3/25/2016', 'Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.','PWcimiuIGxM');
INSERT INTO Actor (lname, fname, dateBirth) values ('Affleck', 'Ben', '8/15/1972');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cavill', 'Henry', '5/5/1983');
INSERT INTO Actor (lname, fname, dateBirth) values ('Adams', 'Amy', '8/20/1974');
INSERT INTO Actor (lname, fname, dateBirth) values ('Eisenberg', 'Jesse', '10/5/1983');
INSERT INTO Director (lname, fname,country) values ( 'Snyder' , 'Zack', 'United States'); 
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Affleck' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cavill' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Adams' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Eisenberg' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Snyder' AND Movie.name = 'Batman Vs Superman';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 2, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,2);


INSERT INTO Movie (Name, Length, released, description) values ('Zootopia', 108, '3/4/2016', 'In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.','CzvH6_e2a-U');
INSERT INTO Actor (lname, fname, dateBirth) values ('Goodwin', 'Ginnifer', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bateman', 'Jason', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Elba', 'Idris', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Slate', 'Jenny', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Howard' , 'Byron', 'United States'); 
INSERT INTO Director (lname, fname,country) values ( 'Moore' , 'Rich', 'United States'); 
INSERT INTO Director (lname, fname,country) values ( 'Bush' , 'Jared', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Goodwin' AND Movie.name = 'Zootopia';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bateman' AND Movie.name = 'Zootopia';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Elba' AND Movie.name = 'Zootopia';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Slate' AND Movie.name = 'Zootopia';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Howard' AND Movie.name = 'Zootopia';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Moore' AND Movie.name = 'Zootopia';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Bush' AND Movie.name = 'Zootopia';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (5, 3, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (8,3);


INSERT INTO Movie (Name, Length, released, description) values ('10 Cloverfield Lane', 103, '3/11/2016', 'After getting in a car accident, a woman is held in a shelter with two men, who claim the outside world is affected by a widespread chemical attack.','yQy-ANhnUpE');
INSERT INTO Actor (lname, fname, dateBirth) values ('Goodman', 'John', '5/20/1952');
INSERT INTO Actor (lname, fname, dateBirth) values ('Elizabeth-Winstead', 'Mary', '5/20/1952');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gallagher', 'John', '5/20/1952');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cooper', 'Bradley', '5/20/1952');
INSERT INTO Director (lname, fname,country) values ( 'Trachtenberg' , 'Dan', 'United States'); 
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Goodman' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Elizabeth-Winstead' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gallagher' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cooper' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Trachtenberg' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (10, 4, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,4);


INSERT INTO Movie (Name, Length, released, description) values ('The Witch', 93, '2/19/2016', 'A family in 1630s New England is torn apart by the forces of witchcraft, black magic and possession.','iQXmlf3Sefg');
INSERT INTO Actor (lname, fname, dateBirth) values ('Taylor-Joy', 'Anya', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ineson', 'Ralph', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Dickie', 'Kate', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Scrimshaw', 'Harvey', '9999/1/1');
INSERT INTO Director (lname, fname, country) values ('Eggers', 'Robert', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Taylor-Joy' AND Movie.name = 'The Witch';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ineson' AND Movie.name = 'The Witch';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Dickie' AND Movie.name = 'The Witch';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Scrimshaw' AND Movie.name = 'The Witch';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Eggers' AND Movie.name = 'The Witch';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (1, 5, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,5);


INSERT INTO Movie (Name, Length, released, description) values ('The Brothers Grimsby', 83, '3/11/2016', 'A new assignment forces a top spy to team up with his football hooligan brother.','Mi5SiMLFj2c');
INSERT INTO Actor (lname, fname, dateBirth) values ('Baron Cohen', 'Sasha', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wilson', 'Rebel', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Strong', 'Mark', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fisher', 'Isla', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Leterrier' , 'Louis', 'France');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Baron Cohen' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wilson' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Strong' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fisher' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Leterrier' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 6, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,6);


INSERT INTO Movie (Name, Length, released, description) values ('Dirty Grandpa', 102, '1/22/2016', 'Right before his wedding, an uptight guy is tricked into driving his grandfather, a lecherous former Army Lieutenant-Colonel, to Florida for spring break.','aZSzMIFZT7Q');
INSERT INTO Actor (lname, fname, dateBirth) values ('Efron', 'Zac', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Plaza', 'Aubrey', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Deutch', 'Zoey', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('De Niro', 'Robert', '8/17/1943');
INSERT INTO Director (lname, fname,country) values ( 'Mazer' , 'Dan', 'United States');
<<<<<<< HEAD
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Effron' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Plaza' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Deutch' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Dirty Grandpa';
=======
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Effron' AND Movie.name = 'Dirty Granpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Plaza' AND Movie.name = 'Dirty Granpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Deutch' AND Movie.name = 'Dirty Granpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Dirty Granpa';
>>>>>>> 766eb96e8277d5b7a604dd93a6730b1f6ba882f1
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Mazer' AND Movie.name = 'Dirty Grandpa';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 7, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,7);


INSERT INTO Movie (Name, Length, released, description) values ('Ride Along 2', 102, '1/15/2016', 'As his wedding day approaches, Ben heads to Miami with his soon-to-be brother-in-law James to bring down a drug dealer whos supplying the dealers of Atlanta with product.','iWfmmwdCHTg');
INSERT INTO Actor (lname, fname, dateBirth) values ('Jackson', 'O''Shea', '6/15/1969');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hart', 'Kevin', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sumpter', 'Tika', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bratt', 'Benjamin', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Story' , 'Tim', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Jackson' AND Movie.name = 'Ride Along 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hart' AND Movie.name = 'Ride Along 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sumpter' AND Movie.name = 'Ride Along 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bratt' AND Movie.name = 'Ride Along 2';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Story' AND Movie.name = 'Ride Along 2';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 8, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,8);


INSERT INTO Movie (Name, Length, released, description) values ('Daddy''s Home', 96, '12/25/2015', 'Stepdad, Brad Whitaker, is a radio host trying to get his stepchildren to love him and call him Dad. But his plans turn upside down when the biological father, Dusty Mayron, returns.', 'arhMMJx7tCU');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ferrel', 'Will', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wahlberg', 'Mark', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cardellini', 'Linda', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Vaccaro', 'Owen', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Anders' , 'Sean', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ferrel' AND Movie.name = 'Daddy''s Home';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wahlberg' AND Movie.name = 'Daddy''s Home';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cardellini' AND Movie.name = 'Daddy''s Home';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Varccaro' AND Movie.name = 'Daddy''s Home';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Anders' AND Movie.name = 'Daddy''s Home';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 9, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,9);


INSERT INTO Movie (Name, Length, released, description) values ('The Hunger Games: Mockingjay Part 2', 137, '11/20/2015', 'As the war of Panem escalates to the destruction of other districts, Katniss Everdeen, the reluctant leader of the rebellion, must bring together an army against President Snow, while all she holds dear hangs in the balance.','n-7K_OjsDCQ');
INSERT INTO Actor (lname, fname, dateBirth) values ('Lawrence', 'Jennifer', '8/15/1990');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hutcherson', 'Josh', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hemsworth', 'Liam', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Harrelson', 'Woody', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Lawrence' , 'Francis', 'Austria');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Lawrence' AND Actor.fname = 'Jennifer') AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hutcherson' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hemsworth' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Harrelson' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
<<<<<<< HEAD
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lawrence' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
=======
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lawrence' AND Movie.name = 'The Hunger Games: Mockingjay - Part 2';
>>>>>>> 766eb96e8277d5b7a604dd93a6730b1f6ba882f1
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (6, 10, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,10);


INSERT INTO Movie (Name, Length, released, description) values ('Divergent', 139, '3/21/2014', 'In a world divided by factions based on virtues, Tris learns she''s Divergent and won''t fit in. When she discovers a plot to destroy Divergents, Tris and the mysterious Four must find out what makes Divergents dangerous before it''s too late.','sutgWjz10sM');
INSERT INTO Actor (lname, fname, dateBirth) values ('Woodley', 'Shailene', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('James', 'Theo', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Judd', 'Ashley', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Courtney', 'Jai', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Burger' , 'Neil', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Woodley' AND Movie.name = 'Divergent';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'James' AND Movie.name = 'Divergent';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Judd' AND Movie.name = 'Divergent';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Courtney' AND Movie.name = 'Divergent';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Burger' AND Movie.name = 'Divergent';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (6, 11, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,11);


INSERT INTO Movie (Name, Length, released, description) values ('Maze Runner: The Scorch Trials', 132, '9/18/2015', 'After having escaped the Maze, the Gladers now face a new set of challenges on the open roads of a desolate landscape filled with unimaginable obstacles.','iSYVmMVY');
INSERT INTO Actor (lname, fname, dateBirth) values ('O''Brien', 'Dylan', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hong Lee', 'Ki', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Scoldelario', 'Kaya', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Darden', 'Dexter', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Ball' , 'Wes', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'O''Brien' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hong Lee' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Scolderlario' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Darden' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ball' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (6, 12, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,12);


INSERT INTO Movie (Name, Length, released, description) values ('American History X', 119, '11/20/1998', 'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Norton', 'Edward', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Furlong', 'Edward', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Lien', 'Jennifer', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brooks', 'Edward', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Kaye' , 'Tony', 'United Kingdom');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Norton' AND Movie.name = 'American History X';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Furlong' AND Movie.name = 'American History X';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Lien' AND Movie.name = 'American History X';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brooks' AND Movie.name = 'American History X';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Kaye' AND Movie.name = 'American History X';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 13, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,13);


INSERT INTO Movie (Name, Length, released, description) values ('Fight Club', 139, '08/15/1999', 'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more... ');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bonham Carter', 'Helena', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Loaf', 'Meat', '9999/1/1');
-- Brad Pitt and Edward Norton Already Added
INSERT INTO Director (lname, fname,country) values ( 'Fincher' , 'David', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bonham Carter' AND Movie.name = 'Fight Club';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Fight Club';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Norton' AND Movie.name = 'Fight Club';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Loaf' AND Movie.name = 'Fight Club';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Fincher' AND Movie.name = 'Fight Club';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 14, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,14);


INSERT INTO Movie (Name, Length, released, description) values ('Pulp Fiction', 154, '10/14/1994', 'The lives of two mob hit men, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.  ');
INSERT INTO Actor (lname, fname, dateBirth) values ('Roth', 'Tim', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('L. Jackson', 'Samuel', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Willis', 'Bruce', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Travolta', 'John', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Tarantino' , 'Quentin', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Roth' AND Movie.name = 'Pulp Fiction';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'L. Jackson' AND Movie.name = 'Pulp Fiction';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Willis' AND Movie.name = 'Pulp Fiction';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Travolta' AND Movie.name = 'Pulp Fiction';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Pulp Fiction';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 15, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,15);


<<<<<<< HEAD
INSERT INTO Movie (Name, Length, released, description) values ('Django Unchained', 165, '12/25/2012', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.');
=======
INSERT INTO Movie (Name, Length, released, description) values ('Django Unchained ', 165, '12/25/2012', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.');
>>>>>>> 766eb96e8277d5b7a604dd93a6730b1f6ba882f1
INSERT INTO Actor (lname, fname, dateBirth) values ('Foxx', 'Jamie', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Waltz', 'Christoph', '9999/1/1');
-- Samuel L. Jackson and Leonardo DiCaprio Already added
-- Q.T added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foxx' AND Movie.name = 'Django Unchained';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'L.Jackson' AND Movie.name = 'Django Unchained';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Waltz' AND Movie.name = 'Django Unchained';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Django Unchained';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Django Unchained';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 16, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,16);


<<<<<<< HEAD
INSERT INTO Movie (Name, Length, released, description) values ('Inglourious Basterds', 153, '08/21/2009', 'In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner''s vengeful plans for the same.');
<<<<<<< HEAD
INSERT INTO Movie (Name, Length, released, description) values ('Se7en', 127, '9/22/1995', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi. ');
=======
INSERT INTO Actor (lname, fname, dateBirth) values ('Fassbender', 'Michael', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Roth', 'Eli', '9999/1/1');
-- Brad Pitt and Cristoph Waltz Already Added
-- Q.T added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Roth' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fassbender' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Waltz' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Inglourious Basterds';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (13, 17, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,17);


INSERT INTO Movie (Name, Length, released, description) values ('Se7en', 127, '9/22/1995', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi. ');
=======
INSERT INTO Movie (Name, Length, released, description) values ('Inglourious Bastards', 153, '08/21/2009', 'In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner''s vengeful plans for the same.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fassbender', 'Michael', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Roth', 'Eli', '9999/1/1');
-- Brad Pitt and Cristoph Waltz Already Added
-- Q.T added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Roth' AND Movie.name = 'Inglorious Bastards';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fassbender' AND Movie.name = 'Inglorious Bastards';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Inglorious Bastards';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Waltz' AND Movie.name = 'Inglorious Bastards';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Inglorious Bastards';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (13, 17, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,17);


INSERT INTO Movie (Name, Length, released, description) values ('Se7en', 127, '9/22/1995', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi. ');
>>>>>>> 766eb96e8277d5b7a604dd93a6730b1f6ba882f1
INSERT INTO Actor (lname, fname, dateBirth) values ('Pitt', 'Brad', '12/18/1963');
INSERT INTO Actor (lname, fname, dateBirth) values ('Freeman', 'Morgan', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Spacey', 'Kevin', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Paltrow', 'Gwyneth', '9999/1/1');
-- David Fincher added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Se7en';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Freeman' AND Movie.name = 'Se7en';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Spacey' AND Movie.name = 'Se7en';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Paltrow' AND Movie.name = 'Se7en';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Fincher' AND Movie.name = 'Se7en';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 18, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (4,18);


<<<<<<< HEAD
>>>>>>> 82581c1d0d23f9fc4d5cb602ade2c4c96ddaac04
=======
>>>>>>> 766eb96e8277d5b7a604dd93a6730b1f6ba882f1
INSERT INTO Movie (Name, Length, released, description) values ('Silver Linings Playbook', 122, '12/25/2012', 'After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Tucker', 'Chris', '9999/1/1');
--Robert Deniro Jennifer Lawrence, Bradley Cooper Already added
INSERT INTO Director (lname, fname,country) values ( 'O''Russell' , 'David', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Tucker' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cooper' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Lawrence' AND Actor.fname = 'Jennifer') AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'O''Russell' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 19, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,19);


INSERT INTO Movie (Name, Length, released, description) values ('Life of Pi', 127, '11/21/2012', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sharma', 'Suraj', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Khan', 'Irrfan', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Depardieu', 'Gerard', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Saito', 'James', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Lee' , 'Ang', 'Taiwan');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sharma' AND Movie.name = 'Life of Pi';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Khan' AND Movie.name = 'Life of Pi';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Depardieu' AND Movie.name = 'Life of Pi';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Saito' AND Movie.name = 'Life of Pi';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lee' AND Movie.name = 'Life of Pi';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 20, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,20);


INSERT INTO Movie (Name, Length, released, description) values ('Argo', 120, '10/12/2012', 'Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1980.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cranston', 'Bryan', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Arkin', 'Alan', '9999/1/1');
-- Ben Affleck, John Goodman
INSERT INTO Director (lname, fname,country) values ( 'Affleck' , 'Ben', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cranston' AND Movie.name = 'Argo';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Arkin' AND Movie.name = 'Argo';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Affleck' AND Movie.name = 'Argo';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Goodman' AND Movie.name = 'Argo';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lee' AND Movie.name = 'Argo';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 21, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,21);


INSERT INTO Movie (Name, Length, released, description) values ('Gravity', 91, '10/4/2013', 'A medical engineer and an astronaut work together to survive after an accident leaves them adrift in space.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bullock', 'Sandra', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Clooney', 'George', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Harris', 'Ed', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sharma', 'Phaldut', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Cuaron' , 'Alfonso', 'Mexico');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bullock' AND Movie.name = 'Gravity';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Clooney' AND Movie.name = 'Gravity';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Harris' AND Movie.name = 'Gravity';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Sharma' AND Actor.fname = 'Phaldut') AND Movie.name = 'Gravity';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Cuaron' AND Movie.name = 'Gravity';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (10, 22, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,22);


INSERT INTO Movie (Name, Length, released, description) values ('The Hurt Locker', 131, '7/31/2008', 'During the Iraq War, a Sergeant recently assigned to an army bomb squad is put at odds with his squad mates due to his maverick way of handling his work.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Renner', 'Jeremey', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pearce', 'Guy', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fiennes', 'Ralph', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Morse', 'David', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Bigelow' , 'Kathryn',  'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Renner' AND Movie.name = 'The Hurt Locker';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pearce' AND Movie.name = 'The Hurt Locker';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fiennes' AND Movie.name = 'The Hurt Locker';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Morse' AND Movie.name = 'The Hurt Locker';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Bigelow' AND Movie.name = 'The Hurt Locker';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (13, 23, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,23);


INSERT INTO Movie (Name, Length, released, description) values ('No Country for Old Men', 122, '11/22/2007', 'Violence and mayhem ensue after a hunter stumbles upon a drug deal gone wrong and more than two million dollars in cash near the Rio Grande.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Lee Jones', 'Tommy', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bardem', 'Javier', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brolin', 'Josh', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Harrelson', 'Woody', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Coen' , 'Joel', 'United States');
INSERT INTO Director (lname, fname,country) values ( 'Coen' , 'Ethan', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Lee Jones' AND Movie.name = 'No Country for Old Men';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bardem' AND Movie.name = 'No Country for Old Men';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brolin' AND Movie.name = 'No Country for Old Men';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Harrelson' AND Movie.name = 'No Country for Old Men';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Coen' AND Director.fname = 'Joel' AND Movie.name = 'Gravity';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Coen' AND Director.fname = 'Ethan' AND Movie.name = 'Gravity';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 24, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,24);


<<<<<<< HEAD
INSERT INTO Movie (Name, Length, released, description) values ('There Will Be Blood', 158, '1/25/2008', 'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.');
=======
INSERT INTO Movie (Name, Length, released, description) values ('There Will Be Blood ', 158, '1/25/2008', 'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.');
>>>>>>> 766eb96e8277d5b7a604dd93a6730b1f6ba882f1
INSERT INTO Actor (lname, fname, dateBirth) values ('Day-Lewis', 'Daniel', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Dano', 'Paul', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hinds', 'Ciaran', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Carver', 'Randall', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Thomas Anderson' , 'Paul', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Day-Lewis' AND Movie.name = 'There Will Be Blood';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Dano' AND Movie.name = 'There Will Be Blood';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hinds' AND Movie.name = 'There Will Be Blood';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Carver' AND Movie.name = 'There Will Be Blood';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Thomas Anderson' AND Movie.name = 'There Will Be Blood';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 25, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,25);


INSERT INTO Movie (Name, Length, released, description) values ('Taxi Driver', 113, '2/8/1976', 'A mentally unstable Vietnam War veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feeds his urge for violent action, attempting to save a preadolescent prostitute in the process.');


INSERT INTO Actor (lname, fname, dateBirth) values ('Foster', 'Jodie', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cybill', 'Shepard', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brooks', 'Albert', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Scorsese' , 'Martin', 'United States');
-- Robert Deniro Already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foster' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cybill' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brooks' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Taxi Driver';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Taxi Driver';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 26, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,26);



INSERT INTO Movie (Name, Length, released, description) values ('Goodfellas', 146, '9/21/1990', 'Henry Hill and his friends work their way up through the mob hierarchy.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Liotta', 'Ray', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pesci', 'Joe', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bracco', 'Lorraine', '9999/1/1');
-- Robert De Niro already added
-- Dir: Martin Scorsese already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Liotta' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pesci' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bracco' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Goodfellas';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Goodfellas';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 27, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,27);


INSERT INTO Movie (Name, Length, released, description) values ('The Godfather: Part II', 202, '12/20/1974', 'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pacino', 'Al', '4/25/1940');
INSERT INTO Actor (lname, fname, dateBirth) values ('Duvall', 'Robert', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Keaton', 'Diane', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Ford Coppola' , 'Francis', 'United States');
--Robert Deniro Alraedy added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pacino' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Duvall' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Keaton' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ford Coppola' AND Movie.name = 'The Godfather: Part II';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 28, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,28);


INSERT INTO Movie (Name, Length, released, description) values ('The Godfather', 175, '3/24/1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brando', 'Marlon', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Caan', 'James', '9999/1/1');
-- Robert De Niro and Alpacino already added
-- Dir: Francis Ford already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pacino' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Caan' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brando' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'The Godfather';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ford Coppola' AND Movie.name = 'The Godfather';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 29, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,29);


INSERT INTO Movie (Name, Length, released, description) values ('The Shawshank Redemption', 142, '10/14/1994', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Robbins', 'Tim', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gunton', 'Rob', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sadler', 'William', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Darabont' , 'Frank', 'United States');
-- Morgan Freeman Already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Robbins' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gunton' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sadler' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Freeman' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Darabont' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 30, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,30);


INSERT INTO Movie (Name, Length, released, description) values ('Forrest Gump', 144, '7/6/1994', 'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hanks', 'Tom', '7/9/1956');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wright', 'Robin', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sinse', 'Gary', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Field', 'Sally', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Zemeckis' , 'Robert', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hanks' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wright' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sinse' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Field' AND Movie.name = 'Forrest Gump';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Zemeckis' AND Movie.name = 'Forrest Gump';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 31, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,31);


INSERT INTO Movie (Name, Length, released, description) values ('The Matrix', 134, '3/31/1999', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Reeves', 'Keanu', '9/2/1964');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fishburne', 'Lawrence', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Weaving', 'Hugo', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Moss', 'Carrie-Anne', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Wachowski' , 'Lana', 'United States');
INSERT INTO Director (lname, fname,country) values ( 'Wachowski' , 'Lilly', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Reeves' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fishburne' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Weaving' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Moss' AND Movie.name = 'The Matrix';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Wachowski' AND Director.fname = 'Lana' AND Movie.name = 'The Matrix';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Wachowski' AND Director.fname = 'Lilly' AND Movie.name = 'The Matrix';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 32, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,32);


INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Fellowship of the Ring', 178, '12/19/2001', 'A meek Hobbit and eight companions set out on a journey to destroy the One Ring and the Dark Lord Sauron.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wood', 'Elijah', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bean', 'Sean', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bloom', 'Orlando', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('McKellen', 'Ian', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Jackson' , 'Peter', 'New Zealand');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 33, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,33);


INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Two Towers', 179, '12/18/2002', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.');
--Same as other LOTR ^^
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 34, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,34);


INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Return of the King', 201, '12/17/2003', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.');
--Same as other LOTR ^^
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 35, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,35);


INSERT INTO Movie (Name, Length, released, description) values ('Inception', 148, '7/16/2010', 'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gordon-Levitt', 'Joseph', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Page', 'Ellen', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Nolan' , 'Christoper', 'United States');
-- Hardy and DiCaprio
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gordon-Levitt' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Page' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hardy' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Inception';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'Inception';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 36, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,36);


INSERT INTO Movie (Name, Length, released, description) values ('Interstellar', 169, '11/7/2014', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.');
INSERT INTO Actor (lname, fname, dateBirth) values ('McConaughey', 'Matthew ', '11/4/1969');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hathaway', 'Anne', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Castain', 'Jessica', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Foy', 'Mackenzie', '9999/1/1');
-- Dir: Christoper Nolan
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McConaughey' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hathaway' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Castain' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foy' AND Movie.name = 'Interstellar';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'Interstellar';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 37, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,37);


INSERT INTO Movie (Name, Length, released, description) values ('The Wolf of Wall Street', 180, '12/25/2013', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hill', 'Jonah', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Robbie', 'Margot', '9999/1/1');
--Leo and Matthew McConaughey
-- Dir Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hill' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Robbie' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McConaughey' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 38, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,38);


INSERT INTO Movie (Name, Length, released, description) values ('Shutter Island', 138, '2/19/2010', 'A U.S Marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ruffalo', 'Mark', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Kingsley', 'Ben', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Mortimer', 'Emily', '9999/1/1');
--Leo
-- Dir Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ruffalo' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Kingsley' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Mortimer' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Shutter Island';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Shutter Island';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (1, 39, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,39);


INSERT INTO Movie (Name, Length, released, description) values ('The Prestige', 130, '10/20/2006', 'Two stage magicians engage in competitive one-upmanship in an attempt to create the ultimate stage illusion.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bale', 'Christian', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Jackman', 'Hugh', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Johansson', 'Scarlett', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hall', 'Rebecca', '9999/1/1');
-- Dir Nolan
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bale' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Jackman' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Johansson' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hall' AND Movie.name = 'The Prestige';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'The Prestige';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 40, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (3,40);


INSERT INTO Movie (Name, Length, released, description) values ('The Departed', 151, '10/6/2006', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.');

INSERT INTO Actor (lname, fname, dateBirth) values ('Foster', 'Jodie', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cybill', 'Shepard', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brooks', 'Albert', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Scorsese' , 'Martin', 'United States');
-- Robert Deniro Already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foster' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cybill' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brooks' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Taxi Driver';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Taxi Driver';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 26, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,26);


INSERT INTO Movie (Name, Length, released, description) values ('Goodfellas', 146, '9/21/1990', 'Henry Hill and his friends work their way up through the mob hierarchy.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Liotta', 'Ray', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pesci', 'Joe', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bracco', 'Lorraine', '9999/1/1');
-- Robert De Niro already added
-- Dir: Martin Scorsese already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Liotta' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pesci' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bracco' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Goodfellas';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Goodfellas';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 27, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,27);


INSERT INTO Movie (Name, Length, released, description) values ('The Godfather: Part II', 202, '12/20/1974', 'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pacino', 'Al', '4/25/1940');
INSERT INTO Actor (lname, fname, dateBirth) values ('Duvall', 'Robert', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Keaton', 'Diane', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Ford Coppola' , 'Francis', 'United States');
--Robert Deniro Alraedy added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pacino' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Duvall' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Keaton' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ford Coppola' AND Movie.name = 'The Godfather: Part II';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 28, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,28);


INSERT INTO Movie (Name, Length, released, description) values ('The Godfather', 175, '3/24/1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brando', 'Marlon', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Caan', 'James', '9999/1/1');
-- Robert De Niro and Alpacino already added
-- Dir: Francis Ford already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pacino' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Caan' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brando' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'The Godfather';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ford Coppola' AND Movie.name = 'The Godfather';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 29, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,29);


INSERT INTO Movie (Name, Length, released, description) values ('The Shawshank Redemption', 142, '10/14/1994', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Robbins', 'Tim', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gunton', 'Rob', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sadler', 'William', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Darabont' , 'Frank', 'United States');
-- Morgan Freeman Already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Robbins' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gunton' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sadler' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Freeman' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Darabont' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 30, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,30);


INSERT INTO Movie (Name, Length, released, description) values ('Forrest Gump', 144, '7/6/1994', 'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hanks', 'Tom', '7/9/1956');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wright', 'Robin', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sinse', 'Gary', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Field', 'Sally', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Zemeckis' , 'Robert', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hanks' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wright' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sinse' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Field' AND Movie.name = 'Forrest Gump';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Zemeckis' AND Movie.name = 'Forrest Gump';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 31, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,31);


INSERT INTO Movie (Name, Length, released, description) values ('The Matrix', 134, '3/31/1999', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Reeves', 'Keanu', '9/2/1964');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fishburne', 'Lawrence', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Weaving', 'Hugo', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Moss', 'Carrie-Anne', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Wachowski' , 'Lana', 'United States');
INSERT INTO Director (lname, fname,country) values ( 'Wachowski' , 'Lilly', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Reeves' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fishburne' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Weaving' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Moss' AND Movie.name = 'The Matrix';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Wachowski' AND Director.fname = 'Lana' AND Movie.name = 'The Matrix';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Wachowski' AND Director.fname = 'Lilly' AND Movie.name = 'The Matrix';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 32, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,32);


INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Fellowship of the Ring', 178, '12/19/2001', 'A meek Hobbit and eight companions set out on a journey to destroy the One Ring and the Dark Lord Sauron.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wood', 'Elijah', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bean', 'Sean', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bloom', 'Orlando', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('McKellen', 'Ian', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Jackson' , 'Peter', 'New Zealand');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 33, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,33);


INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Two Towers', 179, '12/18/2002', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.');
--Same as other LOTR ^^
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 34, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,34);


INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Return of the King', 201, '12/17/2003', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.');
--Same as other LOTR ^^
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 35, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,35);


INSERT INTO Movie (Name, Length, released, description) values ('Inception', 148, '7/16/2010', 'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gordon-Levitt', 'Joseph', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Page', 'Ellen', '9999/1/1');
INSERT INTO Director (lname, fname,country) values ( 'Nolan' , 'Christoper', 'United States');
-- Hardy and DiCaprio
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gordon-Levitt' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Page' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hardy' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Inception';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'Inception';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 36, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,36);


INSERT INTO Movie (Name, Length, released, description) values ('Interstellar', 169, '11/7/2014', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.');
INSERT INTO Actor (lname, fname, dateBirth) values ('McConaughey', 'Matthew ', '11/4/1969');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hathaway', 'Anne', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Castain', 'Jessica', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Foy', 'Mackenzie', '9999/1/1');
-- Dir: Christoper Nolan
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McConaughey' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hathaway' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Castain' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foy' AND Movie.name = 'Interstellar';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'Interstellar';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 37, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,37);


INSERT INTO Movie (Name, Length, released, description) values ('The Wolf of Wall Street', 180, '12/25/2013', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hill', 'Jonah', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Robbie', 'Margot', '9999/1/1');
--Leo and Matthew McConaughey
-- Dir Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hill' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Robbie' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McConaughey' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 38, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,38);


INSERT INTO Movie (Name, Length, released, description) values ('Shutter Island', 138, '2/19/2010', 'A U.S Marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ruffalo', 'Mark', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Kingsley', 'Ben', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Mortimer', 'Emily', '9999/1/1');
--Leo
-- Dir Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ruffalo' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Kingsley' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Mortimer' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Shutter Island';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Shutter Island';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (1, 39, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,39);


INSERT INTO Movie (Name, Length, released, description) values ('The Prestige', 130, '10/20/2006', 'Two stage magicians engage in competitive one-upmanship in an attempt to create the ultimate stage illusion.');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bale', 'Christian', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Jackman', 'Hugh', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Johansson', 'Scarlett', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hall', 'Rebecca', '9999/1/1');
-- Dir Nolan
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bale' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Jackman' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Johansson' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hall' AND Movie.name = 'The Prestige';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'The Prestige';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 40, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (3,40);


INSERT INTO Movie (Name, Length, released, description) values ('The Departed', 151, '10/6/2006', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.');

INSERT INTO Actor (lname, fname, dateBirth) values ('Damon', 'Matt', '9999/1/1');
INSERT INTO Actor (lname, fname, dateBirth) values ('Nicholson', 'Jack', '9999/1/1');
--Mark Wahlberg and Leo
-- Dir: Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Departed';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Damon' AND Movie.name = 'The Departed';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Nicholson' AND Movie.name = 'The Departed';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wahlberg' AND Movie.name = 'The Departed';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'The Departed';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 41, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (1,41);

<<<<<<< HEAD

--Find the Actors in a Movie
SELECT lname, fname
FROM Movie
INNER JOIN Actor_Movie ON Movie.MovieID = Actor_Movie.MovieID INNER JOIN
	Actor ON Actor_Movie.ActorID = Actor.ActorID
WHERE Movie.MovieID = (Select MovieID 
			FROM Movie
			Where name = 'The Revenant');

--Find the Movies a given Actor is in
Select Movie.name, Movie.released
FROM Actor
INNER JOIN Actor_Movie ON Actor.ActorID = Actor_Movie.ActorID INNER JOIN
	Movie ON Actor_Movie.MovieID = Movie.MovieID
WHERE Actor.ActorID = (Select ActorID
			FROM Actor
			WHERE lname = 'DiCaprio' AND fname = 'Leonardo');
			
--Find the Director of a given Movie
SELECT lname, fname
FROM Movie
INNER JOIN Director_Movie ON Movie.MovieID = Director_Movie.MovieID INNER JOIN
	Director ON Director_Movie.DirectorID = Director.DirectorID
WHERE Movie.MovieID = (Select MovieID 
			FROM Movie
			Where name = 'The Revenant');


--Find all movies where 2 actors worked together
Select Movie.name, Movie.released
FROM Actor a1, Actor a2
INNER JOIN Actor_Movie ON a1.ActorID = Actor_Movie.ActorID AND a2.ActorID = Actor_Movie.ActorID INNER JOIN
	Movie ON Actor_Movie.MovieID = Movie.MovieID
WHERE a1.ActorID = (Select ActorID
			FROM Actor
			WHERE lname = 'DiCaprio' A);
--actors ordered by the number of movies they are in
SELECT lname,fname,
         COUNT(*) AS num_movies
    FROM MOVIE m
    JOIN Actor_Movie  AM ON AM.movieid = m.MovieID
    JOIN ACTOR        a  ON a.ActorID = AM.actorid
GROUP BY lname, fname
ORDER BY num_movies DESC, lname, fname;  


-- find movies 2 different actors are both in
SELECT name 
	FROM MOVIE m
	JOIN Actor_Movie  AM1 ON AM1.movieid = m.MovieID JOIN Actor A1 ON AM1.actorID=a1.actorID
	JOIN Actor_Movie  AM2 ON AM2.movieid = m.MovieID JOIN Actor A2 ON AM2.actorID=a2.actorID
WHERE A1.lname = 'DiCaprio' AND A1.fname = 'Leonardo' AND A2.lname ='Hardy' AND A2.fname = 'Tom';

-- find movies with a certain actor director pair
SELECT name 
	FROM MOVIE m
	 JOIN Actor_Movie  AM ON AM.movieid = m.MovieID
    JOIN ACTOR        a  ON a.ActorID = AM.actorid
    JOIN Director_Movie  DM ON DM.movieid = m.MovieID
    JOIN Director       d  ON d.DirectorID = DM.Directorid
WHERE a.lname = 'DiCaprio' AND a.fname = 'Leonardo' AND d.lname ='G. Iñárritu' AND d.fname = 'Alejandro';

--Find the Actors in a Movie
SELECT lname, fname
FROM Movie
INNER JOIN Actor_Movie ON Movie.MovieID = Actor_Movie.MovieID INNER JOIN
	Actor ON Actor_Movie.ActorID = Actor.ActorID
WHERE Movie.MovieID = (Select MovieID 
			FROM Movie
			Where name = 'The Revenant');

--Find the Movies an Actor is in
Select Movie.name, Movie.released
FROM Actor
INNER JOIN Actor_Movie ON Actor.ActorID = Actor_Movie.ActorID INNER JOIN
	Movie ON Actor_Movie.MovieID = Movie.MovieID
WHERE Actor.ActorID = (Select ActorID
			FROM Actor
			WHERE lname = 'DiCaprio' AND fname = 'Leonardo');


--Find the EXTRA info on the movie
SELECT t.Description, languages, subtitles, country FROM MovieTopics mt, Topics t
WHERE mt.MovieID = (Select MovieID
				FROM Movie
				Where name = 'Ride Along 2')
	AND (mt.TopicID = t.TopicID); 
