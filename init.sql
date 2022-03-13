create database inventory;
\c inventory;

create table supplier (
	supplierid BIGSERIAL PRIMARY KEY UNIQUE,
	full_name VARCHAR(100) NOT NULL,
	location VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);

create table category (
	category_id BIGSERIAL PRIMARY KEY UNIQUE,
	category_name VARCHAR(50) NOT NULL UNIQUE
);

create table product (
	productid BIGSERIAL PRIMARY KEY UNIQUE,
	product_name VARCHAR(50) NOT NULL,
	sell_price DECIMAL(6,2) NOT NULL,
	category_id INT NOT NULL,
    CONSTRAINT FK_CategoryDd FOREIGN KEY (category_id) REFERENCES category(category_id)
);

create table costprice(
    productid BIGSERIAL UNIQUE,
	cost_price DECIMAL(6,2) NOT NULL,
    CONSTRAINT FK_Productid FOREIGN KEY (productid) REFERENCES product(productid)
);

create table currentstock(
    productid INT NOT NULL,
    quantity int not NULL,
    CONSTRAINT FK_ProductCode FOREIGN KEY (productid) REFERENCES product(productid)
);

create table purchaseinfo(
    purchaseid BIGSERIAL PRIMARY KEY UNIQUE,
    supplierid INT NOT NULL,
    productid INT NOT NULL,
    date varchar(45) not null default CURRENT_TIMESTAMP,
    quantity int not null,
    totalcost int not null,
    CONSTRAINT FK_ProductId FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_SupplierId FOREIGN KEY (supplierid) REFERENCES supplier(supplierid)
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
    productid INT NOT NULL,
    customer_id BIGSERIAL UNIQUE,
    quantity int not null,
    totalcost int not null,
    CONSTRAINT FK_ProductId FOREIGN KEY (productid) REFERENCES product(productid),
    CONSTRAINT FK_CustomerCode FOREIGN KEY (customer_id) REFERENCES customer(id)
);

\c postgres;
drop database inventory;

