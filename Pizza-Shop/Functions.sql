CREATE FUNCTION Pizza.CalculateTotal
	(
		@orderId INT
	)
RETURNS SMALLMONEY
AS
BEGIN
	DECLARE @sum SMALLMONEY;
	
	SELECT @sum = SUM(ItemPrice)
	FROM Pizza.Item
 	INNER JOIN Pizza.OrderItem ON Item_Id = Id_Item
	WHERE Order_Id = @orderId;

	SELECT @sum += SUM(MenuPrice)
	FROM Pizza.Menu
	INNER JOIN Pizza.OrderItem ON Menu_Id = Id_Menu
	WHERE Order_Id = @orderId;

	RETURN @sum;
END;


/* test
select Pizza.calculateTotal(2) as 'Total price for order 2';
*/


/* Function returning description of order */

ALTER FUNCTION Pizza.OrderDescription
	(
		@orderId INT,
		@customerId INT,
		@paymentTypeId INT
	)
RETURNS NVARCHAR(500)
AS
BEGIN
	
	DECLARE @description VARCHAR(500);	-- description overall value
	DECLARE @itemTitle NVARCHAR(50);	-- to store item titles
	DECLARE @menuTitle NVARCHAR(50);	-- to store menu titles
	DECLARE @orderDate DATE;			-- for order date
	DECLARE @totalPrice SMALLMONEY;		-- for total price of the order
	DECLARE @discount SMALLMONEY;		-- bonus
	DECLARE @address NVARCHAR(50);		-- address of the customer
	DECLARE @paymentTitle NVARCHAR(25); -- paymnet option
		
	DECLARE Items_Cursor CURSOR FOR SELECT ItemTitle
								FROM Pizza.Item
								INNER JOIN Pizza.OrderItem ON Item_Id = Id_Item
								WHERE Order_Id = @orderId;
	
	DECLARE Menus_Cursor CURSOR FOR SELECT MenuTitle
								FROM Pizza.Menu
								INNER JOIN Pizza.OrderItem ON Menu_Id = Id_Menu
								WHERE Order_Id = @orderId;

	OPEN Items_Cursor
			FETCH NEXT FROM Items_Cursor INTO @itemTitle
			WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @description += @itemTitle + ' ';
					FETCH NEXT FROM Items_Cursor INTO @itemTitle
				END;
			CLOSE Items_Cursor;
	
	OPEN Menus_Cursor
			FETCH NEXT FROM Menus_Cursor INTO @menuTitle
			WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @description += @menuTitle + ' ';
					FETCH NEXT FROM Menus_Cursor INTO @menuTitle
				END;
			CLOSE Menus_Cursor;

	SET @description = 'Order description: ';
	
	SELECT @totalPrice = TotalPrice
						 FROM Pizza."Order"
						 WHERE Id_Order = @orderId;

	SELECT @discount = Discount
						FROM Pizza."Order"
						WHERE Id_Order = @orderId;

	IF @discount IS NULL
		SET @discount = 0;

					   
	SELECT @address = Street
						FROM Pizza."Address"
						WHERE Customer_Id = @customerId;
	
	SELECT @paymentTitle = PaymentType_Name
							FROM Pizza.PaymentType
							WHERE Id_PaymentType = @paymentTypeId;
	
	SELECT @orderDate = OrderDate
						FROM Pizza."Order"
						WHERE Id_Order = @orderId;

	SET @description += 'Total price [ ' + CAST(@totalPrice AS NVARCHAR(20)) + ' ] ';
	SET @description += 'Discount [ ' + CAST(@discount AS NVARCHAR(5)) + ' ] ';
	SET @description += 'Address [ ' + @address + ' ] ';
	SET @description += 'Payment Option [ ' + @paymentTitle + ' ] ';
	SET @description += 'Delivery date [ ' + CAST(@orderDate AS NVARCHAR(20)) + ' ] ';


	RETURN @description;
END;


/* test
select Pizza.OrderDescription(1,1,2) as 'Total price for order 2';
*/