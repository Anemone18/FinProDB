CREATE TABLE [Customer] (
  [customerID] int PRIMARY KEY,
  [customerName] varchar(50),
  [customerAddress] varchar(255),
  [customerPhone] varchar(13),
  [customerGender] varchar(10)
)
GO

CREATE TABLE [Employee] (
  [employeeID] int PRIMARY KEY,
  [employeeName] varchar(50),
  [employeeAddress] varchar(255),
  [employeePhone] varchar(13),
  [employeeGender] varchar(10),
  [accessID] int
)
GO

CREATE TABLE [Access] (
  [accessID] int PRIMARY KEY,
  [username] varchar(25),
  [password] varchar(50),
  [role] varchar(25),
  [outletID] int
)
GO

CREATE TABLE [PaymentMethod] (
  [paymentID] int PRIMARY KEY,
  [paymentName] varchar(50),
  [paymentCategory] varchar(30)
)
GO

CREATE TABLE [Outlet] (
  [outletID] int PRIMARY KEY,
  [outletName] varchar(50),
  [outletAddress] varchar(255)
)
GO

CREATE TABLE [Inventory] (
  [productID] int,
  [outletID] int,
  [quantity] int,
  PRIMARY KEY ([productID], [outletID])
)
GO

CREATE TABLE [Product] (
  [productID] int PRIMARY KEY,
  [productName] varchar(50),
  [productType] varchar(20),
  [productPrice] numeric(10,2)
)
GO

CREATE TABLE [Order] (
  [orderID] int PRIMARY KEY,
  [employeeID] int,
  [outletID] int,
  [customerID] int,
  [paymentID] int,
  [totalPrice] numeric(10,2)
)
GO

CREATE TABLE [OrderDetail] (
  [orderID] int,
  [productID] int,
  [quantity] int,
  PRIMARY KEY ([orderID], [productID])
)
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([customerID]) REFERENCES [Customer] ([customerID])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([employeeID]) REFERENCES [Employee] ([employeeID])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([paymentID]) REFERENCES [PaymentMethod] ([paymentID])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([outletID]) REFERENCES [Outlet] ([outletID])
GO

ALTER TABLE [OrderDetail] ADD FOREIGN KEY ([orderID]) REFERENCES [Order] ([orderID])
GO

ALTER TABLE [OrderDetail] ADD FOREIGN KEY ([productID]) REFERENCES [Product] ([productID])
GO

ALTER TABLE [Inventory] ADD FOREIGN KEY ([productID]) REFERENCES [Product] ([productID])
GO

ALTER TABLE [Inventory] ADD FOREIGN KEY ([outletID]) REFERENCES [Outlet] ([outletID])
GO

ALTER TABLE [Access] ADD FOREIGN KEY ([outletID]) REFERENCES [Outlet] ([outletID])
GO

ALTER TABLE [Employee] ADD FOREIGN KEY ([accessID]) REFERENCES [Access] ([accessID])
GO

