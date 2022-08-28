#ASSIGNMENT-02SQL
#Develop a query that will assign one voucher to one customer and vice versa. 
#Two customers will not get same voucher.
#Two Voucher will not be assigned to a single customer

CREATE TABLE Customer (Id int identity(1,1), Customer_Id varchar(255));
INSERT INTO Customer VALUES ('Abhinash'),('Vipin'),('Mahesh'),('Bijoy'),('Bhabani'),('Ashutosh')
    
CREATE TABLE Voucher (Id int identity(1,1), Voucher_Id varchar(255) UNIQUE);
INSERT INTO Voucher VALUES('ABXFH'),('SDFGH'),('ERTYY'),('PPLKM')

SELECT  Customer.Customer_Id Customer_Key, ISNULL(Voucher_Id,'-') as Gift_Voucher_Key
FROM Customer
Left JOIN Voucher ON Customer.Id = Voucher.Id
ORDER BY Customer.Id;