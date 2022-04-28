-- Adding new category
create or replace procedure add_category(
    category_id_inp int,
    category_name_inp VARCHAR(50)
)
language plpgsql
as $$
begin
    insert into category(category_id,category_name)
    values (category_id_inp,category_name_inp);
commit;
end;$$;

call add_category(7,'shoes');

-- adding new sub-category
create and replace procedure add_sub_category(
    id_inp int,
    name_inp text,
    cat_id_inp int
)
language plpgsql
as $$
begin
    insert into subCategory(id, category_id, sub_category_name) 
    values (id_inp,cat_id_inp,name_inp);
commit;
end;$$;

call add_sub_category(4,'Mobiles',3);

-- purchase_from_supplier
create or replace procedure purchase_from_supplier(
    supplierid_inp INT,
    productid_inp int,
    quantity_inp int,
    product_combination_id_inp int
)
language plpgsql    
as $$
declare 
    cost int;
begin

    select cost_price into cost
    from productCombinations
    where productid=productid_inp
    and id=product_combination_id_inp;
    -- raise notice 'Value: %', cost;

    insert into purchaseinfo(supplierid,productid,quantity,totalcost,product_combination_id)
    values (supplierid_inp,productid_inp,quantity_inp,quantity_inp*cost,product_combination_id_inp);

    update productCombinations set availableStock=availableStock+quantity_inp 
    where productid=productid_inp and
    id = product_combination_id_inp;

    commit;
end;$$;

call purchase_from_supplier(1,2,5,1);

-- customer_purchase
create or replace procedure customer_purchase(
    productid_inp int,
    customer_id_inp int,
    quantity_inp int,
    payment_method_inp varchar(45),
    product_combination_id_inp int,
    payment_method_id_inp int
)
language plpgsql    
as $$
declare 
    sell_price_local int;
    availableStock_local int;
    offer_discount_local int;
    final_price_after_discount int;
begin

    select availableStock,sell_price into availableStock_local,sell_price_local
    from productCombinations
    where productid=productid_inp and id=product_combination_id_inp;
    
    -- check if the stock is available
    if (availableStock_local < quantity_inp)
    then
    raise notice 'Availiable stock: %', availableStock;
    end if;

    -- Offers discount
    select offer_discount into offer_discount_local
    from offers 
    where min_purchase <= sell_price_local 
    order by offer_discount desc 
    limit 1;

    if offer_discount_local is not null
    then
    select round(sell_price_local*(cast((cast(1 as float)-cast(cast(offer_discount_local as float)/cast(100 as float) as float)) as float))::numeric,2)
    into final_price_after_discount;
    else 
    select sell_price_local into final_price_after_discount;
    end if;

    -- raise notice 'sell_price_local %', sell_price_local;
    -- raise notice 'final_price_after_discount %', final_price_after_discount;

    if not exists (select id from paymentMethods 
    where customer_id=customer_id_inp and
    id=payment_method_id_inp)
    then
        raise notice 'False Payment Request';
        return ;
    end if;

    update productCombinations 
    set availableStock=availableStock-quantity_inp
    where productid=productid_inp and id=product_combination_id_inp;

    insert into salesinfo(productid,product_combination_id,customer_id,quantity,totalcost,final_cost_after_discount,payment_method,stateOfPackage,payment_method_id)
    values (productid_inp,product_combination_id_inp,customer_id_inp,quantity_inp,sell_price_local*quantity_inp,
    final_price_after_discount*quantity_inp,payment_method_inp,'Waiting to Dispatch',payment_method_id_inp);

commit;
end;$$;

call customer_purchase(2,1,2,'debit card',1,1);

-- profit of the inventory
create function pnl()
returns int
language plpgsql
as $$
declare
    purchase_amount int;
    revenue_amount int;
begin
   
   select sum(totalcost) into purchase_amount
   from purchaseinfo;
   
   select sum(final_cost_after_discount) into revenue_amount
   from salesinfo;

   return (revenue_amount-purchase_amount);
end;
$$;
select pnl();

-- verify login credentials of a customer
drop function verify_credentials(text,text);
create function verify_credentials(email_inp text,pwd text)
returns int
language plpgsql
as $$
declare
    verified int;
begin
   
   select 1 into verified from customer
   inner join password on password.customer_id=customer.id
        where customer.email=email_inp and customer.id=password.customer_id
        and password.password=crypt(pwd,password.password);
        return COALESCE(verified,0);
end;
$$;
select verify_credentials('c@c.com','root');

