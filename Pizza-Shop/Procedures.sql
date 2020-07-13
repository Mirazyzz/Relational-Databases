/* Make a new order */
ALTER PROCEDURE Pizza.NewItemOrder
	(
		@customerId INT,
		@itemId INT = 0,
		@quantity INT,
		@paymentTypeId INT,
		@orderTypeId INT,
		@deliver_Id INT
	)
AS
	BEGIN
		
		DECLARE @orderId INT;

		IF NOT EXISTS (SELECT Id_Customer FROM Pizza.Customer WHERE Id_Customer = @customerId)
			BEGIN
				RAISERROR('There is no customer with given id!', 16, 0);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_Item FROM Pizza.Item WHERE Id_Item = @itemId)
			BEGIN
				RAISERROR('There is no item with given id!', 16, 0);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_PaymentType FROM Pizza.PaymentType WHERE Id_PaymentType = @paymentTypeId)
			BEGIN
				RAISERROR('There is no type of paymnet with given id!', 16, 0);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_OrderType FROM Pizza.OrderType WHERE Id_OrderType = @orderTypeId)
			BEGIN
				RAISERROR('There is no service of delivery with given id!', 16, 0);
				RETURN;
			END;

		INSERT INTO Pizza."Order" (Customer_Id) VALUES (@customerId);
		SET @orderId = @@IDENTITY;
		
		INSERT INTO Pizza.OrderItem (Item_Id, Order_Id, Quantity)
		VALUES (@itemId, @orderId, @quantity);
			
		INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id)
		VALUES (@orderId, @paymentTypeId, @orderTypeId, @deliver_Id);
END;

/* test
EXECUTE Pizza.NewItemOrder 5, 25, 44, 1, 1, 1;
EXECUTE Pizza.NewItemOrder 50, 25, 44, 1, 1, 1;
*/


/* Add new customer */

CREATE PROCEDURE Pizza.NewCustomer
	(
		@firstName NVARCHAR(50),
		@lastName NVARCHAR(50),
		@phone	NVARCHAR(15),
		@email NVARCHAR(50),
		@creditCard NVARCHAR(50),
		@password NVARCHAR(50),
		@street NVARCHAR(150),
		@appartment NVARCHAR(150),
		@pincode NVARCHAR(150),
		@flat NVARCHAR(150)
	)
AS
	BEGIN
		
		DECLARE @customerId INT;

		INSERT INTO Pizza.Customer (FirstName, LastName, Phone)
		VALUES (@firstName, @lastName, @phone);

		SET @customerId = @@IDENTITY;

		INSERT INTO Pizza.Account (Customer_Id, CreditCard, Email, Password)
		VALUES (@customerId, @creditCard, @email, @password);

		INSERT INTO Pizza."Address" (Customer_Id, Street, Appartment, Pincode, Flat)
		VALUES (@customerId, @street, @appartment, @pincode, @flat);

		PRINT 'New customer was added';
END;
	
/* test
execute Pizza.NewCustomer 'John', 'Johnson', '500-120-452', 'john@gmail.com', '3124 4213 3212 3212 12/21', 'strongpassword', 'street', 'appartment', '2133', '32';

SELECT TOP 1 *
FROM Pizza.CustomerDetails
ORDER BY Id_Customer DESC;
*/


/* Change salary to given position of employees */

CREATE PROCEDURE ChangeSalary
	(
		@position NVARCHAR(50),
		@newSalary MONEY OUTPUT,
		@changedTo MONEY OUTPUT,
		@percent INT = 20
	)
AS
	BEGIN
		
			SELECT @changedTo = Salary * @percent / 100
			FROM Pizza.Position
			where Position_Title = @position;

			SELECT @newSalary = Salary + Salary * @percent / 100
			FROM Pizza.Position
			WHERE Position_Title = @position;

		UPDATE Pizza.Position
		SET Salary = @newSalary
		WHERE Position_Title = @position;
END;

/* test
DECLARE @newSalary MONEY;
DECLARE @changedTo MONEY;
EXECUTE ChangeSalary 'Accountant', @newSalary OUTPUT, @changedTo OUTPUT, -10;
PRINT @newSalary;
PRINT @changedTo;
*/


CREATE PROCEDURE AddNewMenu
	(
		@menuTitle NVARCHAR(150),
		@menuPrice SMALLMONEY
	)
AS
	BEGIN
		
		IF EXISTS (SELECT Id_Menu
					FROM Pizza.Menu
					WHERE MenuTitle = @menuTitle)
			BEGIN
				RAISERROR ('There is already such a menu with given title, please choose another name', 14, 1);
				RETURN;
			END;
		ELSE
			INSERT INTO Pizza.Menu (MenuTitle, MenuPrice)
			VALUES (@menuTitle, @menuPrice);

		PRINT 'New menu' + @menuTitle + ' was added';
END;

/*
EXECUTE AddNewMenu 'NewMenu', 50;
EXECUTE AddNewMenu 'NewMenu', 50; -- EXCEPTION
*/

CREATE PROCEDURE AddItemToMenu
	(
		@menuTitle NVARCHAR(150),
		@itemTitle NVARCHAR(150)
	)
AS
	BEGIN
		
		DECLARE @menuId INT;
		DECLARE @itemId INT;

		IF NOT EXISTS (SELECT Id_item
						FROM Pizza.Item
						WHERE ItemTitle = @itemTitle)
			BEGIN
				RAISERROR('There is no such an item with given title!', 14, 1);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_Menu
						FROM Pizza.Menu
						WHERE MenuTitle = @menuTitle)
			BEGIN
				RAISERROR('There is no such a menu with given title', 14, 1);
				RETURN
			END;

		SELECT @itemId = Id_Item FROM Pizza.Item WHERE ItemTitle = @itemTitle;
		SELECT @menuId = Id_Menu FROM Pizza.Menu WHERE MenuTitle = @menuTitle;

		INSERT INTO Pizza.MenuItem (Item_Id, Menu_id)
		VALUES (@itemId, @menuId);
END;