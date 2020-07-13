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