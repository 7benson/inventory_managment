-- purchase_from_supplier
create or replace procedure purchase_from_supplier(
    suppliercode INT,
    product_code_inp int,
    quantity_inp int,
    totalcost int
)
language plpgsql    
as $$
begin

    insert into purchaseinfo(suppliercode,product_code,quantity,totalcost)
    values (suppliercode,product_code_inp,quantity_inp,totalcost);

    update currentstock set quantity=quantity+quantity_inp where product_code = product_code_inp;

    commit;
end;$$;

-- call purchase_from_supplier(1001,2000,2,100);

-- customer_purchase
create or replace procedure customer_purchase(
    product_code_inp int,
    customer_id_inp int,
    quantity_inp int
)
language plpgsql    
as $$
declare 
    sell_price_local int;
begin

    update currentstock set quantity=quantity-quantity_inp where product_code = product_code_inp;
    
    select sell_price into sell_price_local
    from product
    where product_code=product_code_inp;
    
    insert into salesinfo(product_code,customer_id,quantity,totalcost)
    values (product_code_inp,customer_id_inp,quantity_inp,sell_price_local*quantity_inp);
commit;
end;$$;

call customer_purchase(4021,1,2);

insert into product(product_name,sell_price,category_id)
values ('new_prod',10,10);