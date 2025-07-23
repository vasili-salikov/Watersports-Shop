-- CREATE DATABASE watersportsshop;
USE watersportsshop;
DROP TABLE IF EXISTS EORDERLINE;
DROP TABLE IF EXISTS EORDER;
DROP TABLE IF EXISTS ESTOCK;
DROP TABLE IF EXISTS EMEMBER;

CREATE TABLE EMEMBER (
	memberno INT(6) NOT NULL auto_increment,
	forename VARCHAR(20),
	surname VARCHAR(20),
    username VARCHAR(30),
    password VARCHAR(40),
	street VARCHAR(40),
	town VARCHAR(20),
	postcode VARCHAR(10),
	email VARCHAR(40),
	category VARCHAR(6),
	PRIMARY KEY (memberno)
);

INSERT INTO EMEMBER (memberno, forename, surname, username, password, street, town, postcode, email, category) 
VALUES 
( '123980','Chrispoher','Brown','cbrown','5f4dcc3b5aa765d61d8327deb882cf99','12 High Street','Perth','PH3 WE4','c.brown@nomail.com','gold'),
( '345637','Anne','Greenfield','agreenfield','5f4dcc3b5aa765d61d8327deb882cf99','7 George Street','Perth','PH1 4ER','anne.greenfield@yahoo.co.uk','silver'),
( '456389','Gillian','Higgins','ghiggins','5f4dcc3b5aa765d61d8327deb882cf99','8A Princess Rd','Dundee','DD7 2WE','g.higgins@hotmail.com','bronze'),
( '659000','Hannah','Bluefish','hbluefish','5f4dcc3b5aa765d61d8327deb882cf99','101 Queens Rd','Perth','PH2 3ZX','blue.hannah@goal.com','gold'),
( '231901','Teresa','Edwards','tedwards','5f4dcc3b5aa765d61d8327deb882cf99','4 St Johns Rd','Dundee','DD1 RT5','t.eddy@yahoo.co.uk','bronze');

create table ESTOCK(
	stockno VARCHAR(5) NOT NULL,
	description VARCHAR(40),
	price DECIMAL(10,2),
	qtyinstock INT(6),
	PRIMARY KEY (stockno)
);

INSERT INTO ESTOCK (stockno, description, price, qtyinstock)
VALUES
('EG334', 'Firefox Twin Turbo', 600.00, 20),
('HG602', 'Life Jackets Mk4', 200.00, 50),
('SH990', 'Waterproof Shoes', 35.00, 100),
('SP120', 'Galaxy Open Topped', 500.00, 3),
('WS980', '5mm Long Sleeved Nordic', 350.00, 40),
('GD500', 'Ladies Monoski', 250.00, 40),
('GD550', 'Ladies Monoski II', 300.00, 40);

create table EORDER(
	orderno INT(8) AUTO_INCREMENT NOT NULL,
	memberno INT(6) NOT NULL,
	PRIMARY KEY (orderno),
	FOREIGN KEY (memberno) REFERENCES EMEMBER(memberno)
);

CREATE TABLE EORDERLINE (
	orderno INT(8) NOT NULL,
	stockno VARCHAR(5) NOT NULL,
    quantity INT(6),
	PRIMARY KEY (orderno,stockno),
	FOREIGN KEY (orderno) REFERENCES EORDER(orderno),
	FOREIGN KEY (stockno) REFERENCES ESTOCK(stockno)
);




