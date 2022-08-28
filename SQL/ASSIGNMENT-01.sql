#ASSIGNMENT-01SQL 
#Develop a SQL query that will find out two Products for each product category that are most popular in last 30 days.
#Popularity is based on maximum quantity sold in a particular category


with pc as (
select Dep_Id, Cat_Id,Product_Id   
from ProductCatalogue
group by Dep_Id, Cat_Id, Product_Id ),

ph as (
select Bills_Id, Customer, Product_Id, Sale_Qty, Bill Amount, Bill_Date
from PurchaseHistory 
group by Bills_Id, Customer, Product_Id, Sale_Qty, Bill Amount, Bill_Date ),


ProductWiseQuantity as (
select pc.Cat_Id, ph.Product_Id,
sum(Sale_Qty) as Product_Sale_Qty
from ph join pc on ph.Product_Id=pc.Product_Id
where Bill_Date >= (CURRENT_DATE()- 30 day )
group by pc.Cat_Id,ph.Product_Id
),


ProductRanking as (
select Cat_Id, Product_Id, Product_Sale_Qty,
ROW_NUMBER() OVER(partition by Cat_Id order by Product_Sale_Qty ) as ProductRank 
from ProductWiseQuantity 
)

select Cat_Id, Product_Id, ProductRank as Trending
from ProductRanking
where ProductRank <=2
order by Cat_Id, Product_Id, ProductRank