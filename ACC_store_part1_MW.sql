-- 1. Select statement that shows all store ID and Name, their addresses and the manager's name -- 
SELECT table1.Store_ID, table1.Store_name, table1.Address1, table1.City, table1.State_CD, table1.Zip_code, table2.First_Name, table2.Last_Name FROM  Store table1
JOIN Employee table2
ON table1.Manager_id = table2.Emp_ID

-- 2. Select statement that shows all managers, the manager's address and their store name --
SELECT table1.First_Name, table1.Last_Name, table1.Address1, table1.City, table1.State_CD, table1.Zip_code, table2.Store_Name FROM  Employee table1
JOIN Store table2
ON table1.Emp_ID = table2.Manager_ID

-- 3. Create a view for #2--
CREATE VIEW limited_view
AS
SELECT table1.First_Name, table1.Last_Name, table1.Address1, table1.City, table1.State_CD, table1.Zip_code, table2.Store_Name FROM  Employee table1
JOIN Store table2 ON table1.Emp_ID = table2.Manager_ID
GO

-- 4. Create a stored procedure for #1--
CREATE PROCEDURE Store_Manager_Name
AS
SET NOCOUNT ON;
SELECT table1.Store_ID, table1.Store_name, table1.Address1, table1.City, table1.State_CD, table1.Zip_code, table2.First_Name, table2.Last_Name FROM  Store table1
JOIN Employee table2
ON table1.Manager_id = table2.Emp_ID
 RETURN;
GO 

-- 5. Add non-clusterd index on the products table by product name--
CREATE UNIQUE INDEX The_ACC_Store
  ON Product(Product_Name);
/*Msg 1505, Level 16, State 1, Line 29
The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.Product' and the index name 'The_ACC_Store'. The duplicate key value is (Alkanna).*/

--6. Create a SELECT statement in a STORED PROCEDURE that returns: a. All active stores b. Manager First and Last Name for the store c. Product Name d. Quanity of Products per Store--

CREATE PROCEDURE answer_for_six
AS
SET NOCOUNT ON;

-- Manager name --
SELECT table1.Store_name, table2.First_Name, table2.Last_Name FROM  Store table1
JOIN Employee table2 ON table1.Manager_id = table2.Emp_ID

-- Quantity of products --
SELECT table1.Store_name, table3.Stock_ID, table3.Quantity FROM  Store table1
JOIN Stock table3 ON table1.Store_ID = table3.Store_ID

-- Product name --
SELECT table3.Product_ID, table4.Product_Name FROM Stock table3
JOIN Product table4 ON table3.Product_ID = table4.Product_ID
 RETURN;
GO 