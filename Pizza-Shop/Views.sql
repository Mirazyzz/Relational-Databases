-- Check most popular item in a given date --
GO  
CREATE VIEW Pizza.TrendingItem  
AS  
SELECT DISTINCT(ItemTitle), ItemPrice, CategoryTitle, "Description"
FROM Pizza.Item
INNER JOIN Pizza.Category ON Category_Id = Id_Category
INNER JOIN Pizza.OrderItem ON Item_Id = Id_Item
INNER JOIN Pizza."Order" ON Order_Id = Id_Order
WHERE Orderdate BETWEEN '2020-07-10' AND '2020-07-12' AND Item_Id = (SELECT Item_Id
																		FROM Pizza.OrderItem
																		GROUP BY Item_Id
																		HAVING SUM(Quantity) = (SELECT MAX(c.orders)
																									FROM (SELECT SUM(Quantity) AS orders
																											FROM Pizza.OrderItem
																											WHERE Item_Id IS NOT NULL
																											GROUP BY Item_Id) c)) 
GO  
-- Query the view  
SELECT ItemPrice
FROM Pizza.TrendingItem;


-- Check customer's history --

GO
CREATE VIEW Pizza.CustomerHistory
AS
SELECT FirstName, LastName, Email, OrderDate, TotalPrice, Discount, ItemTitle, ItemPrice ItemCategory, MenuTitle, MenuPrice, PaymentType_Name, OrderType_Name
FROM Pizza.Customer
INNER JOIN Pizza.Account a ON a.Customer_Id = Id_Customer
INNER JOIN Pizza.OrderHistory oh ON Account_Id = Id_Account
INNER JOIN Pizza."Order" o ON oh.Order_Id = o.Id_Order
INNER JOIN Pizza.OrderDetails od ON od.Order_Id = o.Id_Order
INNER JOIN Pizza.PaymentType pt ON od.PaymentType_Id = pt.Id_PaymentType
INNER JOIN Pizza.OrderType ot ON od.OrderType_Id = ot.Id_OrderType
INNER JOIN Pizza.OrderItem oi ON oi.Order_Id = o.Id_Order
INNER JOIN Pizza.Menu m ON oi.Menu_Id = m.Id_Menu
INNER JOIN Pizza.Item i ON oi.Item_Id = i.Id_Item
INNER JOIN Pizza.Category c ON i.Category_Id = c.Id_Category;

GO
-- query view

SELECT FirstName, OrderDate, TotalPrice, PaymentType_Name, OrderType_Name
FROM Pizza.CustomerHistory
WHERE OrderDate BETWEEN '2020-07-10' AND '2020-07-15' AND (ItemTitle LIKE '%Pizza%' OR ItemTitle LIKE '%Drink%');

SELECT FirstName, OrderDate, MenuTitle, Discount, PaymentType_Name, OrderType_Name
FROM Pizza.CustomerHistory
WHERE OrderDate BETWEEN '2020-07-10' AND '2020-07-15' AND MenuTitle IS NOT NULL;


-- Check customer's saved items --
GO
CREATE VIEW Pizza.CustomerSavedItem
AS
SELECT FirstName, LastName, ItemTitle, ItemPrice, "Description", CategoryTitle
FROM Pizza.Customer
INNER JOIN Pizza.Account a ON a.Customer_Id = Id_Customer
INNER JOIN Pizza.SavedItem si ON si.Account_Id = a.Id_Account
INNER JOIN Pizza.Item i ON si.Item_Id = i.Id_Item
INNER JOIN Pizza.Category c ON i.Category_Id = c.Id_Category;

GO
-- query view

SELECT FirstName, Itemtitle, ItemPrice
FROM Pizza.CustomerSavedItem;


-- Get customers details for deliverer --

GO
CREATE VIEW Pizza.CustomerDetails
AS
SELECT FirstName, LastName, Phone, Street, Appartment, Flat, Pincode
FROM Pizza.Customer c
INNER JOIN Pizza.Account a ON a.Customer_Id = c.Id_Customer
INNER JOIN Pizza."Address" ad ON ad.Customer_Id = c.Id_Customer;

GO
-- query view

SELECT FirstName, Phone, Pincode, Flat
FROM Pizza.CustomerDetails
WHERE FirstName = 'Jim';


-- Get menu details --

GO
CREATE VIEW Pizza.MenuDetails
AS
SELECT MenuTitle, MenuPrice, ItemTitle, ItemPrice, "Description", CategoryTitle
FROM Pizza.MenuItem mi
INNER JOIN Pizza.Menu m ON mi.Menu_Id = m.Id_Menu
INNER JOIN Pizza.Item i ON mi.Item_Id = i.Id_Item
INNER JOIN Pizza.category c ON i.Category_Id = c.Id_Category;


GO
-- query view

SELECT ItemTitle, "Description"
FROM Pizza.MenuDetails
WHERE MenuPrice < 15
ORDER BY ItemTitle;

-- query view
SELECT MenuTitle, ItemTitle, "Description", CategoryTitle
FROM Pizza.MenuDetails
WHERE MenuTitle NOT LIKE '%Daily%' AND MenuTitle NOT LIKE '%Weekly%'
ORDER BY MenuTitle, ItemTitle;


-- Get employees who delivered to Centrum street --

GO
CREATE VIEW Pizza.GetDeliverers
AS
SELECT e.FirstName, e.LastName, Street, OrderDate, TotalPrice, PaymentType_Name
FROM Pizza.Employee e
INNER JOIN Pizza.OrderDetails od ON od.Deliver_Id = e.Id_Employee
INNER JOIN Pizza.PaymentType pt ON od.PaymentType_Id = pt.Id_PaymentType
INNER JOIN Pizza."Order" o ON od.Order_Id = o.Id_Order
INNER JOIN Pizza.Customer c ON o.Customer_Id = c.Id_Customer
INNER JOIN Pizza."Address" a ON a.Customer_Id = c.Id_Customer;


GO
-- query view
SELECT FirstName, OrderDate, TotalPrice, PaymentType_Name
FROM Pizza.GetDeliverers;