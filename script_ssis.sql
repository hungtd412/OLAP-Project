create database Ecom_CusBe_dw;
use Ecom_CusBe_dw;

ALTER TABLE [Fact]
ADD CONSTRAINT FK_Fact_Dim_Customer
FOREIGN KEY ([CID])
REFERENCES [Dim_Customer]([CID]);

ALTER TABLE [Fact]
ADD CONSTRAINT FK_Fact_Dim_Transaction
FOREIGN KEY ([TID])
REFERENCES [Dim_Transaction]([TID]);

ALTER TABLE [Fact]
ADD CONSTRAINT FK_Fact_Dim_Location
FOREIGN KEY ([Location])
REFERENCES [Dim_Location]([Location]);

ALTER TABLE [Fact]
ADD CONSTRAINT FK_Fact_Dim_Date
FOREIGN KEY ([Purchase Date])
REFERENCES [Dim_Date]([date_id]);

ALTER TABLE [Fact]
ADD CONSTRAINT FK_Fact_Dim_Product
FOREIGN KEY ([Product Category])
REFERENCES [Dim_Product]([Product Category]);

ALTER TABLE [Fact]
ADD CONSTRAINT FK_Fact_Dim_Discount
FOREIGN KEY ([discount_id])
REFERENCES [Dim_Discount]([discount_id]);

CREATE TABLE [Dim_Customer] (
    [CID] varchar(50) primary key,
    [Gender] varchar(50),
    [Age Group] varchar(50),
)
CREATE TABLE [Dim_Product] (
    [Product Category] varchar(50) primary key,
)
CREATE TABLE [Dim_Location] (
    [Location] varchar(50) primary key
)
CREATE TABLE [Dim_Discount] (
    [discount_id] int identity(1,1) primary key,
    [Discount Availed] varchar(50),
    [Discount Name] varchar(50)
)
CREATE TABLE [Dim_Transaction] (
    [TID] varchar(50) primary key,
    [Purchase Method] varchar(50)
)
CREATE TABLE [Dim_Date] (
    [date_id] datetime primary key,
    [Purchase Time] time,
    [day] int,
    [month] int,
    [year] int,
    [quarter] smallint
)
CREATE TABLE [Fact_Raw] (
    [CID] varchar(50),
    [TID] varchar(50),
	primary key([CID], [TID]),
    [Purchase Date] datetime,
    [Product Category] varchar(50),
    [Location] varchar(50),
    [Discount Availed] varchar(50),
    [Discount Name] varchar(50),
    [Discount Amount (INR)] float,
    [Gross_Amount] float,
    [Net_Amount] float
)

CREATE TABLE [Fact] (
    [CID] varchar(50),
    [TID] varchar(50),
	primary key([CID], [TID]),
    [Purchase Date] datetime,
    [Product Category] varchar(50),
    [Location] varchar(50),
    [discount_id] int,
	[Discount Amount (INR)] float,
    [Gross_Amount] float,
    [Net_Amount] float
)

drop table Fact

select * from [Dim_Date]
select * from Dim_Discount
select * from Fact
USE Ecom_CusBe_dw;

-- Drop foreign key constraints
ALTER TABLE [Fact] DROP CONSTRAINT FK_Fact_Dim_Customer;
ALTER TABLE [Fact] DROP CONSTRAINT FK_Fact_Dim_Transaction;
ALTER TABLE [Fact] DROP CONSTRAINT FK_Fact_Dim_Location;
ALTER TABLE [Fact] DROP CONSTRAINT FK_Fact_Dim_Date;
ALTER TABLE [Fact] DROP CONSTRAINT FK_Fact_Dim_Product;
ALTER TABLE [Fact] DROP CONSTRAINT FK_Fact_Dim_Discount;

truncate table [Fact_Raw];
truncate table [Fact];
truncate table [Dim_Transaction];
truncate table [Dim_Discount];
truncate table [Dim_Product];
truncate table [Dim_Location];
truncate table [Dim_Date];
truncate table [Dim_Customer];


-- Drop tables
DROP TABLE [Fact_Raw];
DROP TABLE  [Fact1];
DROP TABLE  [Fact2];
DROP TABLE  [Fact3];
DROP TABLE [Fact];
DROP TABLE [Dim_Transaction];
DROP TABLE [Dim_Discount];
DROP TABLE [Dim_Product];
DROP TABLE [Dim_Location];
DROP TABLE [Dim_Date];
DROP TABLE [Dim_Customer];
 
select * from [Fact]


/*
CREATE TABLE [Fact1] (
    [CID] varchar(50),
    [TID] varchar(50),
	primary key([CID], [TID]),
    [Purchase Date] datetime,
    [Product Category] varchar(50),
    [Discount Availed] varchar(50),
    [Discount Name] varchar(50),
    [Discount Amount (INR)] float,
    [location_id] int,
    [Gross_Amount] float,
    [Net_Amount] float
)
CREATE TABLE [Fact2] (
    [CID] varchar(50),
    [TID] varchar(50),
	primary key([CID], [TID]),
    [Purchase Date] datetime,
    [product_id] int,
    [Discount Availed] varchar(50),
    [Discount Name] varchar(50),
    [Discount Amount (INR)] float,
    [location_id] int,
    [Gross_Amount] float,
    [Net_Amount] float
)
CREATE TABLE [Fact1] (
    [CID] varchar(50),
    [TID] varchar(50),
	primary key([CID], [TID]),
    [date_id] datetime,
    [Product Category] varchar(50),
    [Discount Availed] varchar(50),
    [Discount Name] varchar(50),
    [Discount Amount (INR)] float,
    [Location] varchar(50),
    [Gross_Amount] float,
    [Net_Amount] float
)
*/


SELECT CONVERT(date, '01/10/2023', 103);