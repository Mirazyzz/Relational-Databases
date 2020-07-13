/* Trigger which calculates total price of all items in order and discount 
	if total price is more than 15$ - discount 10%
	if total price is more than 20$ - discount 15%
	if total price is more than 30$ - disocunt 20%
*/

CREATE TRIGGER TRG_CalcTotalPrice ON Pizza.OrderItem
	AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @sum SMALLMONEY; /* for calculating total sum */
		DECLARE @discount SMALLMONEY; /* for setting discount */
		DECLARE @IdOrder INT;
		DECLARE @PrintMessage NVARCHAR(50);

		IF EXISTS (SELECT * FROM inserted)
			BEGIN
				PRINT 'TRIGGER';
				PRINT 'Trigger print: orderId - ' + CAST(@idorder as nvarchar(10));
				SELECT @IdOrder = Order_Id FROM INSERTED;
				SET @sum = Pizza.CalculateTotal(@IdOrder);	-- calculate total price by passing id of order to function
				SET @discount =
				CASE
					WHEN @sum > 15 THEN @sum * 0.1
					WHEN @sum > 20 THEN @sum * 0.15
					WHEN @sum > 30 THEN @sum * 0.20
					ELSE 0
				END;
				PRINT @IdOrder;
				UPDATE Pizza."Order" SET TotalPrice = @sum, Discount = @discount WHERE Id_Order = @IdOrder;
			END;
		ELSE
			BEGIN
				SELECT @IdOrder = Order_Id FROM UPDATED;
				SET @sum = Pizza.CalculateTotal(@IdOrder);
				/* check value of sum */
				SET @discount =
				CASE
					WHEN @sum > 15 THEN @sum * 0.1
					WHEN @sum > 20 THEN @sum * 0.15
					WHEN @sum > 30 THEN @sum * 0.20
					ELSE 0
				END;
				UPDATE Pizza."Order" SET TotalPrice = @sum WHERE Id_Order = @IdOrder;
			END;
		SET @PrintMessage = N'Total sum for order ' + CAST(@IdOrder AS nvarchar(10)) + ' is: ' + CAST(@sum AS NVARCHAR(10));
		PRINT @PrintMessage;
END;


/* Trigger which blocks deleting category of item if there is still at least one item under this category */

CREATE TRIGGER TRG_DeleteCategory ON Pizza.Category
	FOR DELETE
AS
	BEGIN
		DECLARE @items INT; /* to display how many items there are under this category yet */
		DECLARE @deletedId INT; /* to get id of deleted category */
		DECLARE @errorMsg NVARCHAR(50);
		
		SELECT @deletedId = Id_Category FROM deleted;

		SELECT @items = COUNT(Id_Item) 
		FROM Pizza.Item 
		WHERE Category_Id = @deletedId
		GROUP BY Category_Id;

		IF @items > 0
			BEGIN
				SET @errorMsg = 'There are ' + CAST(@items AS NVARCHAR(5)) + ' items under this category';
				RAISERROR(@errorMsg, 0, 1) WITH NOWAIT;
				ROLLBACK;
			END;
		ELSE
			PRINT 'Category: ' + CAST(@deletedId AS NVARCHAR(10)) + ' was deleted';
END;


/* Trigger which will store new order of a customer to order history table */

CREATE TRIGGER TRG_OrderHistory ON Pizza."Order"
	FOR INSERT, UPDATE
AS
	BEGIN
		
		DECLARE @OrderId INT;	/* to get id of inserted/updated order */
		DECLARE @AccountId INT;	/* find customer by account */

		IF EXISTS (SELECT * FROM inserted)	-- if it is insert
			BEGIN
				SELECT @OrderId = Id_Order FROM inserted;
				
				SELECT @AccountId = Id_Account 
				FROM Pizza.Account 
				WHERE Customer_Id = (SELECT Customer_Id 
									FROM Pizza."Order" 
									WHERE Id_Order = @OrderId);

				INSERT INTO Pizza.OrderHistory (Account_Id, Order_Id)
				VALUES (@AccountId, @OrderId);
			END;
		ELSE -- then it is update
			BEGIN
				SELECT @OrderId = Id_Order FROM updated;

				SELECT @AccountId = Id_Account
				FROM Pizza.Account
				WHERE Customer_Id = (SELECT Customer_Id
									FROM Pizza."Order"
									WHERE Id_Order = @OrderId);

				UPDATE Pizza.OrderHistory
				SET Account_Id = @AccountId;
			END;
END;


/* Trigger to give a bonus for delivers if they have delivered certain amount of orders monthly and set the description*/

CREATE TRIGGER TRG_DeliverBonus ON Pizza.OrderDetails
	FOR INSERT, UPDATE
AS
	BEGIN
		
		DECLARE @idOrderDetails INT;
		DECLARE @bonus SMALLMONEY;	-- to give certain bonus
		DECLARE @deliverId INT; -- to choose deliver which was assigned to order
		DECLARE @ordersCount INT;	-- to count number of his orders in current month
		DECLARE @orderDescription NVARCHAR(500);
		DECLARE @orderId INT;
		DECLARE @customerId INT;
		DECLARE @paymentTypeId INT;

		IF EXISTS (SELECT * FROM inserted)
			BEGIN
				SELECT @deliverId = Deliver_Id FROM inserted;
				SELECT @orderId = Order_Id FROM inserted;
				SELECT @paymentTypeId = paymentType_Id FROM inserted;
				SELECT @customerId = Customer_Id FROM Pizza."Order" WHERE Id_Order = @orderId;
				SELECT @idOrderDetails = Id_OrderDetails FROM inserted;

				SET @orderDescription = Pizza.OrderDescription(@orderId, @customerId, @paymentTypeId);
			END;
		ELSE
			BEGIN
				SELECT @deliverId = Deliver_Id FROM updated;
				SELECT @deliverId = Deliver_Id FROM updated;
				SELECT @orderId = Order_Id FROM updated;
				SELECT @paymentTypeId = paymentType_Id FROM updated;
				SELECT @customerId = Customer_Id FROM Pizza."Order" WHERE Id_Order = @orderId;
				SELECT @idOrderDetails = Id_OrderDetails FROM updated;

				SET @orderDescription = Pizza.OrderDescription(@orderId, @customerId, @paymentTypeId);
			END;

		IF @deliverId IS NOT NULL
			SELECT @ordersCount = COUNT(Order_Id) 
			FROM Pizza.OrderDetails
			WHERE Deliver_Id = @deliverId AND Order_Id IN (SELECT Id_Order
															FROM Pizza."Order"
															WHERE MONTH(OrderDate) = MONTH(GETDATE()))	-- get orders in this month
			GROUP BY Deliver_Id;
		
		BEGIN
			/* check number of orders */
			SET @bonus =
			CASE
				WHEN @ordersCount > 15 THEN 10
				WHEN @ordersCount > 20 THEN 20
				WHEN @ordersCount > 30 THEN 50
				ELSE 0
			END;

			UPDATE Pizza.Employee
			SET Bonus = @bonus
			WHERE Id_Employee = @deliverId;

			UPDATE Pizza.OrderDetails
			SET OrderDescription = @orderDescription
			WHERE Id_OrderDetails = @idOrderDetails;
		END;
END;