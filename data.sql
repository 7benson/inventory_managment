\c postgres;
drop database inventory;

create database inventory;
\c inventory;
create extension pgcrypto;

create table address(
    address_id bigserial PRIMARY key,
    address text not null,
    address2 text,
    district text not null,
    city text not null,
    phone text not null,
    last_update text default TIMEOFDAY()
);

insert into address (address_id, address, address2, district, city, phone) values (1, '3170 Anniversary Road', null, 'California', 'Liborina', '643-356-7462');
insert into address (address_id, address, address2, district, city, phone) values (2, '669 Main Street', '4 Del Sol Avenue', 'California', 'Huolianpo', '453-316-5728');
insert into address (address_id, address, address2, district, city, phone) values (3, '6892 Acker Drive', '5076 Boyd Road', 'California', 'Oju', '804-983-4477');
insert into address (address_id, address, address2, district, city, phone) values (4, '91 Crownhardt Court', null, 'California', 'Madang', '912-901-7622');
insert into address (address_id, address, address2, district, city, phone) values (5, '0 Anniversary Hill', '01884 Judy Parkway', 'Pedaringan', 'Huangling', '327-664-8287');
insert into address (address_id, address, address2, district, city, phone) values (6, '24589 Badeau Pass', '715 Sunfield Center', 'Pedaringan', 'Genting', '435-284-7476');
insert into address (address_id, address, address2, district, city, phone) values (7, '2935 Debs Park', '06 Toban Terrace', 'California', 'Nantai', '300-107-3031');
insert into address (address_id, address, address2, district, city, phone) values (8, '39 Dakota Street', null, 'California', 'Pedaringan', '888-468-2150');
insert into address (address_id, address, address2, district, city, phone) values (9, '8554 Ryan Park', null, 'California', 'Fuxin', '771-551-1385');
insert into address (address_id, address, address2, district, city, phone) values (10, '8494 Stang Parkway', null, 'California', 'Long Beach', '310-638-3919');


