/* Find the cheapest and the most expensive menu */

SELECT DISTINCT(SELECT MIN(MenuPrice) FROM Pizza.Menu) AS "Cheapest", MAX(MenuPrice) AS "Most expensive"
FROM Pizza.Menu;

/* Display all Pizzas which are less than average price of any category in the shop */

SELECT ItemTitle, ItemPrice
FROM Pizza.Item
INNER JOIN Pizza.Category ON Category_Id = Id_Category
WHERE CategoryTitle LIKE '%Pizza%' AND ItemPrice <	ANY (SELECT AVG(ItemPrice)
														FROM Pizza.Item
														INNER JOIN Pizza.Category ON Category_Id = Id_Category
														GROUP BY Category_Id);


/* Show everything that offers the cheapest menu and its description*/

SELECT MenuTitle, ItemTitle, CategoryTitle, MenuPrice
FROM Pizza.Menu
INNER JOIN Pizza.MenuItem ON Id_Menu = Menu_Id
INNER JOIN Pizza.Item ON Id_Item = Item_Id
INNER JOIN Pizza.Category ON Id_Category = Category_Id
WHERE MenuPrice = (SELECT MIN(MenuPrice)
					FROM Pizza.Menu)
ORDER BY MenuTitle, ItemTitle;


/* Display all order items either with menu title or item title */

SELECT MenuTitle AS "Orders"
FROM Pizza.Menu
INNER JOIN Pizza.OrderItem ON Menu_Id = Id_Menu
UNION
SELECT ItemTitle
FROM Pizza.OrderItem
INNER JOIN Pizza.Item ON Item_Id = Id_Item
ORDER BY MenuTitle;


/* Which Pizza hasnt been tried yet? */

SELECT DISTINCT(FirstName)
FROM Pizza.Customer
INNER JOIN Pizza."Order" ON Customer_Id = Id_Customer
INNER JOIN Pizza.OrderItem ON Order_Id = Id_Order
INNER JOIN Pizza.Item ON Item_Id = Id_Item
INNER JOIN Pizza.Category ON Category_Id = Id_Category
WHERE  Category_Id != ALL (SELECT Id_Category
							FROM Pizza.Category
							WHERE CategoryTitle LIKE '%Pizza%');

SELECT DISTINCT(ItemTitle)
FROM Pizza.Item
INNER JOIN Pizza.OrderItem ON Item_Id = Id_Item
INNER JOIN Pizza."Order" ON Order_Id = Id_Order
INNER JOIN Pizza.Customer ON Customer_Id = Id_Customer
WHERE Customer_Id NOT IN (SELECT Customer_Id
							FROM Pizza.Customer
							INNER JOIN Pizza."Order" ON Customer_Id = Id_Customer
							INNER JOIN Pizza.OrderItem ON Order_Id = Id_Order
							INNER JOIN Pizza.Item ON Item_Id = Id_Item
							INNER JOIN Pizza.Category ON Category_Id = Id_Category
							WHERE EXISTS (SELECT Id_Category
							FROM Pizza.Category
							WHERE CategoryTitle LIKE '%Pizza%'));


/* Find the cheapest and most expensive item in each menu */

SELECT MenuTitle AS "Menu", ItemTitle AS "Item", ItemPrice
FROM Pizza.Item
INNER JOIN Pizza.MenuItem m ON Item_Id = Id_Item
INNER JOIN Pizza.Menu ON Menu_Id = Id_Menu
WHERE ItemPrice = (SELECT MIN(ItemPrice)
					FROM Pizza.Item
					INNER JOIN Pizza.MenuItem ON Item_Id = Id_Item
					WHERE m.Menu_Id = Menu_Id
					GROUP BY Menu_Id)
UNION
SELECT MenuTitle AS "Menu", ItemTitle AS "Item", ItemPrice
FROM Pizza.Item
INNER JOIN Pizza.MenuItem m ON Item_Id = Id_Item
INNER JOIN Pizza.Menu ON Menu_Id = Id_Menu
WHERE ItemPrice = (SELECT MAX(ItemPrice)
					FROM Pizza.Item
					INNER JOIN Pizza.MenuItem ON Item_Id = Id_Item
					WHERE m.Menu_Id = Menu_Id
					GROUP BY Menu_Id)
