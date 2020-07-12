CREATE TRIGGER TRG_CalcTotalPrice ON Pizza.OrderItem
	AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @sum SMALLMONEY; /* for calculating total sum */
		DECLARE @IdOrder INT;
		DECLARE @PrintMessage NVARCHAR(50);

		IF EXISTS (SELECT * FROM inserted)
			BEGIN
				SELECT @IdOrder = Order_Id FROM INSERTED;
				SET @sum = Pizza.CalculateTotal(@IdOrder);
				UPDATE Pizza."Order" SET TotalPrice = @sum WHERE Id_Order = @IdOrder;
			END;
		ELSE
			BEGIN
				SELECT @IdOrder = Order_Id FROM UPDATED;
				SET @sum = Pizza.CalculateTotal(@IdOrder);
				UPDATE Pizza."Order" SET TotalPrice = @sum WHERE Id_Order = @IdOrder;
			END;
		SET @PrintMessage = N'Total sum for order ' + CAST(@IdOrder AS nvarchar(10)) + ' is: ' + CAST(@sum AS NVARCHAR(10));
		PRINT @PrintMessage;
	END;