USE projects;

---- Category ----
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Cold Drinks');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Hot Drinks');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Polska Pizza');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Italian Pizza');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Vegeterian Pizza');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Dessert');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Sauce');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Cheese');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Vegetable');
INSERT INTO Pizza.Category (CategoryTitle) VALUES ('Meat');

SELECT * FROM Pizza.Category;


---- Item ----
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Coca-Cola', 5, 'Original Coke', 1);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Fanta', 5, 'Cold Carbonated', 1);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Sprite', 5, 'Cold Carbonated', 1);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Lipton', 5.5, 'Cold Green Tea', 1);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Lipton', 5.5, 'Cold Lemon Tea', 1);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Ahmad Tea', 4, 'Hot Black Tea', 2);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Ahmad Tea', 4, 'Hot Green Tea', 2);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Pizza z Serem', 10, 'Pizza with cheese and tomato', 3);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Pizza Smaczna z Podwojnem serem', 13.5, 'Pizza with vegetables and double cheese', 3);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Pizza z Kurczakem', 14.3, 'Pizza with chicken meat and cheese and tomato', 3);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Italiano Chilintano', 15.6, 'Pizza with cheese, tomato, vegetables and chilli sauce', 4);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Italiano', 14.5, 'Italian Pizza with sweat sauce and beef meat', 4);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Italiantano', 15, 'Pizza with vegetables and Italian Cheese', 4);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Pizza with Beef', 13.5, 'Pizza with double Beef meat and Cheese', 4);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Chickeniano', 12.8, 'Piza with chicken meat and vegetables', 4);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Fit Pizza', 10.5, 'Pizza with vegetables and double cheese', 5);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Tomato Pizza', 9.7, 'Pizza with tomato and cheese', 5);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Bay Leaf', 9.7, 'Pizza with Tomato and Bay Leaf', 5);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Pancakes', 12.3, 'Sweet Pancakes with bounty sauce', 6);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Chocoloate cake', 3, 'Snikers cake', 6);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Tomato', 3, 'Tomato sauce', 7);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Chilly', 3, 'Chilly sauce', 7);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Garlic', 3, 'Garlic sauce', 7);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Cheesy', 4.2, 'Goat cheese', 8);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Hohland', 3.5, 'Hohland cheese', 8);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Tomato', 3, 'Fresh vegetable tomato', 9);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Leaf', 2, 'Leaf', 9);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Carrot', 2, 'Gratered Carrot', 9);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Pepper', 2, 'Red Pepper', 9);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Chicken', 2, 'Chicken meat', 10);
INSERT INTO Pizza.Item (ItemTitle, ItemPrice, "Description", Category_Id) VALUES ('Beaf', 2, 'Beef meat', 10);

SELECT * FROM Pizza.Item;


---- Menu ----
INSERT INTO Pizza.Menu (MenuTitle, MenuPrice) VALUES ('Daily Offer', 15);
INSERT INTO Pizza.Menu (MenuTitle, MenuPrice) VALUES ('Special Offer', 17.5);
INSERT INTO Pizza.Menu (MenuTitle, MenuPrice) VALUES ('NEW!!!', 15.4);
INSERT INTO Pizza.Menu (MenuTitle, MenuPrice) VALUES ('Summer menu', 13.2);
INSERT INTO Pizza.Menu (MenuTitle, MenuPrice) VALUES ('Sweet Menu', 18.8);

SELECT * FROM Pizza.Menu;


---- Menu Item ----
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (1, 1);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (3, 1);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (23, 1);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (3, 2);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (4, 2);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (22, 2);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (4, 3);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (14, 3);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (22, 3);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (1, 4);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (4, 4);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (12, 4);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (22, 4);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (4, 5);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (4, 5);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (6, 5);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (19, 5);
INSERT INTO Pizza.MenuItem (Item_Id, Menu_Id) VALUES (20, 5);

SELECT * FROM Pizza.MenuItem;


