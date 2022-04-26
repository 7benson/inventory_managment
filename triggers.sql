-- Update selling price acc to discount
drop trigger update_sell_price on product;

create or replace function update_sell_price()
returns trigger
as $$
begin
    update product
    set sell_price=new.mrp * (( 100 - new.discount)/100)
    where productid=new.productid;
    return new;
end;
$$
language plpgsql;

create trigger update_sell_price
after insert
on product
for each row
execute procedure update_sell_price();

create trigger update_sell_price_up
after update
on product
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
