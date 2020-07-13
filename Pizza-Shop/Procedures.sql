/* Make a new order */
CREATE PROCEDURE Pizza.NewItemOrder
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
		@percent INT = 20
	)
AS
	BEGIN
		IF @percent > 0
			SELECT @newSalary = Salary + Salary * @percent / 100
			FROM Pizza.Position
			WHERE Position_Title = @position;
		ELSE
			SELECT @newSalary = Salary + Salary * @percent / 100
			FROM Pizza.Position
			WHERE Position_Title = @position;

END;

DECLARE @newSalary MONEY;
EXECUTE ChangeSalary 'Accountant', @newSalary OUTPUT, -70;
PRINT @newSalary;