---- Customer ----
INSERT INTO Pizza.Customer (FirstName, LastName, Phone) VALUES ('Jim', 'Carry', '552-887-990');
INSERT INTO Pizza.Customer (FirstName, LastName, Phone) VALUES ('Alex', 'Stimpson', '452-887-990');
INSERT INTO Pizza.Customer (FirstName, LastName, Phone) VALUES ('Nina', 'Watson', '522-687-990');
INSERT INTO Pizza.Customer (FirstName, LastName, Phone) VALUES ('Alexa', 'Gustafson', '512-827-490');
INSERT INTO Pizza.Customer (FirstName, LastName, Phone) VALUES ('Maria', 'DB', '122-587-690');

SELECT * FROM Pizza.Customer;


---- Address ----
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (1, 'Gagarina 52', '12', '4212', '5');
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (1, 'Kozykowa 12', '22', '8812', '1');
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (2, 'Centrum 5', '12', '8972', '2');
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (3, 'Gagarina 4', '12', '5252', '3');
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (3, 'Zlote Tarasy 32', '12', '4412', '4');
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (4, 'Krucza 21', '12', '3312', '1');
INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat) VALUES (5, 'Hala Mirowska 22', '12', '3322', '1');

SELECT * FROM Pizza."Address";


---- Order ----
INSERT INTO Pizza."Order" (Customer_Id) VALUES (1);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (2);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (3);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (4);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (5);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (5);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (5);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (2);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (3);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (4);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (4);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (1);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (1);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (5);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (1);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (5);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (2);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (1);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (3);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (3);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (2);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (2);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (2);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (3);
INSERT INTO Pizza."Order" (Customer_Id) VALUES (4);
SELECT * FROM Pizza."Order";


