\c postgres;
drop database inventory;

create database inventory;
\c inventory;
create extension pgcrypto;

create table supplier (
	supplierid BIGSERIAL PRIMARY KEY UNIQUE,
	full_name VARCHAR(100) NOT NULL,
	location VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);
insert into supplier (supplierid, full_name, location, email) values (1, 'Twinte', 'France', 'amonsey0@bigcartel.com');
insert into supplier (supplierid, full_name, location, email) values (2, 'Katz', 'Latvia', 'fsearchfield1@nsw.gov.au');
insert into supplier (supplierid, full_name, location, email) values (3, 'Lazz', 'Saudi Arabia', 'ksalkild2@w3.org');
insert into supplier (supplierid, full_name, location, email) values (4, 'Flipstorm', 'Argentina', 'cgwillym3@ezinearticles.com');
insert into supplier (supplierid, full_name, location, email) values (5, 'Pixonyx', 'United States', 'atewnion4@omniture.com');
insert into supplier (supplierid, full_name, location, email) values (6, 'Demizz', 'Indonesia', 'awiddowes5@netlog.com');
insert into supplier (supplierid, full_name, location, email) values (7, 'Camimbo', 'Sweden', 'btoupe6@squarespace.com');
insert into supplier (supplierid, full_name, location, email) values (8, 'Flipopia', 'Czech Republic', 'deggerton7@va.gov');
insert into supplier (supplierid, full_name, location, email) values (9, 'Leexo', 'China', 'sisherwood8@flickr.com');
insert into supplier (supplierid, full_name, location, email) values (10, 'Babbleblab', 'France', 'arobson9@vkontakte.ru');
insert into supplier (supplierid, full_name, location, email) values (11, 'Kazio', 'Brazil', 'divashkina@mozilla.org');
insert into supplier (supplierid, full_name, location, email) values (12, 'Yakidoo', 'Indonesia', 'amonteithb@phoca.cz');
insert into supplier (supplierid, full_name, location, email) values (13, 'Quire', 'Indonesia', 'cscarsbrickc@youtu.be');
insert into supplier (supplierid, full_name, location, email) values (14, 'Linktype', 'Kazakhstan', 'mpounsettd@cyberchimps.com');
insert into supplier (supplierid, full_name, location, email) values (15, 'Jaloo', 'Senegal', 'awhorlowe@behance.net');
insert into supplier (supplierid, full_name, location, email) values (16, 'Aivee', 'Brazil', 'tkingscottf@wikia.com');
insert into supplier (supplierid, full_name, location, email) values (17, 'Zoovu', 'Indonesia', 'vhalcrog@oaic.gov.au');
insert into supplier (supplierid, full_name, location, email) values (18, 'Skiptube', 'Brazil', 'nmegaheyh@wired.com');
insert into supplier (supplierid, full_name, location, email) values (19, 'Linklinks', 'France', 'rattridei@photobucket.com');
insert into supplier (supplierid, full_name, location, email) values (20, 'Zava', 'China', 'cbritziusj@tinypic.com');

create table category (
	category_id BIGSERIAL PRIMARY KEY UNIQUE,
	category_name VARCHAR(50) NOT NULL UNIQUE
);
insert into category (category_id, category_name) values (1, 'HATS');
insert into category (category_id, category_name) values (2, 'JACKETS');
insert into category (category_id, category_name) values (3, 'SNEAKERS');
insert into category (category_id, category_name) values (4, 'WOMENS');
insert into category (category_id, category_name) values (5, 'MENS');

-- Rating, Description, User reviews

