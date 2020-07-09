CREATE SCHEMA Pizza;

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
DROP TABLE Pizza.Menu;
DROP TABLE Pizza.Item;
DROP TABLE Pizza.ItemType;

CREATE TABLE Pizza.ItemType (
  Id_ItemType INT NOT NULL,
  ItemType_Name NVARCHAR(100) ,
  PRIMARY KEY (Id_ItemType)
);


CREATE TABLE Pizza.Item (
  Id_Item INT NOT NULL,
  ItemType_Id INT NOT NULL,
  Item_Name NVARCHAR(100),
  Price SMALLMONEY,
  Description NVARCHAR(500),
  PRIMARY KEY (Id_Item),
  FOREIGN KEY (ItemType_Id) REFERENCES Pizza.ItemType (Id_ItemType)
);


CREATE TABLE Pizza.Menu (
  Id_Menu INT NOT NULL,
  Item_Id INT NOT NULL,
  Title NVARCHAR(100),
  PRIMARY KEY (Id_Menu),
  FOREIGN KEY (Item_Id) REFERENCES Pizza.Item (Id_Item)
);


CREATE TABLE Pizza.OrderItem (
  Id_OrderItem INT NOT NULL,
  Item_Id INT NOT NULL,
  Quantity SMALLINT,
  PRIMARY KEY (Id_OrderItem),
  FOREIGN KEY (Item_Id) REFERENCES Pizza.Item (Id_Item)
);


CREATE TABLE Pizza.Position (
  Id_Position INT NOT NULL,
  Position_Title NVARCHAR(50) NOT NULL,
  Salary SMALLMONEY NOT NULL,
  PRIMARY KEY (Id_Position)
);


CREATE TABLE Pizza.Employee (
  Id_Employee INT NOT NULL,
  Position_Id INT NOT NULL,
  FirstName NVARCHAR(100),
  LastName NVARCHAR(100),
  Phone NVARCHAR(20) NOT NULL,
  Bonus SMALLMONEY,
  PRIMARY KEY (Id_Employee),
  FOREIGN KEY (Position_Id) REFERENCES Pizza.Position (Id_Position)
);


CREATE TABLE Pizza.Customer (
  Id_Customer INT NOT NULL,
  Account_Id INT,
  FirstName NVARCHAR(100) NOT NULL,
  LastName NVARCHAR(100),
  Phone NVARCHAR(20) NOT NULL,
  PRIMARY KEY (Id_Customer)
);


CREATE TABLE Pizza."Address" (
  Id_Address INT NOT NULL,
  Customer_Id INT NOT NULL,
  Street NVARCHAR(150),
  Appartment NVARCHAR(150),
  Pincode NVARCHAR(150),
  Flat NVARCHAR(150),
  PRIMARY KEY (Id_Address),
  FOREIGN KEY (Customer_Id) REFERENCES Pizza.Customer (Id_Customer)
);


CREATE TABLE Pizza.PaymentType (
  Id_PaymentType INT NOT NULL,
  PaymentType_Name NVARCHAR(100),
  PRIMARY KEY (Id_PaymentType)
);

CREATE TABLE Pizza.OrderType (
  Id_OrderType INT NOT NULL,
  OrderType_Name NVARCHAR(100),
  PRIMARY KEY (Id_OrderType)
);

CREATE TABLE Pizza."Order" (
  Id_Order INT NOT NULL,
  OrderItem_Id INT NOT NULL,
  Waiter_Id INT,
  Customer_Id INT NOT NULL,
  TotalPrice SMALLINT NOT NULL,
  Discount SMALLINT,
  PRIMARY KEY (Id_Order),
  FOREIGN KEY (OrderItem_Id) REFERENCES Pizza.OrderItem (Id_OrderItem),
  FOREIGN KEY (Waiter_Id) REFERENCES Pizza.Employee (Id_Employee),
  FOREIGN KEY (Customer_Id) REFERENCES Pizza.Customer (Id_Customer)

);

CREATE TABLE Pizza.OrderDetails (
  Id_OrderDetails INT NOT NULL,
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
  Id_Account INT NOT NULL,
  Customer_Id INT NOT NULL UNIQUE,
  SavedOrder_Id INT,
  SavedItem_Id INT,
  OrderHistory_Id INT,
  CreditCard NVARCHAR (30),
  Email NVARCHAR (50) NOT NULL,
  Password NVARCHAR (50) NOT NULL,
  PRIMARY KEY (Id_Account),
  FOREIGN KEY (Customer_Id) REFERENCES Pizza.Customer (Id_Customer),
  FOREIGN KEY (SavedOrder_Id) REFERENCES Pizza."Order" (Id_Order),
  FOREIGN KEY (SavedItem_Id) REFERENCES Pizza.Item (Id_Item),
  FOREIGN KEY (OrderHistory_Id) REFERENCES Pizza."Order" (Id_Order)
);
