create database inventory;
\c inventory;

create table supplier (
	sid BIGSERIAL PRIMARY KEY UNIQUE,
	suppliercode INT NOT NULL UNIQUE,
	full_name VARCHAR(100) NOT NULL,
	location VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);
insert into supplier (sid, suppliercode, full_name, location, email) values (1, 1001, 'Twinte', 'France', 'amonsey0@bigcartel.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (2, 1002, 'Katz', 'Latvia', 'fsearchfield1@nsw.gov.au');
insert into supplier (sid, suppliercode, full_name, location, email) values (3, 1003, 'Lazz', 'Saudi Arabia', 'ksalkild2@w3.org');
insert into supplier (sid, suppliercode, full_name, location, email) values (4, 1004, 'Flipstorm', 'Argentina', 'cgwillym3@ezinearticles.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (5, 1005, 'Pixonyx', 'United States', 'atewnion4@omniture.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (6, 1006, 'Demizz', 'Indonesia', 'awiddowes5@netlog.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (7, 1007, 'Camimbo', 'Sweden', 'btoupe6@squarespace.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (8, 1008, 'Flipopia', 'Czech Republic', 'deggerton7@va.gov');
insert into supplier (sid, suppliercode, full_name, location, email) values (9, 1009, 'Leexo', 'China', 'sisherwood8@flickr.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (10, 1010, 'Babbleblab', 'France', 'arobson9@vkontakte.ru');
insert into supplier (sid, suppliercode, full_name, location, email) values (11, 1011, 'Kazio', 'Brazil', 'divashkina@mozilla.org');
insert into supplier (sid, suppliercode, full_name, location, email) values (12, 1012, 'Yakidoo', 'Indonesia', 'amonteithb@phoca.cz');
insert into supplier (sid, suppliercode, full_name, location, email) values (13, 1013, 'Quire', 'Indonesia', 'cscarsbrickc@youtu.be');
insert into supplier (sid, suppliercode, full_name, location, email) values (14, 1014, 'Linktype', 'Kazakhstan', 'mpounsettd@cyberchimps.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (15, 1015, 'Jaloo', 'Senegal', 'awhorlowe@behance.net');
insert into supplier (sid, suppliercode, full_name, location, email) values (16, 1016, 'Aivee', 'Brazil', 'tkingscottf@wikia.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (17, 1017, 'Zoovu', 'Indonesia', 'vhalcrog@oaic.gov.au');
insert into supplier (sid, suppliercode, full_name, location, email) values (18, 1018, 'Skiptube', 'Brazil', 'nmegaheyh@wired.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (19, 1019, 'Linklinks', 'France', 'rattridei@photobucket.com');
insert into supplier (sid, suppliercode, full_name, location, email) values (20, 1020, 'Zava', 'China', 'cbritziusj@tinypic.com');

create table category (
	category_id BIGSERIAL PRIMARY KEY UNIQUE,
	category_name VARCHAR(50) NOT NULL UNIQUE
);
insert into category (category_id, category_name) values (1, 'HATS');
insert into category (category_id, category_name) values (2, 'JACKETS');
insert into category (category_id, category_name) values (3, 'SNEAKERS');
insert into category (category_id, category_name) values (4, 'WOMENS');
insert into category (category_id, category_name) values (5, 'MENS');

create table product (
	pid BIGSERIAL PRIMARY KEY UNIQUE,
	product_code INT NOT NULL UNIQUE,
	product_name VARCHAR(50) NOT NULL,
	sell_price DECIMAL(6,2) NOT NULL,
	category_id VARCHAR(50)
);
-- HATS
insert into product (pid, product_code, product_name, sell_price, category_id) values (1, 2000, 'Brown Brim', 25.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (2, 2001, 'Blue Beanie', 18.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (3, 2002, 'Brown Cowboy', 35.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (4, 2003, 'Grey Brim', 25.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (5, 2004, 'Green Beanie', 18.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (6, 2005, 'Palm Tree Cap', 14.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (7, 2006, 'Red Beanie', 18.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (8, 2007, 'Wolf Cap', 14.00, 1);
insert into product (pid, product_code, product_name, sell_price, category_id) values (9, 2008, 'Blue Snapback', 16.00, 1);

-- Jackets
insert into product (pid, product_code, product_name, sell_price, category_id) values (10, 2009, 'Black Jean Shearling', 125.00, 2);
insert into product (pid, product_code, product_name, sell_price, category_id) values (11, 2010, 'Blue Jean Jacket', 90.00, 2);
insert into product (pid, product_code, product_name, sell_price, category_id) values (12, 2011, 'Grey Jean Jacket', 90.00, 2);
insert into product (pid, product_code, product_name, sell_price, category_id) values (13, 2012, 'Brown  Shearling', 165.00, 2);
insert into product (pid, product_code, product_name, sell_price, category_id) values (14, 2013, 'Tan Trench', 185.00, 2);

--SNEAKERS
insert into product (pid, product_code, product_name, sell_price, category_id) values (15, 2014, 'Adidas NMD', 220.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (16, 2015, 'Adidas Yeezy', 280.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (17, 2016, 'Black Converse', 110.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (18, 2017, 'Nike White AirForce', 160.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (19, 2018, 'Nike Red High Tops', 160.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (20, 2019, 'Nike Brown High Tops', 160.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (21, 2020, 'Air Jordan Limited', 190.00, 3);
insert into product (pid, product_code, product_name, sell_price, category_id) values (22, 2021, 'Timberlands', 200.00, 3);
-- WOMENS
insert into product (pid, product_code, product_name, sell_price, category_id) values (23, 2022, 'Blue Tanktop', 25.00, 4);
insert into product (pid, product_code, product_name, sell_price, category_id) values (24, 2023, 'Floral Blouse', 20.00, 4);
insert into product (pid, product_code, product_name, sell_price, category_id) values (25, 2024, 'Floral Dress', 80.00, 4);
insert into product (pid, product_code, product_name, sell_price, category_id) values (26, 2025, 'Red Dots Dress', 80.00, 4);
insert into product (pid, product_code, product_name, sell_price, category_id) values (27, 2026, 'Striped Sweater', 45.00, 4);
insert into product (pid, product_code, product_name, sell_price, category_id) values (28, 2027, 'Yellow Track Suit', 135.00, 4);
insert into product (pid, product_code, product_name, sell_price, category_id) values (29, 2028, 'White Blouse', 20.00, 4);
-- MENS
insert into product (pid, product_code, product_name, sell_price, category_id) values (30, 2029, 'Camo Down Vest', 325.00, 5);
insert into product (pid, product_code, product_name, sell_price, category_id) values (31, 2030, 'Floral T-shirt', 20.00, 5);
insert into product (pid, product_code, product_name, sell_price, category_id) values (32, 2031, 'Black & White Longsleeve', 25.00, 5);
insert into product (pid, product_code, product_name, sell_price, category_id) values (33, 2032, 'Pink T-shirt', 25.00, 5);
insert into product (pid, product_code, product_name, sell_price, category_id) values (34, 2033, 'Jean Long Sleeve', 40.00, 5);
insert into product (pid, product_code, product_name, sell_price, category_id) values (35, 2034, 'Burgundy T-shirt', 25.00, 5);



create table currentstock(
    product_code INT NOT NULL,
    quantity int not NULL,
    CONSTRAINT FK_ProductCode FOREIGN KEY (product_code) REFERENCES product(product_code)
);
-- for i in range(2000,2020):
--   print('insert into currentstock (product_code, quantity) values ('+ str(i) +', '+  str(random.randint(10,35)) +');')
insert into currentstock (product_code, quantity) values (2000, 30);
insert into currentstock (product_code, quantity) values (2001, 30);
insert into currentstock (product_code, quantity) values (2002, 30);
insert into currentstock (product_code, quantity) values (2003, 23);
insert into currentstock (product_code, quantity) values (2004, 17);
insert into currentstock (product_code, quantity) values (2005, 16);
insert into currentstock (product_code, quantity) values (2006, 12);
insert into currentstock (product_code, quantity) values (2007, 20);
insert into currentstock (product_code, quantity) values (2008, 34);
insert into currentstock (product_code, quantity) values (2009, 25);
insert into currentstock (product_code, quantity) values (2010, 14);
insert into currentstock (product_code, quantity) values (2011, 35);
insert into currentstock (product_code, quantity) values (2012, 11);
insert into currentstock (product_code, quantity) values (2013, 34);
insert into currentstock (product_code, quantity) values (2014, 19);
insert into currentstock (product_code, quantity) values (2015, 16);
insert into currentstock (product_code, quantity) values (2016, 15);
insert into currentstock (product_code, quantity) values (2017, 28);
insert into currentstock (product_code, quantity) values (2018, 29);
insert into currentstock (product_code, quantity) values (2019, 15);
insert into currentstock (product_code, quantity) values (2020, 35);
insert into currentstock (product_code, quantity) values (2021, 24);
insert into currentstock (product_code, quantity) values (2022, 20);
insert into currentstock (product_code, quantity) values (2023, 33);
insert into currentstock (product_code, quantity) values (2024, 11);
insert into currentstock (product_code, quantity) values (2025, 33);
insert into currentstock (product_code, quantity) values (2026, 14);
insert into currentstock (product_code, quantity) values (2027, 21);
insert into currentstock (product_code, quantity) values (2028, 13);
insert into currentstock (product_code, quantity) values (2029, 27);
insert into currentstock (product_code, quantity) values (2030, 22);
insert into currentstock (product_code, quantity) values (2031, 30);
insert into currentstock (product_code, quantity) values (2032, 19);
insert into currentstock (product_code, quantity) values (2033, 20);

create table purchaseinfo(
    purchaseid BIGSERIAL PRIMARY KEY UNIQUE,
    suppliercode INT NOT NULL,
    product_code INT NOT NULL,
    date varchar(45) not null default CURRENT_TIMESTAMP,
    quantity int not null,
    totalcost int not null,
    CONSTRAINT FK_Product_Code FOREIGN KEY (product_code) REFERENCES product(product_code),
    CONSTRAINT FK_SupplierCode FOREIGN KEY (suppliercode) REFERENCES supplier(suppliercode)
);

create table customer (
	id BIGSERIAL PRIMARY KEY UNIQUE,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(50)  NOT NULL
);
insert into customer (id, name, email, password) values (1, 'Aubrie Raubenheim', 'c@c.com', 'root');
insert into customer (id, name, email, password) values (2, 'Salvador Cockran', 'scockran1@cloudflare.com', 'root');
insert into customer (id, name, email, password) values (3, 'Kamillah Neward', 'kneward2@house.gov', 'root');
insert into customer (id, name, email, password) values (4, 'Ninon Frissell', 'nfrissell3@pinterest.com', 'root');
insert into customer (id, name, email, password) values (5, 'Calvin Oldacre', 'coldacre4@cafepress.com', 'root');

create table salesinfo(
    saleid BIGSERIAL PRIMARY KEY UNIQUE,
    date varchar(45) NOT NULL default CURRENT_TIMESTAMP,
    product_code INT NOT NULL,
    customer_id BIGSERIAL UNIQUE,
    quantity int not null,
    totalcost int not null,
    CONSTRAINT FK_Product_Code FOREIGN KEY (product_code) REFERENCES product(product_code),
    CONSTRAINT FK_CustomerCode FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- \c postgres;
-- drop database inventory;
