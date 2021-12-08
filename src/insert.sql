USE UniDloX
GO

INSERT INTO [MsStaff]
  ([StaffID], [StaffName], [StaffPhone], [StaffAddress], [StaffAge], [StaffGender], [StaffSalary])
VALUES
  ('SF001', 'Salimah Nasyiah', '0815555798', 'Perum Permata', 12, 'Female', 150000),
  ('SF002', 'Karja Prasasta', '0838555115', 'Jl Tj Morawa', 20, 'Male', 120000),
  ('SF003', 'Santa Derrick Prasetyo Budiman', '0815555372', 'Psr Atoom Tbt', 16, 'Female', 250000),
  ('SF004', 'Muhammad Yinfei Mahmud', '0878555233', 'Kompl Duren', 33, 'Male', 900000),
  ('SF005', 'Nekojima Mai', '0897555673', 'Jl Tebet Raya', 52, 'Female', 175000),
  ('SF006', 'Gentsuki Chan', '0838555160', 'Jl Sudirman', 43, 'Female', 225000),
  ('SF007', 'Douki Chitoge', '0818555192', 'Jl Pekojan Raya', 20, 'Female', 600000),
  ('SF008', 'Kouhai', '0878555874', 'Jl Pancoran', 51, 'Female', 175000),
  ('SF009', 'Ame Uzumaki', '0853555655', 'Jl Bango Timur', 33, 'Male', 500000),
  ('SF010', 'Zhongli Gunawan', '0899555361', 'Jl Rawa Barat', 20, 'Male', 120000)
GO

INSERT INTO [MsSupplier]
  ([SupplierID], [SupplierName], [SupplierPhone], [SupplierAddress])
VALUES
  ('SU001', 'Stephan Honigsmann', '0247471806', 'Jl Sentra'),
  ('SU002', 'Meik Kant', '0213520946', 'Jl Kp Sawah'),
  ('SU003', 'Laurin Schlitz', '0243572522', 'Jl Rorotan'),
  ('SU004', 'Tobi Fischbacher', '0616624406', 'Jl Mangga'),
  ('SU005', 'Claus Mannheimer', '0711814195', 'Jl Cipaganti'),
  ('SU006', 'Samuel Werdin', '0318298224', 'Jl Agung'),
  ('SU007', 'Till Berger', '0243520156', 'Jl Gading'),
  ('SU008', 'Hilario Tamez', '0214803477', 'Jl Raya Bekasi'),
  ('SU009', 'Fabricio Fuentes', '0243542818', 'Jl Jend Gatot'),
  ('SU010', 'Dorotea Apolinar', '0361735836', 'Jl Pengarengan')
GO

