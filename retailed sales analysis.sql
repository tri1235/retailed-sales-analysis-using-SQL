# SQL Prject on Retailed sales analysis

# create database
create database sales;
use sales;

# Create table;
create table retail (transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(15),
age int,
category varchar(15),
quantiy int,
price_per_unit float,
cogs float,
total_sale float);


select * from retail;
select count(*) from retail;


# data cleaning

select * from retail where
transactions_id is Null
or
sale_date is Null
or
sale_time is Null
or
customer_id is Null
or
gender is Null
or
age is Null
or
category is Null
or
quantiy is Null
or
price_per_unit is Null
or
cogs is Null
or
total_sale is Null;

delete from retail 
where
transactions_id is Null
or
sale_date is Null
or
sale_time is Null
or
customer_id is Null
or
gender is Null
or
age is Null
or
category is Null
or
quantiy is Null
or
price_per_unit is Null
or
cogs is Null
or
total_sale is Null;


# data exploration

# how many sales we have?
select count(*) as total_sale from retail;

# how many unique customer we have?
select count(distinct customer_id) as total_sale from retail;

# how many category we have?
select distinct category from retail;

# write a sql queory to retrieve all columns from sales made on '2022-11-05.
select * from retail where sale_date='2022-11-05';

#write a sql queory to retrieve all transactions where the category is cothing and the quantity sold is more than 10 in the month of Nov-2022.4
select * from retail where category="Clothing"
and 
date_format(sale_date,'%Y-%m')="2022-11"
and
quantiy>=4;

# write a sql quoery to calculate the total sales (sale_date) for each category.
select category, sum(total_sale) from retail group by category;

#write a sql queory to find the average age of customers who purchased items from the 'Beauty' cateogry?
select round(avg(age),2) from retail where category="Beauty";

#write a sql queory to find all transactions where the total_sale is greater than 1000?
select * from retail where total_sale>1000;


# write a sql to find the total number of transcations (transactions_id) made by each gender in each category?
select category,gender,count(*)  from 
retail group by
category,gender 
order by category;

# write a sql queory to calculate the average sale for each month find out best selling month in each year?
select year(sale_date),
month(sale_date),
avg(total_sale) from 
retail group by 1,2
order by 1,2,3 desc;

#write a sql queory to find the top 5 customers based on the highest total sales?
select customer_id,
sum(total_sale) from
retail group by 1
order by 2 desc
limit 5;

# write a sql queory to find the number of unique customers who purchased items from each category?
select category,count(distinct(customer_id)) from retail group by category











