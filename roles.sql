--  roles : dbadmin, user, manager

create role dbadmin superuser login password 'root';

create role customer;
grant select on 
category,
subCategory,
product,
image_gallery,
product_gallery_mapper,
productVariations,
productCombinationsCustomerView,
offers,
cartItems,
reviews,
customer_addresses,
paymentMethods,
customerAddresses,
salesinfo to customer;

create role manager;
grant all on 
address,
supplier,
category,
subCategory,
product,
image_gallery,
product_gallery_mapper,
productVariations,
productCombinations,
offers,
passwordsHiddenCustomersTableView,
purchaseinfo,
reviews,
salesinfo
to manager;