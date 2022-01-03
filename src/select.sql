USE UniDloX
Select * from PurchaseTransactionHeader
Select * from PurchaseTransactionDetail
Select * from MsMaterial
SELECT * FROM MsStaff
SELECT * From MsSupplier
Select * from SalesTransactionHeader
Select * from SalesTransactionDetail
Select * from MsCloth
Select * from MsCustomer

--1
Select a.StaffID, c.StaffName, b.SupplierName, Count(PurchaseID) as 'Total Purchase'
from PurchaseTransactionHeader as a
Join MsSupplier as b on a.SupplierID = b.SupplierID
Join MsStaff as c on a.StaffID = c.StaffID
Where MONTH(a.PurchaseDate) = 11 AND Cast(Right(a.StaffID, 1) AS INT) % 2 = 0
Group by a.StaffID, c.StaffName, b.SupplierName

--2
Select a.SalesID, b.CustomerName, SUM(d.ClothPrice * c.Quantity) as 'Total Sales Price'
from SalesTransactionHeader as a
Join MsCustomer as b on a.CustomerID = b.CustomerID
Join SalesTransactionDetail as c on a.SalesID = c.SalesID
Join MsCloth as d on c.ClothID = d.ClothID
Where b.CustomerName LIKE '%m%'
Group by a.SalesID, b.CustomerName
Having SUM(d.ClothPrice * c.Quantity) > 2000000
Order by a.SalesID asc

--3
Select MONTH(a.PurchaseDate) as 'Month', Count(a.PurchaseID) as 'Transaction Count', SUM(b.Quantity) as 'Material Sold Count' 
from PurchaseTransactionHeader as a
join PurchaseTransactionDetail as b on a.PurchaseID = b.PurchaseID
join MsStaff as c on a.StaffID = c.StaffID
join MsMaterial as d on b.MaterialID = d.MaterialID
Where c.StaffAge between 25 AND 30 AND d.MaterialPrice > 150000
Group by MONTH(a.PurchaseDate)

--4
Select Lower(b.CustomerName) as 'CustomerName', b.CustomerEmail, b.CustomerAddress, SUM(c.Quantity) as 'Cloth Bought Count', Concat('IDR ', SUM(d.ClothPrice * c.Quantity)) as 'Total Price' 
From SalesTransactionHeader as a
Join MsCustomer as b on a.CustomerID = b.CustomerID
Join SalesTransactionDetail as c on a.SalesID = c.SalesID
Join MsCloth as d on c.ClothID = d.ClothID
Join MsPaymentType as e on a.PaymentTypeID = e.PaymentTypeID
where e.PaymentTypeName = 'Cryptocurrency' OR e.PaymentTypeName = 'Cash' OR e.PaymentTypeName = 'Shopee-Pay'
Group by a.CustomerID, b.CustomerName, b.CustomerEmail, b.CustomerAddress

--5
Select RIGHT(a.PurchaseID, 3) as 'PurchaseID',a.PurchaseDate, b.StaffName, c.PaymentTypeName
from PurchaseTransactionHeader as a
Join MsStaff as b on a.StaffID = b.StaffID
Join MsPaymentType as c on a.PaymentTypeID = c.PaymentTypeID
Where b.StaffGender = 'Female' AND b.StaffAge > (Year(CURRENT_TIMESTAMP) - 1996)
AND b.StaffSalary > (Select AVG(StaffSalary) from MsStaff)

--6
Select a.SalesID, FORMAT(a.SalesDate, 'MM-dd-yyyy') as 'SalesDate', b.CustomerName, b.CustomerGender
from SalesTransactionHeader as a
join MsCustomer as b on a.CustomerID = b.CustomerID
join SalesTransactionDetail as c on a.SalesID = c.SalesID
where YEAR(a.SalesDate) = 2021 
AND c.Quantity = (Select AVG(a.Quantity) from SalesTransactionDetail as a 
join SalesTransactionHeader as b on a.SalesID = b.SalesID where DAY(b.SalesDate) = 15)

--7
Select a.PurchaseID, b.SupplierName, CONCAT('+62', RIGHT(b.SupplierPhone, 9)) as SupplierPhone, a.PurchaseDate, DATENAME(WEEKDAY, a.PurchaseDate) as 'PurchaseDate', c.Quantity
from PurchaseTransactionHeader as a
join MsSupplier as b on a.SupplierID = b.SupplierID
join PurchaseTransactionDetail as c on a.PurchaseID = c.PurchaseID
where DATENAME(WEEKDAY, a.PurchaseDate) = 'Friday' OR DATENAME(WEEKDAY, a.PurchaseDate) = 'Saturday' 
OR DATENAME(WEEKDAY, a.PurchaseDate) = 'Sunday' AND c.Quantity > (Select AVG(Quantity) from PurchaseTransactionDetail)

--8
Select a. 
from SalesTransactionHeader as a
join MsCustomer as b on a.CustomerID = b.CustomerID

--9
Create View ViewCustomerTransaction as
Select a.CustomerID, b.CustomerName, b.CustomerEmail, b.CustomerDOB, MIN(c.Quantity) as 'MinimumQuantity', MAX(c.Quantity) as 'MaximumQuantity'
from SalesTransactionHeader as a
join MsCustomer as b on a.CustomerID = b.CustomerID
join SalesTransactionDetail as c on a.SalesID = c.SalesID
WHERE YEAR(b.CustomerDOB) = 2000 AND RIGHT(b.CustomerEmail, 10) = '@yahoo.com'
Group by a.CustomerID,b.CustomerName, b.CustomerEmail, b.CustomerDOB

--10
Create View ViewFemaleStaffTransaction as
Select a.StaffID, Upper(b.StaffName) as 'StaffName', Concat('Rp. ',b.StaffSalary, ',00') as 'StaffSalary', Concat(Count(c.Quantity), ' Pc(s)') as 'Material Bought Count'
from PurchaseTransactionHeader as a
join MsStaff as b on a.StaffID = b.StaffID
join PurchaseTransactionDetail as c on a.PurchaseID = c.PurchaseID
Where b.StaffGender = 'Female' and b.StaffSalary > (Select AVG(StaffSalary) from MsStaff)
Group by a.StaffID, b.StaffName, b.StaffSalary