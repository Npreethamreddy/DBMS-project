create database preetham;
use preetham;
CREATE TABLE Bill
(
  Bill_date DATETIME NOT NULL,
  Order_id INT NOT NULL,
  Bill_id INT NOT NULL,
  Amount INT NOT NULL,
  Discount INT NOT NULL,
  PRIMARY KEY (Bill_id)
);

CREATE TABLE Account_details
(
  Card_holder VARCHAR(50) NOT NULL,
  Expiry_date DATE NOT NULL,
  Account_id INT NOT NULL,
  CVV INT NOT NULL,
  PRIMARY KEY (Account_id)
);

CREATE TABLE Owner
(
  Owner_id INT NOT NULL,
  Contact BIGINT NOT NULL,
  Restaurant_name VARCHAR(50) NOT NULL,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Owner_id)
);

CREATE TABLE Table_status
(
  Table_no INT NOT NULL,
  Status VARCHAR(50) NOT NULL,
  primary key (Table_no)
);

CREATE TABLE Restaurant
(
  Details VARCHAR(50) NOT NULL,
  Location VARCHAR(50) NOT NULL,
  Restaurant_name VARCHAR(50) NOT NULL,
  Contact BIGINT NOT NULL unique,
  Openingtime time NOT NULL,
  Closingtime time NOT NULL,
  Restaurant_id INT NOT NULL,
  Owner_id INT NOT NULL,
  PRIMARY KEY (Restaurant_id),
  FOREIGN KEY (Owner_id) REFERENCES Owner(Owner_id)
);

CREATE TABLE Manager
(
  Contact BIGINT NOT NULL,
  Address VARCHAR(50) NOT NULL,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  Manager_id INT NOT NULL,
  Restaurant_id INT NOT NULL,
  PRIMARY KEY (Manager_id),
  FOREIGN KEY (Restaurant_id) REFERENCES Restaurant(Restaurant_id)
);

CREATE TABLE Customer
(
  Customer_id INT NOT NULL,
  Phone_no BIGINT NOT NULL,
  Email_id VARCHAR(50) NOT NULL,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  Restaurant_id INT NOT NULL,
  Table_no INT NOT NULL,
  Account_id INT NOT NULL,
  Bill_id INT NOT NULL,
  PRIMARY KEY (Customer_id),
  FOREIGN KEY (Restaurant_id) REFERENCES Restaurant(Restaurant_id),
  FOREIGN KEY (Table_no) REFERENCES Table_status(Table_no),
  FOREIGN KEY (Account_id) REFERENCES Account_details(Account_id),
  FOREIGN KEY (Bill_id) REFERENCES Bill(Bill_id)
);

CREATE TABLE Orders
(
  Order_date DATETIME NOT NULL,
  order_id INT NOT NULL,
  Price INT NOT NULL,
  Restaurant_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (Restaurant_id) REFERENCES Restaurant(Restaurant_id)
);

CREATE TABLE Tables
(
  Details VARCHAR(50) NOT NULL,
  Table_no INT NOT NULL,
  Customer_id INT NOT NULL,
  FOREIGN KEY (Table_no) REFERENCES Table_status(Table_no),
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Menu
(
  Menu_id INT NOT NULL,
  Type INT NOT NULL,
  Category INT NOT NULL,
  Item_name VARCHAR(50) NOT NULL,
  Price INT NOT NULL,
  Customer_id INT NOT NULL,
  PRIMARY KEY (Menu_id),
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

Insert into Bill values('2018-4-13',1,4,200,50);
Insert into Bill values('2018-4-15',2,5,200,50);
Insert into Bill values('2018-4-16',3,6,500,50);

Insert into Owner values(092,9166912405,'Paradise','Viraj','Anand');

Insert into Restaurant values('sec','HYD','Paradise',7995920096,'09:00:00','22:00:00',100,092);

Insert into Orders values('2018-4-13',1,200,100);
Insert into Orders values('2018-4-15',2,200,100);
Insert into Orders values('2018-4-16',3,500,100);

Insert into Account_details values('Mahesh Babu','2033-05-24',1234,123);
Insert into Account_details values('Allu Arjun','2033-06-25',2345,234);
Insert into Account_details values('Ravi Teja','2033-08-14',3456,345);


Insert into Table_status values(111,'available');
Insert into Table_status values(112,'available');
Insert into Table_status values(113,'available');


Insert into Manager values(9123456789,'HYD','Sanju','reddy',093,100);

Insert into Customer values(211,9391929495,'mahesh123@gmail','mahesh','babu',100,111,1234,4);
Insert into Customer values(212,9192939495,'arjun123@gmail','Allu','Arjun',100,112,2345,5);
Insert into Customer values(213,9291949596,'Ravi123@gmail','Ravi','Teja',100,113,3456,5);

Insert into Tables values('Reserved',111,211);
Insert into Tables values('Reserved',112,212);
Insert into Tables values('Reserved',113,213);

Insert into Menu values(311,411,511,'Chilli Chicken',140,211);
Insert into Menu Values(321,421,521,'Spring Rolls',60,211);
Insert Into Menu Values(312,411,512,'Chicken lollipop',200,212);
Insert into Menu values(322,421,522,'Veg Manchuria',200,212);
Insert into Menu values(313,411,513,'Chicken Manchuria',250,213);
Insert into Menu values(323,421,523,'Paneer Tikka',250,213);

Select * from Restaurant;
select * from Orders;

describe restaurant;
 
 
 select Item_name,Bill_id,Bill_date,Amount
 from Menu,Bill
 where Menu.Customer_id=(select Customer_id
 from Customer
 where Customer.First_name='Allu' and Bill.Bill_id=Customer.Bill_id); 
 