ORDER BY MenuTitle, ItemPrice;


/* Show the most frequent client */

SELECT FirstName, LastName, COUNT(Id_Order) AS "Number of orders"
FROM Pizza.Customer
INNER JOIN Pizza."Order" ON Customer_Id = Id_Customer
GROUP BY FirstName, LastName
HAVING COUNT(Id_Order) = (SELECT MAX(c.orders)
							FROM (SELECT COUNT(Id_Order) AS orders
									FROM Pizza."Order"
									GROUP BY Customer_Id) c);


/* For each category of item show average price of it */

SELECT CategoryTitle, AVG(ItemPrice)
FROM Pizza.Item
LEFT JOIN Pizza.Category ON Id_Category = Category_Id
GROUP BY CategoryTitle;


/* Find the most popular category of items for a given period */

SELECT CategoryTitle
FROM Pizza.Category
INNER JOIN Pizza.Item ON Category_Id = Id_Category
INNER JOIN Pizza."OrderItem" ON Item_Id = Id_Item
GROUP BY CategoryTitle
HAVING COUNT(Id_OrderItem) = (SELECT MAX(c.orders)
								FROM (SELECT COUNT(Id_OrderItem) AS orders
										FROM Pizza.OrderItem
										INNER JOIN Pizza."Order" ON Order_Id = Id_Order
										WHERE Item_Id IS NOT NULL AND OrderDate BETWEEN '2020-07-10' AND '2020-07-15'
										GROUP BY Item_Id) c );


/* Find all employees which earn more than average salary in the Pizza Shop */

SELECT FirstName, Salary, Position_Title
FROM Pizza.Employee e
INNER JOIN Pizza.Position p ON p.Id_Position = e.Position_Id
WHERE Salary > (SELECT AVG(Salary)
				FROM Pizza.Position);


/* Show most popular item in the shop */

SELECT CategoryTitle, ItemTitle, ItemPrice, "Description"
FROM Pizza.Item
INNER JOIN Pizza.Category ON Id_Category = Category_Id
WHERE Id_Item IN (SELECT Item_Id
					FROM Pizza.OrderItem
					WHERE Item_Id IS NOT NULL
				    GROUP BY Item_Id
				   	HAVING COUNT(Id_OrderItem) = (SELECT MAX(c.items)
												   FROM (SELECT COUNT(Id_OrderItem) AS items
														  FROM Pizza.OrderItem
														  WHERE Item_Id IS NOT NULL
														  GROUP BY Item_Id) c));


/* Find Deliverer who had the most delivers */

SELECT FirstName
FROM Pizza.Employee e
INNER JOIN Pizza.Position p ON p.Id_Position = e.Position_Id
WHERE Position_Title = 'Deliver' AND e.Id_Employee = (SELECT MAX(c.orders)
														FROM (SELECT COUNT(Id_OrderDetails) AS orders
																FROM Pizza.OrderDetails
																WHERE Deliver_Id IS NOT NULL
																GROUP by Deliver_Id) c);


/* For each customer show his favourite pizza */

SELECT FirstName, ItemTitle
FROM Pizza.OrderItem
INNER JOIN Pizza."Order" o ON Order_Id = Id_Order
INNER JOIN Pizza.Customer ON Customer_Id = Id_Customer
INNER JOIN Pizza.Item ON Item_Id = Id_Item
INNER JOIN Pizza.Category ON Category_Id = Id_Category
WHERE CategoryTitle LIKE '%Pizza%'
GROUP BY Customer_id, FirstName, ItemTitle
HAVING COUNT(Id_OrderItem) = (SELECT MAX(c.items)
								FROM (SELECT COUNT(Item_Id) AS items
										FROM Pizza.OrderItem
										INNER JOIN Pizza."Order" ON Order_Id = Id_Order
										INNER JOIN Pizza.Customer ON Customer_Id = Id_Customer
										INNER JOIN Pizza.Item ON Item_Id = Id_Item
										INNER JOIN Pizza.Category ON Category_Id = Id_Category
										WHERE CategoryTitle LIKE '%Pizza%' AND Customer_Id = o.Customer_Id
										GROUP BY FirstName, ItemTitle) c)
ORDER BY FirstName;
