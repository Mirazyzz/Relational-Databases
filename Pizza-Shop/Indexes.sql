CREATE NONCLUSTERED INDEX IX_NonClustered ON Pizza.Item
(
	Category_Id ASC,
	ItemTitle
)
	INCLUDE (ItemPrice);

CREATE NONCLUSTERED INDEX Ix_NonClustered ON Pizza.Employee
(
	Position_Id ASC
)
	INCLUDE (FirstName, LastName);

CREATE NONCLUSTERED INDEX Ix_NonClustered ON Pizza."Order"
(
	Customer_Id ASC,
	Orderdate ASC
);

CREATE UNIQUE INDEX Ix_Unique ON Pizza.Menu
(
	MenuTitle,
	MenuPrice
);

CREATE NONCLUSTERED INDEX Ix_NonClustered ON Pizza.MenuItem
(
	Item_Id ASC,
	Menu_Id ASC
);

CREATE UNIQUE INDEX Ix_Unique ON Pizza.Account
(
	Customer_Id ASC,
	Email
);

CREATE NONCLUSTERED INDEX Ix_NonClustered ON Pizza.OrderDetails
(
	Order_Id ASC,
	PaymentType_Id ASC,
	OrderType_Id ASC,
	Deliver_Id ASC
);