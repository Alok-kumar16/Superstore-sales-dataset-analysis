create database northwind;
use northwind;
create table sales(
RowID int, 
OrderID varchar(255),
OrderDate date, 
ShipDate date,
ShipMode varchar(30),
CustomerID varchar(30),
CustomerName varchar(30),
Segment   varchar(30),
Country  varchar(30),
City varchar(30),
State varchar(30),
PostalCode int(10), 
Region varchar(30),
ProductID varchar(30),
Category varchar(30),
SubCategory varchar(30),  
ProductName varchar(100),
Sales  decimal(10,2),
Quantity  int(5),
Discount  decimal(4,2),
profit decimal(7,2),
Daystoship int,
OrderYear  int,
OrderMonth int,
OrderQuarter int,
ProfitMargin decimal(7,2)
);
truncate table sales; 
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Superstore sales cleaned.csv'
into table sales
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
alter table sales modify ProductName varchar(255);
show warnings;
SELECT COUNT(*) FROM sales;

SELECT * FROM sales limit 5;

select Category,round(SUM(Profit),2) as total_profit
from sales 
group by Category
order by total_profit asc;

select ProductName,Category,SubCategory,round(sum(Profit),2) as total_profit
from sales
group by ProductName,Category,SubCategory
order by total_profit asc
limit 10;

Select OrderYear ,round(sum(Sales),2) as total_sales, 
round(sum(Profit),2) as total_profit,
round(sum(Profit)/sum(Sales)*100,2) as profit_margin_pct
from sales
group by OrderYear
Order by OrderYear;

select OrderYear,round(avg(Discount),3) as avg_discount
from sales
group by OrderYear
order by OrderYear;

select Region,SubCategory,round(sum(profit),2) as total_profit
from sales
where SubCategory in ('Tables','Bookcases')
group by Region,SubCategory
order by total_profit asc;

select CustomerName,round(sum(profit),2) as total_profit,
count(distinct OrderID) as num_orders,sum(Quantity) as total_quantity
from sales
group by CustomerName
Order by total_profit desc
limit 10;

select CustomerName,round(sum(profit),2) as total_profit,
count(distinct OrderID) as num_orders,sum(Quantity) as total_quantity
from sales
group by CustomerName
Order by total_profit asc
limit 10;

select segment,round(sum(sales),2) as total_sales,
round(sum(profit),3) as total_profit,
round(sum(profit)/sum(sales)*100,2) as margin_pct
from sales
group by segment
order by total_profit desc;

select CustomerName,round(sum(profit),2) as total_profit,
  case
      when sum(profit)>1000 then 'high Value'
      when sum(profit) between 0 and 1000 then 'low value'
      else 'unprofitable'
  end as customer_tier
from sales
group by CustomerName
order by total_profit desc;
