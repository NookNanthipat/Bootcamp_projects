-- I'm a restaurant owner
-- create 5 Tables
-- 1x Fact, 4x Dimensions
-- search google -> how to add a foreign key
-- write SQL 3-5 queries to analyze data
-- 1x subquery/ with


create table Customer(
  customer_id int PRIMARY key,
  customer_type Text
  );
  
insert into Customer VALUES
    (1,'single'),
    (2,'couple'),
    (3,'family'),
    (4,'group');

create table Payment (
  payment_typeid int PRIMARY key,
  payment_type text
  );

insert into Payment VALUES
    (1,'cash'),
    (2,'credit card'),
    (3,'crypto'),
    (4,'member card');

CREATE table Menu (
  menu_id int primary key ,
  menu text,
  food_nationality text
  );

insert into Menu values
    (1,'Hamburger','USA'),
    (2,'Tom-yam-koong','Thailand'),
    (3,'Sushi','Japan'),
    (4,'Pizza','Italy'),
    (5,'Xiaolongbao','China');

CREATE table Drink(
  Drink_id int primary key ,
  Drink text
  );

insert into Drink values     
    (1,'drinking water'),
    (2,'coke'),
    (3,'pepsi'),
    (4,'ice tea'),
    (5,'beer');



create table orders(
  order_id int PRIMARY key,
  order_date text,
  amount real,
  payment_typeid int,
  customer_id int,
  menu_id int,
  Drink_id int,
  FOREIGN KEY (payment_typeid) REFERENCES Payment(payment_typeid),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (menu_id) REFERENCES Menu(menu_id),
  FOREIGN KEY (Drink_id) REFERENCES Drink(Drink_id)
);

insert into orders values
    (1,'2022-04-13',415,1,1,2,1),
    (2,'2022-04-13',500.25,2,2,2,3),
    (3,'2022-04-14',870.50,2,3,3,4),
    (4,'2022-04-14',250,4,1,4,2),
    (5,'2022-04-14',1800.45,2,4,5,5),
    (6,'2022-04-15',1200.50,3,1,5,1),
    (7,'2022-04-15',400,1,1,4,2),
    (8,'2022-04-16',965,2,2,3,2),
    (9,'2022-04-17',465.45,4,3,2,4),
    (10,'2022-04-18',420,2,3,1,5);


.mode markdown
.header on
-- 1. preview

SELECT 
    ord.order_id,
    ord.order_date,
    ord.amount,
    cus.customer_type,
    pay.payment_type,
    menu.menu,
    menu.food_nationality,
    dri.Drink 
  from 
	  orders  as ord
    join Customer as cus on ord.customer_id = cus.customer_id
    join Payment as pay on ord.payment_typeid = pay.payment_typeid
    join Menu as menu on ord.menu_id = menu.menu_id
    join Drink as dri on ord.Drink_id = dri.Drink_id
  
 ;


-- 2. total amount


  select order_date DATE,
	SUM(amount) as Total_amount from orders
    GROUP by order_date
;


-- 3.average amount of single

with single as 
(
  SELECT * from orders
  where customer_id = 1 
)
SELECT 
	avg(amount)
    from single as sin
    join Customer as cus on sin.customer_id = cus.customer_id;


-- 4.hits menu
SELECT 
    menu.menu,
    count(*)
    from 
	  orders  as ord
    join Menu as menu on ord.menu_id = menu.menu_id
    GROUP BY 1
    Order By 2 DESC;
