create database inventory;
\c inventory;

create table supplier (
	sid BIGSERIAL PRIMARY KEY UNIQUE,
	suppliercode INT NOT NULL UNIQUE,
	full_name VARCHAR(100) NOT NULL,
	location VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);

create table category (
	category_id BIGSERIAL PRIMARY KEY UNIQUE,
	category_name VARCHAR(50) NOT NULL UNIQUE
);

create table product (
	pid BIGSERIAL PRIMARY KEY UNIQUE,
	product_code INT NOT NULL UNIQUE,
	product_name VARCHAR(50) NOT NULL,
	sell_price DECIMAL(6,2) NOT NULL,
	category_id VARCHAR(50)
);

create table currentstock(
    product_code INT NOT NULL,
    quantity int not NULL,
    CONSTRAINT FK_ProductCode FOREIGN KEY (product_code) REFERENCES product(product_code)
);

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

insert into customer (id, name, email, password) values (1, 'Aubrie Raubenheim', 'c@c.com', 'root');
insert into customer (id, name, email, password) values (2, 'Salvador Cockran', 'scockran1@cloudflare.com', 'root');
insert into customer (id, name, email, password) values (3, 'Kamillah Neward', 'kneward2@house.gov', 'root');
insert into customer (id, name, email, password) values (4, 'Ninon Frissell', 'nfrissell3@pinterest.com', 'root');
insert into customer (id, name, email, password) values (5, 'Calvin Oldacre', 'coldacre4@cafepress.com', 'root');

\c postgres;
drop database inventory;

