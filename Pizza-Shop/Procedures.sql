EXECUTE Pizza.NewItemOrder 2, 2, 4, 1, 1, 1;
SELECT * FROM PIZZA."Order";
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

		IF NOT EXISTS (SELECT Id_Customer FROM Pizza.Customer)
			BEGIN
				RAISERROR('There is no customer with given id', 1, 1);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_Item FROM Pizza.Item)
			BEGIN
				RAISERROR('There is no item with given id', 1, 2);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_Menu FROM Pizza.Menu)
			BEGIN
				RAISERROR('There is no menu with given id', 1, 1);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_PaymentType FROM Pizza.PaymentType)
			BEGIN
				RAISERROR('There is no type of paymnet with given id', 1, 1);
				RETURN;
			END;
		IF NOT EXISTS (SELECT Id_OrderType FROM Pizza.OrderType)
			BEGIN
				RAISERROR('There is no service of delivery with given id', 1, 3);
				RETURN;
			END;

		INSERT INTO Pizza."Order" (Customer_Id) VALUES (@customerId);
		SET @orderId = @@IDENTITY;
		
		INSERT INTO Pizza.OrderItem (Item_Id, Order_Id, Quantity)
		VALUES (@itemId, @orderId, @quantity);
			
		INSERT INTO Pizza.OrderDetails (Order_Id, PaymentType_Id, OrderType_Id, Deliver_Id)
		VALUES (@orderId, @paymentTypeId, @orderTypeId, @deliver_Id);
		
END;
	