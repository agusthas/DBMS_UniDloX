USE master
GO

IF NOT EXISTS (
SELECT [name]
FROM sys.databases
WHERE [name] = 'UniDloX'
)
CREATE DATABASE [UniDloX]
GO

USE UniDloX
GO

IF OBJECT_ID('[MsCloth]', 'U') IS NOT NULL
DROP TABLE [MsCloth]
GO
CREATE TABLE [MsCloth]
(
    [ClothID] char(5) PRIMARY KEY CHECK(ClothID Like 'CL[0-9][0-9][0-9]'),
    [ClothName] varchar(255) NOT NULL,
    [ClothStock] int CHECK(ClothStock BETWEEN 0 AND 250),
    [ClothPrice] int NOT NULL
);


IF OBJECT_ID('[MsSupplier]', 'U') IS NOT NULL
DROP TABLE [MsSupplier]
GO
CREATE TABLE [MsSupplier]
(
    [SupplierID] char(5) PRIMARY KEY CHECK(SupplierID Like 'SU[0-9][0-9][0-9]'),
    [SupplierName] varchar(255) NOT NULL CHECK(LEN(SupplierName) > 6),
    [SupplierPhone] varchar(255) NOT NULL,
    [SupplierAddress] varchar(255) NOT NULL
);

IF OBJECT_ID('[MsStaff]', 'U') IS NOT NULL
DROP TABLE [MsStaff]
GO
CREATE TABLE [MsStaff]
(
    [StaffID] char(5) PRIMARY KEY CHECK(StaffID Like 'SF[0-9][0-9][0-9]'),
    [StaffName] varchar(255) NOT NULL,
    [StaffPhone] varchar(255) NOT NULL,
    [StaffAddress] varchar(15) NOT NULL CHECK(LEN(StaffAddress) BETWEEN 10 AND 15),
    [StaffAge] int NOT NULL,
    [StaffGender] varchar(255) NOT NULL CHECK(StaffGender IN ('Male', 'Female')),
    [StaffSalary] int NOT NULL
);

IF OBJECT_ID('[MsMaterial]', 'U') IS NOT NULL
DROP TABLE [MsMaterial]
GO
CREATE TABLE [MsMaterial]
(
    [MaterialID] char(5) PRIMARY KEY CHECK(MaterialID Like 'MA[0-9][0-9][0-9]'),
    [MaterialName] varchar(255) NOT NULL,
    [MaterialPrice] int NOT NULL CHECK(MaterialPrice > 0)
);

IF OBJECT_ID('[MsPaymentType]', 'U') IS NOT NULL
DROP TABLE [MsPaymentType]
GO
CREATE TABLE [MsPaymentType]
(
    [PaymentTypeID] char(5) PRIMARY KEY CHECK(PaymentTypeID Like 'PA[0-9][0-9][0-9]'),
    [PaymentTypeName] varchar(255) NOT NULL
);

IF OBJECT_ID('[MsCustomer]', 'U') IS NOT NULL
DROP TABLE [MsCustomer]
GO
CREATE TABLE [MsCustomer]
(
    [CustomerID] char(5) PRIMARY KEY CHECK(CustomerID Like 'CU[0-9][0-9][0-9]'),
    [CustomerName] varchar(255) NOT NULL,
    [CustomerPhone] varchar(255) NOT NULL,
    [CustomerAddress] varchar(255) NOT NULL,
    [CustomerGender] varchar(255) NOT NULL CHECK(CustomerGender IN ('Male', 'Female')),
    [CustomerEmail] varchar(255) NOT NULL CHECK(CustomerEmail LIKE '%@gmail.com%' OR CustomerEmail LIKE '%@yahoo.com%'),
    [CustomerDOB] date NOT NULL
);

IF OBJECT_ID('[PurchaseTransactionHeader]', 'U') IS NOT NULL
DROP TABLE [PurchaseTransactionHeader]
GO
CREATE TABLE [PurchaseTransactionHeader]
(
    [PurchaseID] char(5) PRIMARY KEY CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
    [StaffID] char(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [SupplierID] char(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [PaymentTypeID] char(5) FOREIGN KEY REFERENCES MsPaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [PurchaseDate] date NOT NULL
);

IF OBJECT_ID('[SalesTransactionHeader]', 'U') IS NOT NULL
DROP TABLE [SalesTransactionHeader]
GO
CREATE TABLE [SalesTransactionHeader]
(
    [SalesID] char(5) PRIMARY KEY CHECK(SalesID Like 'SA[0-9][0-9][0-9]'),
    [StaffID] char(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [CustomerID] char(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [PaymentTypeID] char(5) FOREIGN KEY REFERENCES MsPaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [SalesDate] date
);

IF OBJECT_ID('[PurchaseTransactionDetail]', 'U') IS NOT NULL
DROP TABLE [PurchaseTransactionDetail]
GO
CREATE TABLE [PurchaseTransactionDetail]
(
    [PurchaseID] char(5) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseID) CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
    [MaterialID] char(5) FOREIGN KEY REFERENCES MsMaterial(MaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [Quantity] int
);

IF OBJECT_ID('[SalesTransactionDetail]', 'U') IS NOT NULL
DROP TABLE [SalesTransactionDetail]
GO
CREATE TABLE [SalesTransactionDetail]
(
    [SalesID] char(5) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesID) CHECK(SalesID LIKE 'SA[0-9][0-9][0-9]'),
    [ClothID] char(5) FOREIGN KEY REFERENCES MsCloth(ClothID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [Quantity] int
);