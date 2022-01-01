-- Answer to question D

USE UniDloX
GO

-- Simulation 1

-- Customer: CU010 Among Saragih
-- Staff: SF005 Nekojima Mai
-- PaymentType: PA003 Go-Pay
-- Cloth:
--    - Shirt 1
--    - Chino 1

INSERT INTO [SalesTransactionHeader]
  ([SalesID], [StaffID], [CustomerID], [PaymentTypeID], [SalesDate])
VALUES
  ('SA016', 'SF005', 'CU010', 'PA003', '2021-12-20')
GO

INSERT INTO [SalesTransactionDetail]
  ([SalesID], [ClothID], [Quantity])
VALUES
  ('SA016', 'CL001', 1),
  ('SA016', 'CL004', 1)
GO

-- Simulation 2

-- Supplier: SU005 Claus Mannheimer
-- Staff: SF002 Karja Prasasta
-- PaymentType: PA009 Cryptocurrency
-- Material:
--    - MA003 Wool 1
--    - MA006 Leather 1

BEGIN TRAN
INSERT INTO [PurchaseTransactionHeader]
  ([PurchaseID], [StaffID], [SupplierID], [PaymentTypeID], [PurchaseDate])
VALUES
  ('PU016', 'SF002', 'SU005', 'PA009', '2021-12-25');
GO

INSERT INTO [PurchaseTransactionDetail]
  ([PurchaseID], [MaterialID], [Quantity])
VALUES
  ('PU016', 'MA003', 1),
  ('PU016', 'MA006', 1)
GO