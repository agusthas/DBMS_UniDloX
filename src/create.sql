-- Answer to question B


USE master
GO

-- Check if database 'UniDloX' exist.
IF EXISTS (
SELECT [name]
FROM sys.databases
WHERE [name] = 'UniDloX'
)
DROP DATABASE [UniDloX]
GO

CREATE DATABASE [UniDloX]
GO

USE UniDloX
GO

CREATE TABLE [MsCloth]
(
    [ClothID] char(5) PRIMARY KEY CHECK(ClothID LIKE 'CL[0-9][0-9][0-9]'),
    [ClothName] varchar(255) NOT NULL,
    [ClothStock] int CHECK(ClothStock BETWEEN 0 AND 250),
    [ClothPrice] int NOT NULL
);


CREATE TABLE [MsSupplier]
(
    [SupplierID] char(5) PRIMARY KEY CHECK(SupplierID LIKE 'SU[0-9][0-9][0-9]'),
    [SupplierName] varchar(255) NOT NULL CHECK(LEN(SupplierName) > 6),
    [SupplierPhone] varchar(255) NOT NULL,
    [SupplierAddress] varchar(255) NOT NULL
);

CREATE TABLE [MsStaff]
(
    [StaffID] char(5) PRIMARY KEY CHECK(StaffID LIKE 'SF[0-9][0-9][0-9]'),
    [StaffName] varchar(255) NOT NULL,
    [StaffPhone] varchar(255) NOT NULL,
    [StaffAddress] varchar(15) NOT NULL CHECK(LEN(StaffAddress) BETWEEN 10 AND 15),
    [StaffAge] int NOT NULL,
    [StaffGender] varchar(255) NOT NULL CHECK(StaffGender IN ('Male', 'Female')),
    [StaffSalary] int NOT NULL
);

CREATE TABLE [MsMaterial]
(
    [MaterialID] char(5) PRIMARY KEY CHECK(MaterialID LIKE 'MA[0-9][0-9][0-9]'),
    [MaterialName] varchar(255) NOT NULL,
    [MaterialPrice] int NOT NULL CHECK(MaterialPrice > 0)
);

CREATE TABLE [MsPaymentType]
(
    [PaymentTypeID] char(5) PRIMARY KEY CHECK(PaymentTypeID LIKE 'PA[0-9][0-9][0-9]'),
    [PaymentTypeName] varchar(255) NOT NULL
);

CREATE TABLE [MsCustomer]
(
    [CustomerID] char(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
    [CustomerName] varchar(255) NOT NULL,
    [CustomerPhone] varchar(255) NOT NULL,
    [CustomerAddress] varchar(255) NOT NULL,
    [CustomerGender] varchar(255) NOT NULL CHECK(CustomerGender IN ('Male', 'Female')),
    [CustomerEmail] varchar(255) NOT NULL CHECK(RIGHT(CustomerEmail, 10) LIKE '@gmail.com' OR (RIGHT(CustomerEmail, 10) LIKE '@yahoo.com')),
    [CustomerDOB] date NOT NULL
);

CREATE TABLE [PurchaseTransactionHeader]
(
    [PurchaseID] char(5) PRIMARY KEY CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
    [StaffID] char(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [SupplierID] char(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [PaymentTypeID] char(5) FOREIGN KEY REFERENCES MsPaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [PurchaseDate] date NOT NULL
);

CREATE TABLE [SalesTransactionHeader]
(
    [SalesID] char(5) PRIMARY KEY CHECK(SalesID LIKE 'SA[0-9][0-9][0-9]'),
    [StaffID] char(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [CustomerID] char(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [PaymentTypeID] char(5) FOREIGN KEY REFERENCES MsPaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [SalesDate] date
);

CREATE TABLE [PurchaseTransactionDetail]
(
    [PurchaseID] char(5) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseID) CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
    [MaterialID] char(5) FOREIGN KEY REFERENCES MsMaterial(MaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [Quantity] int
);

CREATE TABLE [SalesTransactionDetail]
(
    [SalesID] char(5) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesID) CHECK(SalesID LIKE 'SA[0-9][0-9][0-9]'),
    [ClothID] char(5) FOREIGN KEY REFERENCES MsCloth(ClothID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    [Quantity] int
);

USE master
GO