INSERT INTO [MsCustomer]
  ([CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [CustomerGender], [CustomerEmail], [CustomerDOB])
VALUES
  ('CU001', 'Galar Pradipta', '0817555086', 'Jl H Agus', 'Female', 'galar.pradipta@gmail.com', '1991-03-24'),
  ('CU002', 'Karma Salahudin', '0878555394', 'Jl Cideng', 'Male', 'karma.salahudin@gmail.com', '1995-01-09'),
  ('CU003', 'Hartaka Saptono', '0878555953', 'Jl Tj Morawa', 'Female', 'hartaka.saptono@yahoo.com', '1993-11-15'),
  ('CU004', 'Ellis Oktaviani', '0855555689', 'Jl Sunter Agung', 'Female', 'ellis.oktaviani@yahoo.com', '2000-03-24'),
  ('CU005', 'Jamil Maheswara', '0878555432', 'Jl Lombok', 'Female', 'jamil.maheswara@yahoo.com', '1997-05-20'),
  ('CU006', 'Cinthia Winarsih', '0897555190', 'Jl Bukit', 'Female', 'cinthia.winarsih@yahoo.com', '2002-07-29'),
  ('CU007', 'Hardana Hidayat', '0811555247', 'Jl Jagakarsa', 'Male', 'hardana.hidayat@yahoo.com', '1981-09-22'),
  ('CU008', 'Emong Wacana', '0878555133', 'Gg Parasdi', 'Male', 'emong.wacana@gmail.com', '1988-07-21'),
  ('CU009', 'Elvina Permata', '0878555823', 'Jl Mapanget', 'Male', 'elvina.permata@gmail.com', '1998-01-18'),
  ('CU010', 'Among Saragih', '0816555433', 'Jl H Mugeni', 'Male', 'among.saragih@gmail.com', '1993-10-18')
GO

INSERT INTO [MsCloth]
  ([ClothID], [ClothName], [ClothStock], [ClothPrice])
VALUES
  ('CL001', 'Shirt', 201, 200000),
  ('CL002', 'Caps', 120, 100000),
  ('CL003', 'Jeans', 40, 400000),
  ('CL004', 'Chino', 80, 400000),
  ('CL005', 'Jacket', 30, 500000),
  ('CL006', 'Sweater', 200, 250000),
  ('CL007', 'Coat', 180, 800000),
  ('CL008', 'Socks', 70, 60000),
  ('CL009', 'Pajamas', 100, 150000),
  ('CL010', 'Skirt', 160, 200000)
GO

INSERT INTO [MsMaterial]
  ([MaterialID], [MaterialName], [MaterialPrice])
VALUES
  ('MA001', 'Cotton', 200000),
  ('MA002', 'Cellulosic fibres', 100000),
  ('MA003', 'Wool', 400000),
  ('MA004', 'Chino', 400000),
  ('MA005', 'Silk', 500000),
  ('MA006', 'Leather', 250000),
  ('MA007', 'Bast fibres', 800000),
  ('MA008', 'Experimental fabrics', 60000),
  ('MA009', 'Plastics', 150000),
  ('MA010', 'Linen', 200000)
GO

INSERT INTO [MsPaymentType]
  ([PaymentTypeID], [PaymentTypeName])
VALUES
  ('PA001', 'DANA'),
  ('PA002', 'OVO'),
  ('PA003', 'Go-Pay'),
  ('PA004', 'Shopee-Pay'),
  ('PA005', 'Cash'),
  ('PA006', 'Debit Card'),
  ('PA007', 'Virtual Account'),
  ('PA008', 'Credit Card'),
  ('PA009', 'Cryptocurrency'),
  ('PA010', 'Flazz')
GO

INSERT INTO [SalesTransactionHeader]
  ([SalesID], [StaffID], [CustomerID], [PaymentTypeID], [SalesDate])
VALUES
  ('SA001', 'SF001', 'CU001', 'PA001', '2020-03-24'),
  ('SA002', 'SF001', 'CU002', 'PA002', '2020-04-01'),
  ('SA003', 'SF001', 'CU001', 'PA001', '2020-05-20'),
  ('SA004', 'SF002', 'CU004', 'PA002', '2020-06-12'),
  ('SA005', 'SF002', 'CU002', 'PA006', '2020-03-16'),
  ('SA006', 'SF002', 'CU003', 'PA010', '2020-03-16'),
  ('SA007', 'SF003', 'CU005', 'PA007', '2020-05-04'),
  ('SA008', 'SF010', 'CU010', 'PA004', '2020-02-27'),
  ('SA009', 'SF006', 'CU007', 'PA001', '2020-04-13'),
  ('SA010', 'SF003', 'CU010', 'PA004', '2020-10-06'),
  ('SA011', 'SF004', 'CU006', 'PA008', '2020-02-07'),
  ('SA012', 'SF008', 'CU007', 'PA010', '2020-06-16'),
  ('SA013', 'SF007', 'CU009', 'PA003', '2020-07-13'),
  ('SA014', 'SF008', 'CU010', 'PA005', '2020-01-02'),
  ('SA015', 'SF010', 'CU001', 'PA008', '2020-08-18')
GO

INSERT INTO [SalesTransactionDetail]
  ([SalesID], [ClothID], [Quantity])
VALUES
  ('SA001', 'CL001', 1),
  ('SA001', 'CL002', 2),
  ('SA002', 'CL003', 2),
  ('SA002', 'CL004', 1),
  ('SA003', 'CL001', 3),
  ('SA003', 'CL004', 1),
  ('SA004', 'CL005', 2),
  ('SA004', 'CL002', 3),
  ('SA005', 'CL002', 3),
  ('SA005', 'CL003', 3),
  ('SA006', 'CL004', 10),
  ('SA006', 'CL008', 2),
  ('SA007', 'CL006', 14),
  ('SA007', 'CL004', 20),
  ('SA008', 'CL010', 19),
  ('SA008', 'CL006', 2),
  ('SA009', 'CL009', 12),
  ('SA009', 'CL004', 1),
  ('SA010', 'CL003', 2),
  ('SA010', 'CL004', 13),
  ('SA011', 'CL009', 20),
  ('SA011', 'CL006', 2),
  ('SA012', 'CL003', 15),
  ('SA012', 'CL001', 4),
  ('SA013', 'CL009', 6),
  ('SA013', 'CL007', 14),
  ('SA014', 'CL005', 18),
  ('SA014', 'CL007', 4),
  ('SA015', 'CL001', 9),
  ('SA015', 'CL002', 8)
GO

INSERT INTO [PurchaseTransactionHeader]
  ([PurchaseID], [StaffID], [SupplierID], [PaymentTypeID], [PurchaseDate])
VALUES
  ('PU001', 'SF001', 'SU001', 'PA001', '2020-02-10'),
  ('PU002', 'SF002', 'SU001', 'PA003', '2020-02-20'),
  ('PU003', 'SF002', 'SU004', 'PA002', '2020-03-21'),
  ('PU004', 'SF001', 'SU002', 'PA002', '2020-03-28'),
  ('PU005', 'SF003', 'SU003', 'PA001', '2020-04-05'),
  ('PU006', 'SF004', 'SU002', 'PA004', '2020-04-10'),
  ('PU007', 'SF003', 'SU005', 'PA007', '2020-04-12'),
  ('PU008', 'SF010', 'SU010', 'PA004', '2020-04-18'),
  ('PU009', 'SF006', 'SU007', 'PA001', '2020-05-10'),
  ('PU010', 'SF001', 'SU005', 'PA003', '2020-05-20'),
  ('PU011', 'SF007', 'SU001', 'PA002', '2020-06-02'),
  ('PU012', 'SF004', 'SU009', 'PA007', '2020-06-05'),
  ('PU013', 'SF005', 'SU008', 'PA002', '2020-07-17'),
  ('PU014', 'SF010', 'SU002', 'PA003', '2020-07-20'),
  ('PU015', 'SF009', 'SU003', 'PA008', '2020-08-06')
GO

INSERT INTO [PurchaseTransactionDetail]
  ([PurchaseID], [MaterialID], [Quantity])
VALUES
  ('PU001', 'MA001', 1),
  ('PU001', 'MA002', 2),
  ('PU002', 'MA003', 2),
  ('PU002', 'MA004', 1),
  ('PU003', 'MA001', 3),
  ('PU003', 'MA004', 1),
  ('PU004', 'MA005', 2),
  ('PU004', 'MA002', 3),
  ('PU005', 'MA002', 3),
  ('PU005', 'MA003', 3),
  ('PU006', 'MA004', 10),
  ('PU006', 'MA008', 2),
  ('PU007', 'MA006', 14),
  ('PU007', 'MA004', 20),
  ('PU008', 'MA010', 19),
  ('PU008', 'MA006', 2),
  ('PU009', 'MA009', 12),
  ('PU009', 'MA004', 1),
  ('PU010', 'MA003', 2),
  ('PU010', 'MA004', 13),
  ('PU011', 'MA009', 20),
  ('PU011', 'MA006', 2),
  ('PU012', 'MA003', 15),
  ('PU012', 'MA001', 4),
  ('PU013', 'MA009', 6),
  ('PU013', 'MA007', 14),
  ('PU014', 'MA005', 18),
  ('PU014', 'MA007', 4),
  ('PU015', 'MA001', 9),
  ('PU015', 'MA002', 8)
GO

-- SELECT *
-- FROM MsStaff;
-- SELECT *
-- FROM MsCustomer;
-- SELECT *
-- FROM MsSupplier;
-- SELECT *
-- FROM MsCloth;
-- SELECT *
-- FROM MsMaterial;
-- SELECT *
-- FROM MsPaymentType;
-- SELECT *
-- FROM SalesTransactionHeader;
-- SELECT *
-- FROM SalesTransactionDetail;
-- SELECT *
-- FROM PurchaseTransactionHeader;
-- SELECT *
-- FROM PurchaseTransactionDetail;

USE master
GO