create table supplier (
	supplierid BIGSERIAL PRIMARY KEY UNIQUE,
	full_name VARCHAR(100) NOT NULL,
	address_id bigserial NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT FK_AddressId FOREIGN KEY (address_id) REFERENCES address(address_id),
    CHECK (email ~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);
insert into supplier (supplierid, full_name, address_id, email) values (1, 'Emyle Keener', 1, 'ekeener0@ebay.com');
insert into supplier (supplierid, full_name, address_id, email) values (2, 'Cherish Cranfield', 2, 'ccranfield1@oracle.com');
insert into supplier (supplierid, full_name, address_id, email) values (3, 'Jaymee Borsnall', 3, 'jborsnall2@networkadvertising.org');
insert into supplier (supplierid, full_name, address_id, email) values (4, 'Darsie Witherspoon', 4, 'dwitherspoon3@nydailynews.com');
insert into supplier (supplierid, full_name, address_id, email) values (5, 'Babb Napoleon', 5, 'bnapoleon4@icq.com');
insert into supplier (supplierid, full_name, address_id, email) values (6, 'Olwen Dove', 6, 'odove5@networksolutions.com');
insert into supplier (supplierid, full_name, address_id, email) values (7, 'Benjamen Gueste', 7, 'bgueste6@china.com.cn');
insert into supplier (supplierid, full_name, address_id, email) values (8, 'Lorilee Goulborne', 8, 'lgoulborne7@vk.com');
insert into supplier (supplierid, full_name, address_id, email) values (9, 'Umeko MacAllester', 9, 'umacallester8@ted.com');
insert into supplier (supplierid, full_name, address_id, email) values (10, 'Fulvia Lindwall', 10, 'flindwall9@paginegialle.it');

create table category (
	category_id BIGSERIAL PRIMARY KEY UNIQUE,
	category_name VARCHAR(50) NOT NULL UNIQUE,
    category_icon BYTEA
);
insert into category (category_id, category_name) values (1, 'MENS');
insert into category (category_id, category_name) values (2, 'WOMENS');
insert into category (category_id, category_name) values (3, 'ELECTRONICS');
insert into category (category_id, category_name) values (4, 'BOOKS');

create table subCategory(
    id bigserial PRIMARY KEY,
    category_id int not null,
    sub_category_name text not null,
    CONSTRAINT FK_CategoryDd FOREIGN KEY (category_id) REFERENCES category(category_id)
);
insert into subCategory(id, category_id, sub_category_name) values (1,1,'Shirts');
insert into subCategory(id, category_id, sub_category_name) values (2,1,'Jeans');
insert into subCategory(id, category_id, sub_category_name) values (3,2,'Watches');
insert into subCategory(id, category_id, sub_category_name) values (4,3,'Mobiles');

create table product (
	productid BIGSERIAL PRIMARY KEY ,
	product_name VARCHAR(50) NOT NULL,
    brand_name VARCHAR(50),
	
    category_id INT NOT NULL,
    subcategory_id INT,
    
    preview_img_id int,

    rating numeric(2,1),
    description text,
    returnable int default 1,
    cashOnDelivery int default 1,
    CHECK (returnable=0 or returnable=1),
    CHECK (cashOnDelivery=0 or cashOnDelivery=1),
    CHECK (rating<=5.0 and rating>=0),
    CONSTRAINT FK_CategoryId FOREIGN KEY (category_id) REFERENCES category(category_id)
    -- CONSTRAINT FK_ImageGalleryId FOREIGN KEY (preview_img_id) REFERENCES image_gallery(id)
);
-- mens , shirts
insert into product(productid,product_name,brand_name,category_id,subcategory_id,description,returnable,cashOnDelivery)
values (1,'U.S. POLO ASSN. Mens Regular fit Casual Shirt','U.S. POLO ASSN.',1,1,'Mens full sleeves.',1,1);

insert into product(productid,product_name,brand_name,category_id,subcategory_id,description,returnable,cashOnDelivery)
values (2,'Van Heusen Mens Slim Shirt','Van Heusen',1,1,'When it comes to mens wear, Van Heusen stands for class, elegance and status.',1,0);

-- mens, jeans
insert into product(productid,product_name,brand_name,category_id,subcategory_id,description,returnable,cashOnDelivery)
values (3,'Peter England Men Jeans','Peter England',1,2,' ',0,0);

insert into product(productid,product_name,brand_name,category_id,subcategory_id,description,returnable,cashOnDelivery)
values (4,'Peter England Mens Skinny Jeans','Peter England',1,2,' ',0,1);

create table image_gallery(
    id bigserial PRIMARY key,
    image BYTEA ,
    file_extension text
);
-- Insert images using python

create table product_gallery_mapper(
    variation_id bigserial,
    gallery_id bigserial,
    product_id bigserial
);

--mens shirts 
insert into product_gallery_mapper values (1,1,1);
insert into product_gallery_mapper values (1,2,1);
insert into product_gallery_mapper values (2,3,1);

insert into product_gallery_mapper values (3,4,2);
insert into product_gallery_mapper values (3,5,2);
insert into product_gallery_mapper values (4,6,2);

-- mens jeans
insert into product_gallery_mapper values (5,7,3);
insert into product_gallery_mapper values (5,8,3);
insert into product_gallery_mapper values (6,9,3);

insert into product_gallery_mapper values (7,10,4);
insert into product_gallery_mapper values (8,11,4);
insert into product_gallery_mapper values (8,12,4);


create table productVariations(
    id bigserial PRIMARY key,
    productid bigserial not null,
    variationName text not null,
    CONSTRAINT FK_Productid FOREIGN KEY (productid) REFERENCES product(productid)
);
-- mens shirts variations
insert into productVariations(id,productid,variationName) values (1,1,'blue color');
insert into productVariations(id,productid,variationName) values (2,1,'green color');

insert into productVariations(id,productid,variationName) values (3,2,'blue color');
insert into productVariations(id,productid,variationName) values (4,2,'green color');

-- mens jeans vartiation
insert into productVariations(id,productid,variationName) values (5,3,'skinny');
insert into productVariations(id,productid,variationName) values (6,3,'regular');

insert into productVariations(id,productid,variationName) values (7,4,'skinny');
insert into productVariations(id,productid,variationName) values (8,4,'regular');

create table productCombinations(
    id BIGSERIAL PRIMARY key,
    combination_string text not null,
    productid bigserial not null,
    
    mrp DECIMAL(6,2) NOT NULL,
    discount int not null default 0,
    sell_price DECIMAL(6,2),
	
    availableStock int not null,
    CONSTRAINT FK_Productid FOREIGN KEY (productid) REFERENCES product(productid)
);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(1,'s-blue',1,2000,10,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(2,'s-green',1,500,12,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(3,'m-blue',1,2500,16,4);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(4,'m-green',1,2060,16,13);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(5,'l-blue',1,2300,20,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(6,'l-green',1,2550,30,10);

insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(7,'s-blue',2,2000,10,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(8,'s-green',2,500,12,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(9,'m-blue',2,2500,16,4);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(10,'m-green',2,2060,16,13);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(11,'l-blue',2,2300,20,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(12,'l-green',2,2550,30,10);

insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(13,'30-skinny',3,1250,10,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(14,'32-skinny',3,1240,20,14);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(15,'30-regular',3,1150,30,30);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(16,'32-regular',3,1270,20,54);

insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(17,'30-skinny',4,1124,10,10);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(18,'32-skinny',4,1422,20,14);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(19,'30-regular',4,1624,30,30);
insert into productCombinations(id,combination_string,productid,mrp,discount,availableStock) values(20,'32-regular',4,1456,20,54);

create table offers(
    productid BIGSERIAL,
    offer_id BIGSERIAL,
    offer_decription text NOT NULL,
    offer_discount int NOT NULL,
    CHECK (offer_discount>=0 or offer_discount<100),
    CONSTRAINT FK_Productid FOREIGN KEY (productid) REFERENCES product(productid)
);

create table costprice(
    cost_price_id bigserial PRIMARY key,
    product_combination_id BIGSERIAL not null,
    productid bigserial not null,
	cost_price DECIMAL(6,2) NOT NULL,
    date_time text default TIMEOFDAY(),
    CONSTRAINT FK_Productid FOREIGN KEY (product_combination_id) REFERENCES productCombinations(id),
    CONSTRAINT FK_ProductCode FOREIGN KEY (productid) REFERENCES product(productid),
    CHECK (cost_price>0)
);
insert into costprice(cost_price_id,product_combination_id,productid,cost_price) values(1,1,1,1000);
insert into costprice(cost_price_id,product_combination_id,productid,cost_price) values(2,2,1,200);
insert into costprice(cost_price_id,product_combination_id,productid,cost_price) values(3,3,1,1520);
insert into costprice(cost_price_id,product_combination_id,productid,cost_price) values(4,4,1,1220);
insert into costprice(cost_price_id,product_combination_id,productid,cost_price) values(5,5,1,1420);
insert into costprice(cost_price_id,product_combination_id,productid,cost_price) values(6,6,1,1520);


create table purchaseinfo(
    purchaseid BIGSERIAL PRIMARY KEY UNIQUE,
    supplierid INT NOT NULL,
    productid INT NOT NULL,
    date varchar(45) not null default CURRENT_TIMESTAMP,
    quantity int not null,
    totalcost int not null,
    product_combination_id BIGSERIAL not null,
    CONSTRAINT FK_ProductId FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_SupplierId FOREIGN KEY (supplierid) REFERENCES supplier(supplierid),
    CONSTRAINT FK_ProductCombinationid FOREIGN KEY (product_combination_id) REFERENCES productCombinations(id),
    CHECK(quantity>0),
    CHECK(totalcost>0)
);

create table customer (
	id BIGSERIAL PRIMARY KEY UNIQUE ,
	name text NOT NULL,
	email text NOT NULL UNIQUE,
    password text NOT NULL,
    CHECK (email ~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);
insert into customer (id, name, email,password) values (1, 'Aubrie Raubenheim', 'c@c.com',crypt('root',gen_salt('md5')));
insert into customer (id, name, email,password) values (2, 'Salvador Cockran', 'scockran1@cloudflare.com',crypt('root',gen_salt('md5')));
insert into customer (id, name, email,password) values (3, 'Kamillah Neward', 'kneward2@house.gov',crypt('root',gen_salt('md5')));
insert into customer (id, name, email,password) values (4, 'Ninon Frissell', 'nfrissell3@pinterest.com',crypt('root',gen_salt('md5')));
insert into customer (id, name, email,password) values (5, 'Calvin Oldacre', 'coldacre4@cafepress.com',crypt('root',gen_salt('md5')));

create table cartItems(
    customer_id BIGSERIAL,
    productid BIGSERIAL,
    product_combination_id bigserial,
    quantity int,
    check(quantity>=1),
    CONSTRAINT FK_customerId FOREIGN KEY (customer_id) REFERENCES customer(id),
    UNIQUE(productid,customer_id,product_combination_id)
);
insert into cartItems(customer_id,productid,product_combination_id,quantity) values(1,1,2,4);

create table reviews(
    productid BIGSERIAL,
    customer_id BIGSERIAL,
    rating int NOT NULL,
    review text,
    CHECK (rating<=5 and rating>=0),
    CONSTRAINT FK_Productid FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_CustomerId FOREIGN KEY (customer_id) REFERENCES customer(id)
);
insert into reviews(productid,customer_id,rating,review) values(1,2,5,'good');

create table customer_addresses(
    customer_id BIGSERIAL not null,
    address_id bigserial not null,
    CONSTRAINT FK_CustomerId FOREIGN KEY (customer_id) REFERENCES customer(id),
    CONSTRAINT FK_AddressId FOREIGN KEY (address_id) REFERENCES address(address_id)
);
insert into customer_addresses values (2,10);
insert into customer_addresses values (1,6);
insert into customer_addresses values (4,8);

create table salesinfo(
    saleid BIGSERIAL PRIMARY KEY UNIQUE,
    date varchar(45) NOT NULL default CURRENT_TIMESTAMP,
    productid INT NOT NULL,
    product_combination_id bigserial not null,
    customer_id BIGSERIAL UNIQUE,
    quantity int not null,
    totalcost int not null,
    final_cost_after_discount int not null,
    payment_method varchar(45) not null default 'credit card',
    stateOfPackage text not null,
    trackingId text not null, 
    CONSTRAINT FK_ProductId FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_ProductCombinationid FOREIGN KEY (product_combination_id) REFERENCES productCombinations(id),
    CONSTRAINT FK_CustomerCode FOREIGN KEY (customer_id) REFERENCES customer(id),
    CHECK(quantity>0),
    CHECK(totalcost>0),
    CHECK(final_cost_after_discount>0)
);

create table managers(
    manager_id bigserial PRIMARY KEY,
    manager_name text not null,
    phone text not null,
    email text,
    working_hrs int,
    pay_scale int,
    CHECK (email ~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);