create table product (
	productid BIGSERIAL PRIMARY KEY ,
	product_name VARCHAR(50) NOT NULL,
	sell_price DECIMAL(6,2) NOT NULL,
	category_id INT NOT NULL,
    CONSTRAINT FK_CategoryDd FOREIGN KEY (category_id) REFERENCES category(category_id),
    CHECK (sell_price>0)
);
-- HATS
insert into product ( product_name, sell_price, category_id) values ('Brown Brim', 25.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Blue Beanie', 18.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Brown Cowboy', 35.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Grey Brim', 25.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Green Beanie', 18.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Palm Tree Cap', 14.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Red Beanie', 18.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Wolf Cap', 14.00, 1);
insert into product ( product_name, sell_price, category_id) values ('Blue Snapback', 16.00, 1);

-- Jackets
insert into product ( product_name, sell_price, category_id) values ( 'Black Jean Shearling', 125.00, 2);
insert into product ( product_name, sell_price, category_id) values ( 'Blue Jean Jacket', 90.00, 2);
insert into product ( product_name, sell_price, category_id) values ( 'Grey Jean Jacket', 90.00, 2);
insert into product ( product_name, sell_price, category_id) values ( 'Brown  Shearling', 165.00, 2);
insert into product ( product_name, sell_price, category_id) values ( 'Tan Trench', 185.00, 2);

--SNEAKERS
insert into product (product_name, sell_price, category_id) values ('Adidas NMD', 220.00, 3);
insert into product (product_name, sell_price, category_id) values ('Adidas Yeezy', 280.00, 3);
insert into product (product_name, sell_price, category_id) values ('Black Converse', 110.00, 3);
insert into product (product_name, sell_price, category_id) values ('Nike White AirForce', 160.00, 3);
insert into product (product_name, sell_price, category_id) values ('Nike Red High Tops', 160.00, 3);
insert into product (product_name, sell_price, category_id) values ('Nike Brown High Tops', 160.00, 3);
insert into product (product_name, sell_price, category_id) values ('Air Jordan Limited', 190.00, 3);
insert into product (product_name, sell_price, category_id) values ('Timberlands', 200.00, 3);
-- WOMENS
insert into product (product_name, sell_price, category_id) values ('Blue Tanktop', 25.00, 4);
insert into product (product_name, sell_price, category_id) values ('Floral Blouse', 20.00, 4);
insert into product (product_name, sell_price, category_id) values ('Floral Dress', 80.00, 4);
insert into product (product_name, sell_price, category_id) values ('Red Dots Dress', 80.00, 4);
insert into product (product_name, sell_price, category_id) values ('Striped Sweater', 45.00, 4);
insert into product (product_name, sell_price, category_id) values ('Yellow Track Suit', 135.00, 4);
insert into product (product_name, sell_price, category_id) values ('White Blouse', 20.00, 4);
-- MENS
insert into product (product_name, sell_price, category_id) values ('Camo Down Vest', 325.00, 5);
insert into product (product_name, sell_price, category_id) values ('Floral T-shirt', 20.00, 5);
insert into product (product_name, sell_price, category_id) values ('Black & White Longsleeve', 25.00, 5);
insert into product (product_name, sell_price, category_id) values ('Pink T-shirt', 25.00, 5);
insert into product (product_name, sell_price, category_id) values ('Jean Long Sleeve', 40.00, 5);
insert into product (product_name, sell_price, category_id) values ('Burgundy T-shirt', 25.00, 5);

create table costprice(
    productid BIGSERIAL UNIQUE,
	cost_price DECIMAL(6,2) NOT NULL,
    CONSTRAINT FK_Productid FOREIGN KEY (productid) REFERENCES product(productid),
    CHECK (cost_price>0)
);
insert into costprice(productid,cost_price) values (1, 10);
insert into costprice(productid,cost_price) values (2, 10);
insert into costprice(productid,cost_price) values (3, 10);
insert into costprice(productid,cost_price) values (4, 10);
insert into costprice(productid,cost_price) values (5, 10);
insert into costprice(productid,cost_price) values (6, 10);
insert into costprice(productid,cost_price) values (7, 10);
insert into costprice(productid,cost_price) values (8, 10);
insert into costprice(productid,cost_price) values (9, 10);
insert into costprice(productid,cost_price) values (10, 10);
insert into costprice(productid,cost_price) values (11, 10);
insert into costprice(productid,cost_price) values (12, 10);
insert into costprice(productid,cost_price) values (13, 10);
insert into costprice(productid,cost_price) values (14, 10);
insert into costprice(productid,cost_price) values (15, 10);
insert into costprice(productid,cost_price) values (16, 10);
insert into costprice(productid,cost_price) values (17, 10);
insert into costprice(productid,cost_price) values (18, 10);
insert into costprice(productid,cost_price) values (19, 10);
insert into costprice(productid,cost_price) values (20, 10);
insert into costprice(productid,cost_price) values (21, 10);
insert into costprice(productid,cost_price) values (22, 10);
insert into costprice(productid,cost_price) values (23, 10);
insert into costprice(productid,cost_price) values (24, 10);
insert into costprice(productid,cost_price) values (25, 10);
insert into costprice(productid,cost_price) values (26, 10);
insert into costprice(productid,cost_price) values (27, 10);
insert into costprice(productid,cost_price) values (28, 10);
insert into costprice(productid,cost_price) values (29, 10);
insert into costprice(productid,cost_price) values (30, 10);
insert into costprice(productid,cost_price) values (31, 10);
insert into costprice(productid,cost_price) values (32, 10);
insert into costprice(productid,cost_price) values (33, 10);
insert into costprice(productid,cost_price) values (34, 10);
insert into costprice(productid,cost_price) values (35, 10);


create table currentstock(
    productid INT NOT NULL,
    quantity int not NULL,
    CONSTRAINT FK_ProductCode FOREIGN KEY (productid) REFERENCES product(productid),
    CHECK (quantity>=0)
);
-- for i in range(2000,2020):
--   print('insert into currentstock (productid, quantity) values ('+ str(i) +', '+  str(random.randint(10,35)) +');')
insert into currentstock (productid, quantity) values (0, 30);
insert into currentstock (productid, quantity) values (1, 30);
insert into currentstock (productid, quantity) values (2, 30);
insert into currentstock (productid, quantity) values (3, 23);
insert into currentstock (productid, quantity) values (4, 17);
insert into currentstock (productid, quantity) values (5, 16);
insert into currentstock (productid, quantity) values (6, 12);
insert into currentstock (productid, quantity) values (7, 20);
insert into currentstock (productid, quantity) values (8, 34);
insert into currentstock (productid, quantity) values (9, 25);
insert into currentstock (productid, quantity) values (10, 14);
insert into currentstock (productid, quantity) values (11, 35);
insert into currentstock (productid, quantity) values (12, 11);
insert into currentstock (productid, quantity) values (13, 34);
insert into currentstock (productid, quantity) values (14, 19);
insert into currentstock (productid, quantity) values (15, 16);
insert into currentstock (productid, quantity) values (16, 15);
insert into currentstock (productid, quantity) values (17, 28);
insert into currentstock (productid, quantity) values (18, 29);
insert into currentstock (productid, quantity) values (19, 15);
insert into currentstock (productid, quantity) values (20, 35);
insert into currentstock (productid, quantity) values (21, 24);
insert into currentstock (productid, quantity) values (22, 20);
insert into currentstock (productid, quantity) values (23, 33);
insert into currentstock (productid, quantity) values (24, 11);
insert into currentstock (productid, quantity) values (25, 33);
insert into currentstock (productid, quantity) values (26, 14);
insert into currentstock (productid, quantity) values (27, 21);
insert into currentstock (productid, quantity) values (28, 13);
insert into currentstock (productid, quantity) values (29, 27);
insert into currentstock (productid, quantity) values (30, 22);
insert into currentstock (productid, quantity) values (31, 30);
insert into currentstock (productid, quantity) values (32, 19);
insert into currentstock (productid, quantity) values (33, 20);

create table purchaseinfo(
    purchaseid BIGSERIAL PRIMARY KEY UNIQUE,
    supplierid INT NOT NULL,
    productid INT NOT NULL,
    date varchar(45) not null default CURRENT_TIMESTAMP,
    quantity int not null,
    totalcost int not null,
    CONSTRAINT FK_ProductId FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_SupplierId FOREIGN KEY (supplierid) REFERENCES supplier(supplierid),
    CHECK(quantity>0),
    CHECK(totalcost>0)
);

create table customer (
	id BIGSERIAL PRIMARY KEY UNIQUE ,
	name text NOT NULL,
	email text NOT NULL,
    CHECK (email ~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);
insert into customer (id, name, email) values (1, 'Aubrie Raubenheim', 'c@c.com');
insert into customer (id, name, email) values (2, 'Salvador Cockran', 'scockran1@cloudflare.com');
insert into customer (id, name, email) values (3, 'Kamillah Neward', 'kneward2@house.gov');
insert into customer (id, name, email) values (4, 'Ninon Frissell', 'nfrissell3@pinterest.com');
insert into customer (id, name, email) values (5, 'Calvin Oldacre', 'coldacre4@cafepress.com');

create table password(
    customer_id BIGSERIAL UNIQUE,
    password text NOT NULL,
    CONSTRAINT FK_CustomerID FOREIGN KEY (customer_id) REFERENCES customer(id)
);
insert into password (customer_id,password) values (1,crypt('root',gen_salt('md5')));
insert into password (customer_id,password) values (2,crypt('root',gen_salt('md5')));
insert into password (customer_id,password) values (3,crypt('root',gen_salt('md5')));
insert into password (customer_id,password) values (4,crypt('root',gen_salt('md5')));
insert into password (customer_id,password) values (5,crypt('root',gen_salt('md5')));


create table salesinfo(
    saleid BIGSERIAL PRIMARY KEY UNIQUE,
    date varchar(45) NOT NULL default CURRENT_TIMESTAMP,
    productid INT NOT NULL,
    customer_id BIGSERIAL UNIQUE,
    quantity int not null,
    totalcost int not null,
    payment_method varchar(45) not null default 'credit card',
    CONSTRAINT FK_ProductId FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_CustomerCode FOREIGN KEY (customer_id) REFERENCES customer(id),
    CHECK(quantity>0),
    CHECK(totalcost>0)
);
