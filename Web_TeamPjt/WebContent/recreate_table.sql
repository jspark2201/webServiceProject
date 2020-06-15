DROP DATABASE developers;
create database developers;
use developers;
create table user(
	id VARCHAR(20) NOT NULL PRIMARY KEY,
	pwd VARCHAR(20) NOT NULL,
	nickname VARCHAR(20) NOT NULL,
	email VARCHAR(20) NOT NULL,
	number VARCHAR(11) NOT NULL,
	date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

create table user_favorite(
	user_id VARCHAR(20) PRIMARY KEY,
	web binary NOT NULL,
	android binary NOT NULL,
	embeded binary NOT NULL,
	ios binary NOT NULL,
	health binary NOT NULL,
	psychology binary NOT NULL,
	game binary NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(id)
);
CREATE TABLE idea(
	id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	writer VARCHAR(20) NOT NULL,
	title VARCHAR(20),
	content text NOT NULL,
	requirements text,
	registration_date  DATE NOT NULL,
	complete_date DATE,
	number_participants INT NOT NULL,
	projectURL text,
	state int NOT NULL,
	FOREIGN KEY(writer) REFERENCES user(id)
);

CREATE TABLE pictures(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	src text NOT NULL,
	idea_id INT NOT NULL,
	FOREIGN KEY(idea_id) REFERENCES idea(id)
);

CREATE TABLE comments(
	id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	content text NOT NULL,
	writer VARCHAR(20) NOT NULL,
	idea_id INT NOT NULL,
	registration_date  DATE NOT NULL,
	FOREIGN KEY(idea_id) REFERENCES idea(id),
	FOREIGN KEY(writer) REFERENCES user(id)
);

CREATE TABLE participants(
	idea_id INT NOT NULL,
	user_id VARCHAR(20) NOT NULL,
	type INT NOT NULL,
	Participate_date DATE NOT NULL,
	FOREIGN KEY(idea_id) REFERENCES idea(id),
	FOREIGN KEY(user_id) REFERENCES user(id),
	PRIMARY KEY(idea_id, user_id)
);

CREATE TABLE good(
	idea_id INT NOT NULL,
	user_id VARCHAR(20) NOT NULL,
	registration_date  DATE NOT NULL,
	FOREIGN KEY(idea_id) REFERENCES idea(id),
	FOREIGN KEY(user_id) REFERENCES user(id),
	PRIMARY KEY(idea_id, user_id)
);
create table idea_favorite(
	idea_id INT PRIMARY KEY,
	web binary NOT NULL,
	android binary NOT NULL,
	embeded binary NOT NULL,
	ios binary NOT NULL,
	health binary NOT NULL,
	psychology binary NOT NULL,
	game binary NOT NULL,
	FOREIGN KEY(idea_id) REFERENCES idea(id)
);


