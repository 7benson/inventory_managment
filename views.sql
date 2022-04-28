
-- productCombinations table
-- customer's view on productCombinations table
-- This view doesn't show cost_price of the product to the customer which is required
create view productCombinationsCustomerView as
select id,combination_string,productid,mrp,discount,sell_price,availableStock
from productCombinations;

--- customer table
create view passwordsHiddenCustomersTableView as
select id,name,email
from customer;

-- customers addresses
create view customerAddresses
select * from address where address.address_id in 
(select address_id from customer_addresses);

