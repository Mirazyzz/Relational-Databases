CREATE SCHEMA Pizza;

DROP TABLE Pizza.OrderHistory;
DROP TABLE Pizza.SavedOrder;
DROP TABLE Pizza.SavedItem;
DROP TABLE Pizza.Account;
DROP TABLE Pizza.OrderDetails;
DROP TABLE Pizza.OrderType;
DROP TABLE Pizza.PaymentType;
DROP TABLE Pizza."Order";
DROP TABLE Pizza."Address";
DROP TABLE Pizza.Customer;
DROP TABLE Pizza.Employee;
DROP TABLE Pizza.Position;
DROP TABLE Pizza.OrderItem;
drop table Pizza.MenuItem;
DROP TABLE Pizza.Menu;
DROP TABLE Pizza.Item;
DROP TABLE Pizza.ItemType;

CREATE TABLE Pizza.ItemType (
  Id_ItemType INT NOT NULL IDENTITY,
  TypeTitle NVARCHAR(100) ,
  PRIMARY KEY (Id_ItemType)
);


CREATE TABLE Pizza.Item (
  Id_Item INT NOT NULL IDENTITY,
  ItemType_Id INT NOT NULL,
  ItemTitle NVARCHAR(100),
  Price SMALLMONEY,
  Description NVARCHAR(500),
  PRIMARY KEY (Id_Item),
  FOREIGN KEY (ItemType_Id) REFERENCES Pizza.ItemType (Id_ItemType)
);


CREATE TABLE Pizza.Menu (
  Id_Menu INT NOT NULL IDENTITY,
  MenuTitle NVARCHAR(100),
  Price SMALLMONEY,
  PRIMARY KEY (Id_Menu),
);


CREATE TABLE Pizza.MenuItem (
	Id_MenuItem INT NOT NULL IDENTITY,
	Menu_Id INT NOT NULL,
	Item_Id INT NOT NULL,
	PRIMARY KEY (Id_MenuItem),
	FOREIGN KEY (Menu_Id) REFERENCES Pizza.Menu (Id_Menu),
	FOREIGN KEY (Item_Id) REFERENCES Pizza.Item (Id_Item)
);

CREATE TABLE Pizza.OrderItem (
  Id_OrderItem INT NOT NULL IDENTITY,
  Item_Id INT,
  Menu_Id INT,
  Quantity SMALLINT,
  PRIMARY KEY (Id_OrderItem),
  FOREIGN KEY (Item_Id) REFERENCES Pizza.Item (Id_Item),
  FOREIGN KEY (Menu_Id) REFERENCES Pizza.Menu (Id_Menu)
);


CREATE TABLE Pizza.Position (
  Id_Position INT NOT NULL IDENTITY,
  Position_Title NVARCHAR(50) NOT NULL,
  Salary SMALLMONEY NOT NULL,
  PRIMARY KEY (Id_Position)
);


CREATE TABLE Pizza.Employee (
  Id_Employee INT NOT NULL IDENTITY,
  Position_Id INT NOT NULL,
  FirstName NVARCHAR(100),
  LastName NVARCHAR(100),
  Phone NVARCHAR(20) NOT NULL,
  Bonus SMALLMONEY,
  PRIMARY KEY (Id_Employee),
  FOREIGN KEY (Position_Id) REFERENCES Pizza.Position (Id_Position)
);


CREATE TABLE Pizza.Customer (
  Id_Customer INT NOT NULL IDENTITY,
  FirstName NVARCHAR(100) NOT NULL,
  LastName NVARCHAR(100),
  Phone NVARCHAR(20) NOT NULL,
  PRIMARY KEY (Id_Customer)
);


CREATE TABLE Pizza."Address" (
  Id_Address INT NOT NULL IDENTITY,
  Customer_Id INT NOT NULL,
  Street NVARCHAR(150),
  Appartment NVARCHAR(150),
  Pincode NVARCHAR(150),
  Flat NVARCHAR(150),
  PRIMARY KEY (Id_Address),
  FOREIGN KEY (Customer_Id) REFERENCES Pizza.Customer (Id_Customer)
);


CREATE TABLE Pizza.PaymentType (
  Id_PaymentType INT NOT NULL IDENTITY,
  PaymentType_Name NVARCHAR(100),
  PRIMARY KEY (Id_PaymentType)
);

CREATE TABLE Pizza.OrderType (
  Id_OrderType INT NOT NULL IDENTITY,
  OrderType_Name NVARCHAR(100),
  PRIMARY KEY (Id_OrderType)
);

CREATE TABLE Pizza."Order" (
  Id_Order INT NOT NULL IDENTITY,
  OrderItem_Id INT NOT NULL,
  Customer_Id INT NOT NULL,
  TotalPrice SMALLINT,
  Discount SMALLINT,
  PRIMARY KEY (Id_Order),
  FOREIGN KEY (OrderItem_Id) REFERENCES Pizza.OrderItem (Id_OrderItem),
  FOREIGN KEY (Customer_Id) REFERENCES Pizza.Customer (Id_Customer)

);

CREATE TABLE Pizza.OrderDetails (
  Id_OrderDetails INT NOT NULL IDENTITY,
  Order_Id INT NOT NULL,
  PaymentType_Id INT NOT NULL,
  OrderType_Id INT NOT NULL,
  Deliver_Id INT,
  PRIMARY KEY (Id_OrderDetails),
  FOREIGN KEY (Order_Id) REFERENCES Pizza."Order" (Id_Order),
  FOREIGN KEY (PaymentType_Id) REFERENCES Pizza.PaymentType (Id_PaymentType),
  FOREIGN KEY (OrderType_Id) REFERENCES Pizza.OrderType (Id_OrderType),
  FOREIGN KEY (Deliver_Id) REFERENCES Pizza.Employee (Id_Employee),
);


CREATE TABLE Pizza.Account (
  Id_Account INT NOT NULL IDENTITY,
  Customer_Id INT NOT NULL UNIQUE,
  CreditCard NVARCHAR (30),
  Email NVARCHAR (50) NOT NULL,
  Password NVARCHAR (50) NOT NULL,
  PRIMARY KEY (Id_Account),
  FOREIGN KEY (Customer_Id) REFERENCES Pizza.Customer (Id_Customer),
);

CREATE TABLE Pizza.SavedOrder (
	Id_SavedOrder INT NOT NULL IDENTITY,
	Account_Id INT NOT NULL,
	Order_Id INT NOT NULL,
	PRIMARY KEY (Id_SavedOrder),
	FOREIGN KEY (Account_Id) REFERENCES Pizza.Account (Id_Account),
	FOREIGN KEY (Order_Id) REFERENCES Pizza."Order" (Id_Order)
);

CREATE TABLE Pizza.SavedItem (
	Id_SavedItem INT NOT NULL IDENTITY,
	Account_Id INT NOT NULL,
	Item_Id INT NOT NULL,
	PRIMARY KEY (Id_SavedItem),
	FOREIGN KEY (Account_Id) REFERENCES Pizza.Account (Id_Account),
	FOREIGN KEY (Item_Id) REFERENCES Pizza.Item (Id_Item)
);

CREATE TABLE Pizza.OrderHistory (
	Id_OrderHistory INT NOT NULL IDENTITY,
	Account_Id INT NOT NULL,
	Order_Id INT NOT NULL,
	PRIMARY KEY (Id_OrderHistory),
	FOREIGN KEY (Account_Id) REFERENCES Pizza.Account (Id_Account),
	FOREIGN KEY (Order_Id) REFERENCES Pizza."Order" (Id_Order)
);
	