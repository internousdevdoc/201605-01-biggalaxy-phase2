drop database if exists biggalaxy;

create database biggalaxy;

use biggalaxy;

SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS administer;
DROP TABLE IF EXISTS order_info;
DROP TABLE IF EXISTS creditcard;
DROP TABLE IF EXISTS sign_out_reason;
DROP TABLE IF EXISTS ticket_info;
DROP TABLE IF EXISTS user_info;





/* Create Tables */

CREATE TABLE administer
(
	id varchar(10) NOT NULL,
	password varchar(10) NOT NULL,
	login boolean NOT NULL
);


CREATE TABLE creditcard
(
	creditcard_id int(8) NOT NULL AUTO_INCREMENT,
	user_id int(8) NOT NULL,
	company int(1) NOT NULL,
	number bigint(16) NOT NULL,
	name varchar(50) NOT NULL,
	year varchar(2) NOT NULL,
	month varchar(2) NOT NULL,
	code int(4) NOT NULL,
	PRIMARY KEY (creditcard_id)
);


CREATE TABLE order_info
(
	ticket_id int(8) NOT NULL,
	quantity int(8) NOT NULL,
	total int(8) NOT NULL,
	method int(1) NOT NULL,
	creditcard_id int(8),
	purchase timestamp DEFAULT current_timestamp NOT NULL,
	user_id int(8) NOT NULL
);


CREATE TABLE sign_out_reason
(
	a int(3) DEFAULT 0,
	b int(3) DEFAULT 0,
	c int(3) DEFAULT 0,
	d int(3) DEFAULT 0,
	e int(3) DEFAULT 0,
	other text
);


CREATE TABLE ticket_info
(
	ticket_id int(8) NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	date date NOT NULL,
	time varchar(50) NOT NULL,
	stock int(6) NOT NULL,
	unit_price int(5) NOT NULL,
	detail text NOT NULL,
	PRIMARY KEY (ticket_id)
);


CREATE TABLE user_info
(
	user_id int(8) NOT NULL AUTO_INCREMENT,
	name varchar(1000) NOT NULL,
	phonetic varchar(1000) NOT NULL,
	password varchar(16) NOT NULL,
	e_mail varchar(100) NOT NULL,
	tel_num varchar(11) NOT NULL,
	postal varchar(9) NOT NULL,
	address varchar(100) NOT NULL,
	unique_id varchar(30),
	PRIMARY KEY (user_id),
	UNIQUE (e_mail),
	UNIQUE (unique_id)
);



/* Create Foreign Keys */

ALTER TABLE order_info
	ADD FOREIGN KEY (creditcard_id)
	REFERENCES creditcard (creditcard_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE order_info
	ADD FOREIGN KEY (ticket_id)
	REFERENCES ticket_info (ticket_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE creditcard
	ADD FOREIGN KEY (user_id)
	REFERENCES user_info (user_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE order_info
	ADD FOREIGN KEY (user_id)
	REFERENCES user_info (user_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;



