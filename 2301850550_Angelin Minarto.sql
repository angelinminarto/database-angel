
-- NAMA : ANGELIN MINARTO
-- NIM : 2301850550
-- START

CREATE DATABASE ASG
USE ASG

-- DDL
CREATE TABLE Author
(
	Author_Name VARCHAR (255),
	Author_Address VARCHAR (255),
	Author_URL VARCHAR (255),
	PRIMARY KEY(Author_Name, Author_Address)
)

CREATE TABLE Publisher
(
	Publisher_Name VARCHAR (255),
	Publisher_Address VARCHAR (255),
	Publisher_Phone VARCHAR (255),
	Publisher_URL INT,
	PRIMARY KEY (Publisher_Name)
)

CREATE TABLE Book
(
	Book_ISBN VARCHAR(255),
	Publisher_Name VARCHAR(255) FOREIGN KEY REFERENCES Publisher(Publisher_Name),
	Author_Name VARCHAR(255),
	Author_Address VARCHAR(255),
	Book_Year INT CHECK(Book_Year >= 2000),
	Title VARCHAR(255),
	Price NUMERIC(19,2) CHECK(Price >= 10000 AND Price <= 100000),
	PRIMARY KEY (Book_ISBN),
	FOREIGN KEY(Author_Name, Author_Address) REFERENCES Author(Author_Name,Author_Address)
)

CREATE TABLE Customer
(
	Customer_Email VARCHAR(255),
	Customer_Name VARCHAR(255),
	Customer_Phone VARCHAR(255),
	Customer_Address VARCHAR(255),
	PRIMARY KEY (Customer_Email)
)

-- WILDCARD
-- CREATE TABLE ShoppingBasket
-- (
-- 	ShoppingBasket_ID CHAR(12) CHECK(LEFT(ShoppingBasket_ID, 1) LIKE 'P%' AND SUBSTRING(ShoppingBasket_ID, 2, 11) LIKE'%[0-9]'),  //berarti angka 0-9
-- 	Customer_Email VARCHAR(255) FOREIGN KEY REFERENCES Customer(Customer_Email),
-- 	PRIMARY KEY (ShoppingBasket_ID)
-- )

-- CREATE TABLE ShoppingBasket
-- (
-- 	ShoppingBasket_ID CHAR(12) CHECK(LEFT(ShoppingBasket_ID, 1) LIKE 'P%' AND SUBSTRING(ShoppingBasket_ID, 2, 11) LIKE'%[^0-9]'),  //berarti angka 0-9 tidak digunakan hanya huruf dan simbol yg ditampilkan
-- 	Customer_Email VARCHAR(255) FOREIGN KEY REFERENCES Customer(Customer_Email),
-- 	PRIMARY KEY (ShoppingBasket_ID)
-- )

CREATE TABLE ShoppingBasket
(
	ShoppingBasket_ID CHAR(12) CHECK(ShoppingBasket_ID LIKE 'P[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Customer_Email VARCHAR(255) FOREIGN KEY REFERENCES Customer(Customer_Email),
	PRIMARY KEY (ShoppingBasket_ID)
)

CREATE TABLE ShoppingBasketBook
(
	ShoppingBasket_ID CHAR(12),
	Book_ISBN VARCHAR(255),
	ShoppingBasketBook_Count INT,
	PRIMARY KEY(ShoppingBasket_ID, Book_ISBN),
	FOREIGN KEY(ShoppingBasket_ID) REFERENCES ShoppingBasket(ShoppingBasket_ID),
	FOREIGN KEY(Book_ISBN) REFERENCES Book(Book_ISBN),
)

-- DML
INSERT INTO Customer 
VALUES('veve@gmail.com', 'veve', '081234567890', 'Jl. Pupus'), ('hana@gmail.com', 'hana', '082345678901','Jl. Lara')
INSERT INTO Customer
VALUES('jose@gmail.com', 'jose', '084321567890', 'Jl. JNE'), ('nindi@gmail.com', 'nindi', '080987654123', 'Jl. Kesedihan')
INSERT INTO Customer
VALUES('lara@gmail.com', 'lara', '083345678901', 'Jl. Remuk Hati'), 
INSERT INTO Customer
VALUES('test@gmail.com', 'test', '087645274981', 'Jl. Kaya')
SELECT * FROM Customer

INSERT INTO ShoppingBasket
VALUES('P21232454940','veve@gmail.com'), ('P21224519109','hana@gmail.com')
INSERT INTO ShoppingBasket
VALUES('P21234563104','jose@gmail.com'), ('P21234549139','nindi@gmail.com')
INSERT INTO ShoppingBasket
VALUES('P21234569109','lara@gmail.com')
SELECT * FROM ShoppingBasket

INSERT INTO Author
VALUES('angel','Jalan ala','www.book1.com'), ('friska','Jalan bela','www.book2.com')
INSERT INTO Author
VALUES('lula','Jalan cela','www.book3.com'), ('lulafah','Jalan dela','www.book4.com')
INSERT INTO Author
VALUES('karin','Jalan ela','www.book5.com')
SELECT * FROM Author

INSERT INTO Publisher
VALUES('vanni','Jalan aaaa','0234560987124',45637899), ('vanno','Jalan bebe','01928473019285',123451267)
INSERT INTO Publisher
VALUES('vinna','Jalan cece','0874593128654',98645923), ('vonna','Jalan dede','0713985494103',90842315)
INSERT INTO Publisher
VALUES('vinta','Jalan eeee','0312960475923',75301284),
SELECT * FROM Publisher

INSERT INTO Book
VALUES('324234325','vinta','lula','Jalan cela',2002,'Pupus',90000), ('324223425','vanni','lulafah','Jalan dela',2002,'Aku Siapa',91000)
INSERT INTO Book
VALUES('324223430','vonna','karin','Jalan ela',2019,'Siapakah Dia',60000), ('324223427','vanno','angel','Jalan ala',2014,'Payung Teduh',59000)
INSERT INTO Book
VALUES('324223429','vinna','friska','Jalan bela',2001,'Lara',12400)
INSERT INTO Book
VALUES('324223433', 'vonna', 'karin', 'Jalan ela',2019,'Siapakah Dia',60000)
SELECT * FROM Book

INSERT INTO ShoppingBasketBook
VALUES('P21232454940','324234325',8), ('P21224519109','324223425',12)
INSERT INTO ShoppingBasketBook
VALUES('P21234563104','324223430',24), ('P21234549139','324223427',4)
INSERT INTO ShoppingBasketBook
VALUES('P21234569109','324223429',28)
SELECT * FROM ShoppingBasketBook

UPDATE Book
SET Price = Price * 105.0 / 100.0
SELECT * FROM Book

-- 2. Relation Algebra
-- a.
SELECT * FROM Book
WHERE Book_Year >= 2015

-- b.
SELECT * FROM ShoppingBasket sb
JOIN Customer c 
ON sb.Customer_Email = c.Customer_Email

-- c.
-- tabel 1
SELECT Customer_Email
FROM Customer
INTERSECT
-- tabel 2
SELECT Customer_Email
FROM ShoppingBasket

-- d.
-- tabel 1
SELECT Book_ISBN
FROM Book
EXCEPT
-- tabel 2
SELECT Book_ISBN
FROM ShoppingBasketBook

-- END
-- ANGELIN MINARTO / 2301850550