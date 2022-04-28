-- card check
drop trigger cardVendorCheck on paymentMethods;

create or replace function cardVendorCheck()
returns trigger
as $$
declare
    vendor_name text;
begin
    if new.card_number ~ '^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$'
    then
        select 'Visa Master Card' into vendor_name;
    elsif new.card_number ~ '^4[0-9]{12}(?:[0-9]{3})?$'
    then
        select 'Visa Card' into vendor_name;
    elsif new.card_number ~ '^(62[0-9]{14,17})$'
    then
        select 'Union Pay Card' into vendor_name;
    elsif new.card_number ~ '^(5[1-5][0-9]{14}|2(22[1-9][0-9]{12}|2[3-9][0-9]{13}|[3-6][0-9]{14}|7[0-1][0-9]{13}|720[0-9]{12}))$'
    then
        select 'Mastercard' into vendor_name;
    elsif new.card_number ~ '^3[47][0-9]{13}$'
    then
        select 'Amex Card' into vendor_name;
    end if;

    update paymentMethods
    set card_vendor=vendor_name
    where id=new.id and customer_id=new.customer_id;

    return new;
end;
$$
language plpgsql;

create trigger cardVendorCheck
after insert
on paymentMethods
for each row
execute procedure cardVendorCheck();



-- Update selling price acc to discount
drop trigger update_sell_price on productCombinations;

create or replace function update_sell_price()
returns trigger
as $$
begin

    if exists (select * from productCombinations where 
    sell_price=round(new.mrp*cast((cast(1.0 as float)-(cast(new.discount as float) /cast(100 as float))) as float)::numeric,2)
    and productid=new.productid
    and id=new.id)
    then
        return null;
    end if;

    update productCombinations
    set sell_price=round(new.mrp*cast((cast(1.0 as float)-(cast(new.discount as float) /cast(100 as float))) as float)::numeric,2)
    where productid=new.productid
    and id=new.id;
    return new;
end;
$$
language plpgsql;

create trigger update_sell_price
after insert
on productCombinations
for each row
execute procedure update_sell_price();

create trigger update_sell_price_up
after update
on productCombinations
for each row
execute procedure update_sell_price();

-- update rating of the product
drop trigger update_rating on reviews;

create or replace function update_rating()
returns trigger
as $$
declare
    sum_ratings int;
    total_ratings int;
begin
    select count(*) , sum(rating) 
    into total_ratings, sum_ratings
    from reviews
    where productid=new.productid
    group by productid;
    
    update product
    set rating = round(sum_ratings/total_ratings,1)
    where productid=new.productid;

    return new;
end;
$$
language plpgsql;

create trigger update_rating
after insert
on reviews
for each row 
execute procedure update_rating();

create trigger update_rating_up
after update
on reviews
for each row 
execute procedure update_rating();

insert into reviews(productid,customer_id,rating,review) values (1,1,0,'worst product ever');
insert into reviews(productid,customer_id,rating,review) values (1,1,5,'best product ever');
select * from product where productid=1;
select * from reviews;
