select * from productCombinations;
-- address id index
create index address_id_index on address using btree(address_id);

-- supplier id index
create index supplier_id_index on supplier using btree(supplierid);

-- product id index
create index product_id_index on product using btree(productid);

-- image_gallery id index
create index image_gallery_id_index on image_gallery using btree(id);

-- purchaseinfo id
create index purchaseinfo_id_index on purchaseinfo using btree(purchaseid);

-- customer id
create index customer_id_index on customer using btree(id);

-- customer email
create index customer_email_index on customer using HASH(email);

-- salesinfo saleid index
create index salesinfo_id_index on salesinfo using btree(saleid);
