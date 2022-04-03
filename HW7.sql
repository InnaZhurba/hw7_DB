--Write the following script:

-- Add new number not nullable column 
-- to SalesOrderDetail table

ALTER TABLE Sales.SalesOrderDetail
    ADD num_column int;

-- Populate added column using DML with values from SalesOrderID column 

-- Display  from SalesOrderHeader: 
-- SalesOrderId, CustomerId, from SalesOrderDetail: 
-- SalesOrderDetailId (write two queries to join using 
-- existing column and new added)

-- Compare execution plans for two queries and explain the difference: 
-- which one will be more optimal and why

-- Delete added column




--Write the following script and run it as one transaction 
-- (it is not required to write it as stored procedure, 
-- pass only necessary columns’ values or leave default)

-- Insert new order into SalesOrderHeader

-- Using one of system functions: 
-- @@IDENTITY, SCOPE_IDENTITY(), IDENT_CURRENT() 
-- insert new order’s detail into SalesOrderDetail

-- Returns SalesOrderId

BEGIN TRANSACTION 

INSERT INTO Sales.SalesOrderHeader (RevisionNumber, OrderDate, 
                                    DueDate, ShipDate, Status, 
                                    OnlineOrderFlag, PurchaseOrderNumber, 
                                    AccountNumber, CustomerID, SalesPersonID, 
                                    TerritoryID, BillToAddressID, ShipToAddressID, 
                                    ShipMethodID, CreditCardID, CreditCardApprovalCode, 
                                    CurrencyRateID, SubTotal, TaxAmt, Freight, 
                                    Comment, rowguid, ModifiedDate)
VALUES (24,'04/04/2006','08/08/2006',
        '09/09/2006',5,false,
        'SO43659','PO522145787',
        '10-4020-000676',29825,279,
        5,985,985,
        5,16281,'gjfyi7568r86',1000,499,6585, 'new_header','tiyyfyfigigi',
        '10/10/2006')
INSERT INTO Sales.SalesOrderHeader (RevisionNumber, OrderDate,
                                    DueDate, ShipDate, Status,
                                    OnlineOrderFlag, PurchaseOrderNumber,
                                    AccountNumber, CustomerID, SalesPersonID,
                                    TerritoryID, BillToAddressID, ShipToAddressID,
                                    ShipMethodID, CreditCardID, CreditCardApprovalCode,
                                    CurrencyRateID, SubTotal, TaxAmt, Freight,
                                    Comment, rowguid, ModifiedDate)
VALUES (24,'04/04/2006','08/08/2006',
        '09/09/2006',5,false,
        'SO43659','PO522145787',
        '10-4020-000676',29825,279,
        5,985,985,
        5,16281,'gjfyi7568r86',1000,499,6585, 'new_header','tiyyfyfigigi',
        '10/10/2006')

SELECT SalesOrderID
FROM Sales.SalesOrderDetail


USE AdventureWorks2008R2;
GO
SELECT SalesOrderID FROM Sales.SalesOrderDetail;
GO
INSERT INTO Sales.SalesOrderDetail
(SalesOrderID, CarrierTrackingNumber, OrderQty, 
 ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, 
 rowguid, ModifiedDate, NEW, NewColumn, Soid)
VALUES (43659,4,23,123,234,5134,3,431,GETDATE(),23,234,56);
GO
SELECT @@IDENTITY AS 'Identity';
GO  
SELECT SalesOrderID FROM Sales.SalesOrderDetail;
GO

ROLLBACK
SELECT SalesOrderID
FROM Sales.SalesOrderDetail

ROLLBACK 