---- Payment type ----
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (1, 1, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (1, 2, 5);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (2, 1, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (2, 1, 4);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (3, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (3, 3, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (4, 5, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (5, 2, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (6, 1, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (6, 1, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (6, 2, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (6, 1, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (6, 2, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (7, 3, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (7, 1, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (8, 3, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (8, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (9, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (9, 4, 9);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (10, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (11, 5, 8);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (12, 5, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (12, 5, 7);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (12, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (13, 3, 6);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (14, 2, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (15, 2, 5);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (16, 2, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (16, 1, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (16, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (16, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (16, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (17, 1, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (17, 3, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (17, 3, 4);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (18, 5, 5);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (18, 5, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (18, 5, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (19, 5, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (20, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (21, 3, 4);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (22, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (22, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (23, 5, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (24, 5, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (25, 5, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Menu_Id, Quantity) VALUES (25, 2, 2); -- menu
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (1, 1, 1); -- item
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (1, 2, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (2, 2, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (2, 3, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (3, 4, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (4, 5, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (4, 6, 4);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (4, 6, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (5, 7, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (5, 8, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (5, 9, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (6, 10, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (6, 12, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (6, 11, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (7, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (8, 5, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (9, 6, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (10, 7, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (11, 8, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (12, 10, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (13, 12, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (14, 4, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (15, 15, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (15, 14, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (15, 16, 6);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (16, 17, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (17, 18, 5);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (18, 19, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (19, 30, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (20, 31, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (20, 21, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (21, 22, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (22, 24, 2);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (23, 28, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (23, 15, 3);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (24, 27, 4);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (25, 29, 1);
INSERT INTO Pizza.OrderItem (Order_Id, Item_Id, Quantity) VALUES (25, 26, 2);

SELECT * FROM Pizza.OrderItem;


---- Position ----
INSERT INTO Pizza.Position (Position_Title, Salary) VALUES ('Cheef', 5000);
INSERT INTO Pizza.Position (Position_Title, Salary) VALUES ('Deliver', 3700);
INSERT INTO Pizza.Position (Position_Title, Salary) VALUES ('Accountant', 4200);
INSERT INTO Pizza.Position (Position_Title, Salary) VALUES ('Cashier', 3700);
INSERT INTO Pizza.Position (Position_Title, Salary) VALUES ('Manager', 5100);
INSERT INTO Pizza.Position (Position_Title, Salary) VALUES ('Cook', 3600);


SELECT * FROM Pizza.Position;


---- Employee ----
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (1, 'John', 'Done', '123-421-232');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (2, 'Robert', 'Robertson', '213-421-432');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (2, 'James', 'Bond', '123-441-132');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (2, 'Tim', 'Corney', '123-425-222');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (2, 'Anderson', 'Silva', '122-421-232');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (3, 'Mike', 'Tyson', '123-431-252');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (4, 'Steve', 'Works', '223-321-239');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (5, 'Dave', 'Shapelle', '223-421-832');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (5, 'Nick', 'Diaz', '155-425-272');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (5, 'Bill', 'Doors', '125-421-632');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (6, 'Albert', 'Watson', '223-421-832');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (6, 'Alice', 'Steveson', '155-425-272');
INSERT INTO Pizza.Employee (Position_Id, FirstName, LastName, Phone) VALUES (6, 'Michael', 'Clark', '125-421-632');

SELECT * FROM Pizza.Employee;


---- Payment type ----
INSERT INTO Pizza.PaymentType (PaymentType_Name) VALUES ('Card');
INSERT INTO Pizza.PaymentType (PaymentType_Name) VALUES ('Cash');
INSERT INTO Pizza.PaymentType (PaymentType_Name) VALUES ('Bank transfer');
INSERT INTO Pizza.PaymentType (PaymentType_Name) VALUES ('Bill');
INSERT INTO Pizza.PaymentType (PaymentType_Name) VALUES ('Bitcoin');
INSERT INTO Pizza.PaymentType (PaymentType_Name) VALUES ('Google pay');

SELECT * FROM Pizza.PaymentType;


---- Payment type ----
INSERT INTO Pizza.OrderType (OrderType_Name) VALUES ('Take out');
INSERT INTO Pizza.OrderType (OrderType_Name) VALUES ('Delivery');

SELECT * FROM Pizza.OrderType;


---- Order Details ----
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (1, 2, 2, 1);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (2, 2, 2, 4);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (3, 3, 2, 2);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (4, 4, 2, 1);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (5, 5, 2, 1);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (6, 1, 2, 3);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (7, 1, 2, 2);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (8, 2, 2, 4);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (9, 3, 2, 4);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (10, 4, 2, 3);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (11, 5, 2, 2);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id) VALUES (12, 3, 2, 4);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id) VALUES (13, 6, 1);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id) VALUES (13, 5, 1);
INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id) VALUES (13, 6, 1);


SELECT * FROM Pizza.OrderDetails;


---- Account ----
INSERT INTO Pizza.Account (Customer_Id, CreditCard, Email, Password) 
VALUES (1, '1234-2132-4252-5212 11/21 423', 'Jim@email.com', 'strongpassword');
INSERT INTO Pizza.Account (Customer_Id, CreditCard, Email, Password) 
VALUES (2, '1234-2132-4252-5212 11/21 423', 'Jim@email.com', 'strongpassword');
INSERT INTO Pizza.Account (Customer_Id, CreditCard, Email, Password) 
VALUES (3, '1234-2132-4252-5212 11/21 423', 'Jim@email.com', 'strongpassword');
INSERT InTO Pizza.Account (Customer_Id, CreditCard, Email, Password) 
VALUES (4, '1234-2132-4252-5212 11/21 423', 'Jim@email.com', 'strongpassword');
INSERT INTO Pizza.Account (Customer_Id, CreditCard, Email, Password) 
VALUES (5, '1234-2132-4252-5212 11/21 423', 'Jim@email.com', 'strongpassword');

SELECT * FROM Pizza.Account;


---- Saved Order ----
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (1, 2);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (1, 1);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (2, 5);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (3, 4);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (3, 3);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (4, 6);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (4, 7);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (5, 8);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (5, 9);
INSERT INTO Pizza.SavedOrder (Account_Id, Order_Id) VALUES (5, 10);

SELECT * FROM Pizza.SavedOrder;


---- Saved Item ----
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (1, 5);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (1, 2);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (1, 13);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (1, 9);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (2, 7);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (2, 4);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (3, 5);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (3, 10);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (4, 15);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (4, 21);
INSERT INTO Pizza.SavedItem (Account_Id, Item_Id) VALUES (5, 22);

SELECT * FROM Pizza.SavedItem;