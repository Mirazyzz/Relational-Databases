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





	