create database shop;
use shop;


Create table Category_Details(CategoryID int primary key,CategoryName varchar(20) not null);


Create table Product_Details(ProductID int primary key,CategoryID int references Category_Details(CategoryID) on delete cascade on update cascade,Title varchar(20) not null,Company varchar(20) not null,Dealer varchar(20) not null,Price float,Quantity integer,Description varchar(20) not null);


Create table Order_Table(OrderID int primary key,UserID varchar(20) not null,TotalAmount integer,OrderDate varchar(20));


Create table Order_Details(OrderID int references Order_Table(OrderID) on delete cascade on update cascade,ProductID int references Product_Details(ProductId) on delete cascade on update cascade,Quantity integer);


CREATE TABLE User_Profile(UserName varchar(20) primary key,Password varchar(20) NOT NULL,FirstName varchar(20) NOT NULL,MiddleName varchar(20) not null,LastName varchar(20) NOT NULL,Address1 varchar(20) NOT NULL,Address2 varchar(20),City varchar(20) NOT NULL,State varchar(20) NOT NULL,PinCode varchar(20),Email varchar(20) NOT NULL,Phone varchar(20) not null);


Create table User_Auth(UserName varchar references User_Profile(username),Password varchar(20));


Create table Temp_Detail(ProductID int,CategoryID int,Title varchar(20) not null,Company varchar(20) not null,Dealer varchar(20) not null,Price int,Quantity integer,Discription varchar(20) not null);
CREATE TABLE


