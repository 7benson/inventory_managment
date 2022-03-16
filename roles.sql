--  roles : dbadmin, user, manager
create role dbadmin superuser login password 'root';

create role customer login password 'root';
grant select on product, category, currentstock to customer;

create role manager login password 'root';
grant all on category,costprice,currentstock,customer,product,purchaseinfo,salesinfo,supplier to manager;