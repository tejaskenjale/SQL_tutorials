-------------------------------------------------------------SQL Comments------------------------------------------------------------

-- Single Line comment: - 
-- Comments are used to explain sections of SQL statements, or to prevent execution of SQL statements.

-- Single-Line comment Example: - 

--SELECT * FROM Customers;
SELECT * FROM Products;


-- Multi-Line Comment Example: - 

/*Select all the columns
of all the records
in the Customers table:*/
SELECT * FROM Customers;

-- To ignore just a part of a statement, also use the /* */ comment.

SELECT CustomerName, /*City,*/ Country FROM Customers;



-------------------------------------------------------------SELECT Statement------------------------------------------------------------------

SELECT * FROM Customers;    


-------------------------------------------------------------SELECT DISTINCT------------------------------------------------------------------

SELECT DISTINCT Country
FROM Customers;


/* The following SQL statement lists the number of different (distinct) customer countries: */

SELECT COUNT(DISTINCT Country) 
FROM Customers;


-------------------------------------------------------------WHERE clause------------------------------------------------------------------
-- We can have doubt quotes/single quotes around text values.
-- Its not necessary to have quotes for number values.
-- WHERE clause is not only used in SELECT statements, it also used in UPDATE, DELETE, etc.

Example 1)

SELECT * 
FROM Customers 
WHERE Country = "India";

Example 2)

SELECT *
FROM Customers
WHERE CustomerID = 101;

-- Operators in the WHERE clause

=   Equal   
<   Less than
>   Greater than
<=  Less than or equal
>=  Greater than or equal
<>  Not equal [In some version of sql, this operator may be written as "!=" ].
BETWEEN - between a certain range
LIKE    Search for a pattern                
IN  To specify multiple possible values for a column


-------------------------------------------------------------ORDER BY Keyword------------------------------------------------------------------

-- ORDER BY keyword is used to sort the result in ascending [ASC] or descending [DESC] order.
-- It sorts the result in Ascending order by default.

SELECT *
FROM Customers 
ORDER BY Country;


SELECT *
FROM Customers 
ORDER BY Country DESC;


-- The following query will select all customers from "Customers" table and will sort the result in Country and then CustomerName
-- That means, if some rows have same country then it orders them by CustomerName.

SELECT * 
FROM Customers
ORDER BY Country, CustomerName;


--ORDER BY several columns
/* This query will select all customers from "Customers" table and will sort the result in Ascending by city and if 
   City has same rows then, it will order in Descending by Country.*/

SELECT * 
FROM Customers 
ORDER BY City ASC, Country DESC;


-- We can also give column number instead of column name.
-- In the following query, it will sort the result based on 2nd column present in the table

SELECT *
FROM Customers
ORDER BY 2;

/* Following query sorts the result based on 2nd column, if 2nd column has same values, it will sort based on 3rd, if 3rd column has same 
values, it will sort based on 1st column */

SELECT *
FROM Customers
ORDER BY 2, 3, 1;   


-------------------------------------------------------------AND Operator------------------------------------------------------------------

-- WHERE clause can contain one or many AND operators
-- AND operator is used to filter the records based on one or more than one condition.
-- AND operator displays a record if all conditions are TRUE
-- OR operator displays a record if any of the condition is TRUE.

--Following query selects all rows whose Country is "Spain" and whose name starts with "G"

SELECT * 
FROM Customers
WHERE Country = "Spain" AND CustomerName LIKE 'G%';


-- All conditions must be true.Following query selects all fields from Customers where Country=  "Germany", City is "Berlin" AND PostalCode>12000.

SELECT *
FROM Customers
WHERE Country = "Germany"
AND City = "Berlin"
AND PostalCode > 12000;


-- Combining AND and OR Keyword
-- It produces different result with and without parantheses

Example 1) It selects all the records of customers whose country is "Spain" that starts with "G" or "R".

SELECT * 
FROM Customers 
WHERE Country = "Spain" AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');


Example 2) It selects all the records of customers whose country is "Spain" AND name starts with "G", or whose name starts with an "R".

SELECT * 
FROM Customers 
WHERE Country = "Spain" AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';



-------------------------------------------------------------OR Operator------------------------------------------------------------------

-- WHERE clause can contain one or more than one operator.
-- OR operator is used to filter records based on more than one condition.

SELECT * 
FROM Customers 
WHERE Country = "Germany"
OR Country = "Berlin";


-- Atleast one condition must be true 

SELECT * 
FROM Customers 
WHERE City = "Berlin" OR CustomerName LIKE 'G%' OR Country = "Norway";



-------------------------------------------------------------NOT Operator------------------------------------------------------------------

-- NOT operator is used in combination with other operator to give the opposite result, also called as negative result.

-- Following query returns the records whose Country is not "Spain"

SELECT * 
FROM Customers
WHERE NOT Country = "Spain";

-- NOT LIKE

SELECT * 
FROM Customers
WHERE CustomerName NOT LIKE 'A%';

-- NOT BETWEEN

SELECT *
FROM Customers
WHERE age NOT BETWEEN 10 AND 60;


-- NOT IN

SELECT * 
FROM Customers
WHERE City NOT IN ('Paris','London');


-- NOT GREATER THAN
-- There is not-greater-than operator "!>". This would give you the same result.

SELECT * 
FROM Customers 
WHERE NOT CustomerID > 50;


-- NOT LESS THAN
-- There is not-Less-than operator "!<". This would give you the same result.

SELECT *
FROM Customers
WHERE NOT CustomerID < 50;



-------------------------------------------------------------Insert Into------------------------------------------------------------------


-- INSERT INTO statement is used to insert the new records in table.

INSERT INTO Customers (FirstName, LastName, age)
VALUES ('Tejas', 'Kenjale', '25');


/*  If you are adding values for all columns of the table, you don't need to specify the column names in sql query.
    However make sure the order is in same order as the columns in table. */

INSERT INTO Customers
VALUES ('Tejas', 'Kenjale', '25', 'United States');

/* Insert data only in specified column: - 
    It is also possible to only insert data in specific columns. and rest of the columns will contain "NULL" as a value.*/
-- Assume there are 4 columns: - ID, FName, LName, age, City. And here ID is auto-incremented.

INSERT INTO Customers(FNAME, LName, age)
VALUES ("Tejas","Kenjale","25");            -- This will insert the data in table as: - 2 Tejas Kenjale 25 NULL


-- Insert multiple rows

INSERT INTO Customers (FName, LName, age, City)
VALUES ("Rohit","Kenjale","26","Mumbai"),
       ("Tejas","Kenjale","25","Mumbai"),
       ("Pooja","Kenjale","24","Mumbai");




-------------------------------------------------------------NULL Values------------------------------------------------------------------


-- A field with NULL value is a field with no value.
/* If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field.
    Then the field will be saved as a NULL value. */

-- NULL Operator: - [IS NULL]
-- How can we test if the field has a NULL value: - 

SELECT * FROM CUSTOMERS
WHERE City IS NULL;         -- This will select all the records which has City as NULL

--NOT NULL: - [IS NOT NULL]
-- IS NOT NULL used to test for non-empty values.

SELECT * FROM Customers 
WHERE City IS NOT NULL;     -- This will select all the records which has a value in City (NOT NULL/non-empty values)




-------------------------------------------------------------UPDATE Statement------------------------------------------------------------------

-- UPDATE statement is used to modify the existing records in a table.
/* Be careful while updating the records in a table. The WHERE clause in UPDATE statement specifies which record to be updated.
   If you omit the WHERE clause it will update all the records. */

UPDATE Customers
SET FName = "Tejas Kenjale"
WHERE CustomerID = "1";

-- UPDATE multiple records

UPDATE Customers
SET ContactName = "Tejas Kenjale"
WHERE City = "Mumbai";

-- Be careful while updating the record. If you omit WHERE clause, all the records will be updated.

UPDATE Customers
SET City = "Mumbai";



-------------------------------------------------------------DELETE Statement------------------------------------------------------------------

-- DELETE Statement is used to delete the existing records from the table.
/* Be careful while deleting the record from the table. The WHERE clause in DELETE statement specifies which record to be deleted.
    If you omit the WHERE clause, then it will delete all the records from the table*/

DELETE FROM Customers
WHERE CustomerID = '1';

-- DELETE all the records

DELETE FROM Customers;  -- This will delete all the records, the table structure, attributes, indexes will be intact, it won't be deleted.

-- DELETE a table

DROP table Customers;       -- This will delete the table completely.



-------------------------------------------------------------SELECT TOP, LIMIT, FETCH FIRST--------------------------------------------------------

/*
SQL Server/MS Access: - SELECT TOP 
MySQL: -                LIMIT
Oracle: -               FETCH FIRST 
*/

-- SELECT TOP, LIMIT, FETCH FIRST: - These clauses are used to specify the number of rows to select/fetch or return.
-- It is useful when large tables with thousands of records.

-- Examples: - 

-- SQL SERVER/MS Access: - 

SELECT TOP 3 * FROM Customers;

-- MySQL: - 

SELECT * FROM Customers LIMIT 3;

-- Oracle: - 

SELECT * FROM Customers 
FETCH FIRST 3 ROWS ONLY;




-- SQL TOP PERCENT Example: - 

-- SQL SERVER/MS Access: - 

SELECT TOP 50 PERCENT * FROM Customers;

-- MySQL: - [It doesn't support PERCENT]

-- Oracle: - 

SELECT * FROM Customers 
FETCH FIRST 50 PERCENT ROWS ONLY;




-- ADD WHERE Clause: - 

-- SQL SERVER/MS Access: - 

SELECT TOP 3 * FROM Customers
WHERE City = "Mumbai";

-- MySQL: - 

SELECT * FROM Customers 
WHERE City = "Mumbai"
LIMIT 3;

-- Oracle: - 

SELECT * FROM Customers 
WHERE City = "Mumbai"
FETCH FIRST 3 ROWS ONLY;





-------------------------------------------------------------MIN(), MAX() Functions------------------------------------------------------------

-- MIN() returns the smallest value of selected column.

SELECT MIN(Price) FROM Products;


-- MAX() returns the largest value of selected column.

SELECT MAX(Price) FROM Products;


-- SQL Column name [Alias]
-- When you use MIN() and MAX(), the return column will be named as MIN(field) or MAX(field) by default.
-- If you want to give the name to the return column, use "AS" keyword.

SELECT MIN(Price) AS SmallestPrice FROM Products;

SELECT MAX(Price) AS [ The Largest Price] FROM Products;




-------------------------------------------------------------Count() Function------------------------------------------------------------


-- COUNT() function returns the number of rows that matches a specified criterion.

SELECT COUNT(*) FROM Products;


-- Add WHERE clause

SELECT COUNT(*) FROM Products
WHERE Price > 20

-- Specify Column
--You can specify column name instead of asterix symbol (*)

SELECT COUNT(ProductName) 
FROM Products;


-- Ignore Duplicates
-- You can ignore duplicate values by "DISTINCT" keyword.
-- If DISTINCT is specified, rows with the same values for the specified column will be counted as 1.

SELECT COUNT(DISTINCT(price))
FROM Products;


-- Use an Alias

SELECT COUNT(*) AS [Number of Records]
FROM Products;




-------------------------------------------------------------SUM() Function------------------------------------------------------------

-- SUM() is used to return the sum of numeric column.

SELECT SUM(Quantity) FROM OrderDetails;


-- Add WHERE clause

SELECT SUM(Quantity) 
FROM Products
WHERE ProductID = 11;


-- Use an Alias: - 

SELECT SUM(Quantity) AS Total quantity
FROM OrderDetails;

-- SUM with Expression: - 

SELECT SUM(Quantity * 10)
FROM OrderDetails;

-- We can also join the table to find the actual amount: - 
-- Here Quantity attribute is in OrderDetails table and Price is in Products table

SELECT SUM(Quantity * Price) 
FROM OrderDetails 
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;




-------------------------------------------------------------AVG() Function------------------------------------------------------------

-- AVG() returns the average value of a numeric column.
-- NULL Values are ignored.

SELECT AVG(Price) FROM Products;


-- Add WHERE clause

SELECT AVG(Price) 
FROM Products
WHERE CategoryID = 1;


-- Use an Alias

SELECT AVG(Price) AS [Average Price]
FROM Products;


-- Higher than Average

SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);





-------------------------------------------------------------LIKE Opearator------------------------------------------------------------


-- LIKE operator is used in WHERE clause to search for a specified pattern in a column.
-- There are 2 wildcards: - 1) % - represents zero, one, or multiple characters.
                            2) _ - represents one, single character. 


-- Selects all customers whose FName starting with letter a.

SELECT * FROM Customers 
WHERE FName LIKE 'a%';


-- The _ Wildcard: - 
-- It represents a single character. It can be number, but each _ represents one, and only one character.

/* Following query returns all the record of customer whose FName starts with T, followed by wild character, then j, 
    and then followed by 2 wildcards __ */

SELECT * FROM Customers
WHERE FName LIKE 'T_j__';


-- The % Wildcard

SELECT * FROM Customers
WHERE FName LIKE "%EJ%";


-- Starts with

SELECT * FROM Customers
WHERE CustomerID LIKE "12%";

-- You can combine any number of conditions using AND & OR operators

SELECT * FROM Customers
WHERE FName LIKE "TE%" OR FName LIKE "RO%";

-- Ends with
-- To return a record that ends with a specified letter or phrase, add the % at the beginning of the letter or phrase.

SELECT * FROM Customers
WHERE FName LIKE "%as";

-- You can also combine starts with and Ends with

SELECT * FROM Customers 
WHERE FName LIKE "T%S";

-- Contains

SELECT * FROM Customers
WHERE FName LIKE "%JA%";


-- Combine wildcards
-- We can combine 2 wildcards.

-- Following query will select the records whose name starts with P and contains atleast 3 letters in length.

SELECT * FROM Customer
WHERE FName LIKE "P__%";  --Prakash

-- Following query returns records whose FName contains J at 3rd position.

SELECT * FROM customers
WHERE FName LIKE "__J%";


-- Without wildcards

SELECT * FROM Customers 
WHERE FName LIKE 'TEJAS';





-------------------------------------------------------------SQL Wildcards------------------------------------------------------------

-- SQL wildcards are used to substitute one or more characters in a string.
-- Wildcards are used with "LIKE" operator. The LIKE operator is used in "WHERE" clause to search for a specified pattern.

/* 
Wildcard Characters are: - 
1) % - Represents zero or more characters.
2) _ - Represents single character
3) [] - Represents any single character within the brackets.
4) -  Represents any single characters in the specified range.
5) {} - Represents any escaped character.
6) ^ - Represents any character not in brackets.
*/

-- Using the % wildcard

SELECT * FROM Customers
WHERE FName LIKE "%as";

-- Return the records which contains the pattern 

SELECT * FROM Customers
WHERE FName LIKE "%JA%";        --TEJAS, POOJA, RANJANA


-- Using the % wildcard

SELECT * FROM Customers
WHERE FName LIKE "_ohit";       -- Rohit


-- Using [] wildcard
--Represents any single character within the brackets.

--Following query will return all customers whose FName starts with either e, j or a 
SELECT * FROM Customers
WHERE FName LIKE "[eja]%";


-- Using - wildcard
--Represents any single characters in the specified range.

--Following query returns all the customers whose FName starts with a,b,c,d,e or f
SELECT * FROM Customers
WHERE FName LIKE "[a-f]%"

-- Combine Wildcards

SELECT * FROM Customers 
WHERE FName LIKE "T__%";   

-- Following query returns all the customers whose FName has 'J' in the 3rd position

SELECT * FROM Customers
WHERE FName LIKE '__J%';

-- Without Wildcard

Select * FROM Customers
WHERE FName LIKE 'TEJAS';


/*

*	Represents zero or more characters	
        bl* finds bl, black, blue, and blob
?	Represents a single character	
        h?t finds hot, hat, and hit
[]	Represents any single character within the brackets	
        h[oa]t finds hot and hat, but not hit
!	Represents any character not in the brackets	
        h[!oa]t finds hit, but not hot and hat
-	Represents any single character within the specified range	
        c[a-b]t finds cat and cbt
#	Represents any single numeric character	
        2#5 finds 205, 215, 225, 235, 245, 255, 265, 275, 285, and 295

*/




-------------------------------------------------------------SQL IN Operator------------------------------------------------------------


-- IN operator allows you to specify multiple values in "WHERE" clause.
-- IN is a shorthand for multiple "OR" condition.

SELECT * FROM customers
WHERE Country IN ('Germany','UK','France');


-- NOT IN
-- By using NOT in front of IN operator, you return all the records that are NOT any of the values in the list

SELECT * FROM Customers
WHERE Country NOT IN ('Germany','UK','France');


-- IN (SELECT)

-- You can also use IN with a subquery in WHERE clause.

SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders); 


-- NOT IN (SELECT)

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders); 





-------------------------------------------------------------SQL BETWEEN Operator------------------------------------------------------------


-- SQL BETWEEN operator selects value within a given range. The valu can be number, text or dates.
-- The BETWEEN operator is inclusive: start and end values are included.


SELECT * FROM Customers
WHERE Price BETWEEN 10 AND 20;


-- NOT BETWEEN

SELECT * FROM Customers
WHERE Price NOT BETWEEN 10 AND 20;


-- BETWEEN with IN operator

SELECT * FROM customers
WHERE Price BETWEEN 10 AND 20 
AND CategoryID IN (1,2,3);


-- BETWEEN Text Values

SELECT * FROM Customers
WHERE Country BETWEEN "Afganisthan" AND "Zimbabwe"     -- This will return the countries from A-to-Z
ORDER BY Country;


-- NOT BETWEEN Text values

SELECT * FROM Customers
WHERE Country NOT BETWEEN "Ghana" AND "Kuwait";     -- This will return the countries except G to K.


-- BETWEEN Dates example

SELECT * FROM ORDERS
WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;

            OR

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';




-------------------------------------------------------------SQL Aliases------------------------------------------------------------


-- SQL Aliases are used to give a table, column in a table, a temporary name.
-- Aliases often used to make column names more readable.
-- An alias exist for the duration of that query.
-- Alias is created with AS keyword.

-- Alias for columns

--Example 1)

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;


--Example 2)
-- It requires double quotes "" or square brackets [] if alias name contains space.

SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;


-- Creating aliases by combining columns: - (Address, PostalCode, City and Country)

SELECT CustomerName, Address + ', ' + PostalCode + ', ' + City + ', ' + Country AS Address
FROM  Customers;




-- Alias for table 


SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Orders AS o, Customers AS c
WHERE c.customerName = "Tejas" AND c.CustomerID = o.CustomerID;

-- Following query is same as above but without aliases

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Orders, Customers
WHERE Customers.CustomerName = "Tejas" AND Customers.CustomerID = Orders.CustomerID;

/*
Aliases can be useful when:

1) There are more than one table involved in a query
2) Functions are used in the query
3) Column names are big or not very readable
4) Two or more columns are combined together

*/



-------------------------------------------------------------SQL JOINS------------------------------------------------------------


-- SQL JOIN is used to combine rows from 2 or more tables, based on a related column between them.


SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


/*
Different Types of JOINS: - 

1) INNER JOIN: -            Returns all records that have all the matching values in both the tables.
2) LEFT (OUTER) JOIN: -     Returns all records from left table, and the matched records from right table. 
3) RIGHT (OUTER) JOIN: -    Returns all records from right table, and matched records from left table.
4) FULL (OUTER) JOIN: -     Returns all records when there is a match in either left or right table.

*/


-- SQL INNER JOIN KEYWORD: - 

-- INNER JOIN keyword selects records that have matching value in both tables.

SELECT Orders.OrderID, Customers.CustomerName 
FROM Orders,
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

/* INNER JOIN selects all rows from both the tables as long as there is a match between the columns.
    If there are records in the 1st table that do not have matches in 2nd table, these orders will not be shown.*/

-- JOIN 3 Tables

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((
    Orders
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
    INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);




-- SQL LEFT JOIN/LEFT OUTER JOIN KEYWORD: -

/* The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
    The result is 0 records from the right side, if there is no match.*/

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;



-- SQL RIGHT JOIN/RIGHT OUTER JOIN KEYWORD: - 

/* The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). 
The result is 0 records from the left side, if there is no match. */

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees 
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


-- SQL FULL JOIN/FULL OUTER JOIN KEYWORD: - 

-- The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

SELECT Customers.CustomerName, Orders.CustomerID
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
ORDER BY Customers.CustomerName;


/*
 The FULL OUTER JOIN keyword returns all matching records from both tables whether the other table matches or not. 
So, if there are rows in 1st table that do not have matches in 2nd table, 
or if there are rows in 2nd table that do not have matches in 1st table, those rows will be listed as well.
*/



-- SQL SELF JOIN KEYWORD: - 

-- SELF JOIN Keyword is a regular join, but the table is joined with itself.

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;



-------------------------------------------------------------SQL UNION------------------------------------------------------------


-- UNINON Operator is used to combine result-set of 2 or more SELECT statements.
-- Every SELECT Statement must have same no. of columns.
-- The columns must also have similar data type.
-- The columns in every SELECT statement must also be in the same order.

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

/*
If If some customers or suppliers have the same city, each city will only be listed once.
Because "UNION" selects only distinct values. Use "UNION ALL" to also select duplicate values!
*/


-- UNION ALL


-- The following SQL statement returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table:

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;


-- SQL UNION with WHERE

SELECT City, Country FROM Customers
WHERE Country = "Germany"
UNION 
SELECT City, Country FROM Suppliers
WHERE Country = "Germany"
ORDER BY City;


-- SQL UNION ALL with WHERE

SELECT City, Country FROM Customers
WHERE Country = "Germany"
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country = "Germany"
ORDER BY City;


-- Alias in UNION

SELECT 'Customer' as Type, ContactName, City, Country
FROM Customers
UNION 
SELECT 'Suppliers', ContactName, City, Country
FROM Suppliers;

/*
Notice the "AS Type" above - it is an alias. SQL Aliases are used to give a table or a column a temporary name. 
An alias only exists for the duration of the query. 
So, here we have created a temporary column named "Type", that list whether the contact person is a "Customer" or a "Supplier".
*/




-------------------------------------------------------------SQL GROUP BY------------------------------------------------------------

-- GROUP BY groups rows that have the same values into summary rows, like "finding no. of customers in each country".
-- GROUP BY is often used with aggregate functions [COUNT(), MAX(), MIN(), SUM(), AVG()] to group the result-set by one or more columns.

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;


-- Following query lists no. of customers in each country, sorted high to low

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;


-- GROUP BY with JOIN

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfRecords
FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;



-------------------------------------------------------------SQL HAVING------------------------------------------------------------


-- HAVING clause was added to SQL because WHERE keyword cannot be used with aggregate functions.


-- Following query lists the number of customers in each country. Only include countries with more than 5 customers:

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;


-- lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

-- following query lists the employees that have registered more than 10 orders:

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;


--following query lists if the employees "Davolio" or "Fuller" have registered more than 25 orders:

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = "Davolio" OR LastName = "Fuller"
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;



-------------------------------------------------------------SQL EXISTS Operator------------------------------------------------------------

-- EXISTS operator is used to test for the existence of any record in a subquery.
-- EXISTS operator returns TRUE if the subquery one or more records.

-- In Following query: - subquery returns TRUE and lists the suppliers with a product price less than 20
/* we should mention relationship between 2 tables (Products.SupplierID = Suppliers.SupplierID) 
otherwise it will return all the records i.e. SupplierNames.*/

SELECT SupplierName 
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.SupplierID AND Price < 20);

-- Following query returns TRUE and lists the suppliers with a product price equal to 22
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);





-------------------------------------------------------------SQL ANY, ALL------------------------------------------------------------


-- ANY and ALL operator allows you to perform comparison between single column value and range of other values.

/* SQL ANY: - 
1) returns a boolean value as a result.
2) return TRUE if ANY of the subquery values meet the condition.

ANY means that the condition will be true if the operation is true for any of the values in the range.

The operator must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).

*/

-- Following query lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10.
--Subquery will return TRUE because the Quantity column has some values of 10.

SELECT ProductName
FROM Products 
WHERE ProductID = ANY 
(SELECT ProductID FROM OrderDetails         -- This subquery will return TRUE, as the table has atleast 1 ProductID whose Quantity = 10.
WHERE Quantity = 10);


-- Following query lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 99.
-- Subquery will return TRUE because the Quantity column has some values larger than 99.

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails             -- This subquery will return TRUE, as the table has atleast 1 ProductID whose Quantity > 99.
  WHERE Quantity > 99);


-- Following query lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 1000.
-- Subquery will return FALSE because the Quantity column has no values larger than 1000.

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails             -- This subquery will return TRUE, as table has atleast 1 ProductID whose Quantity > 1000.
  WHERE Quantity > 1000);



-- SQL ALL: - 
/*
1) returns a boolean value as a result.
2) returns TRUE if ALL of the subquery values meet the condition.
3) is used with SELECT, WHERE, HAVING statements.
*/

-- ALL means that the condition will be true only if the operation is true for all values in the range. 

-- Following query lists ALL the product names.

SELECT ALL ProductName
FROM Products
WHERE TRUE;


/* Following query lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. 
This will of course return FALSE because the Quantity column has many different values (not only the value of 10). */

SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails         -- This subquery will return FALSE, as the Quantity column has different values. Not only equal to 10.
  WHERE Quantity = 10);





-------------------------------------------------------------SQL SELECT INTO------------------------------------------------------------

-- SELECT INTO copies data from one table into a new table.
-- The new table will be created with the column-names and types as defined in the old table. You can create new column names using the AS clause.

-- Following query copying all the columns and data from Customers to newCustomers table.
SELECT * INTO newCustomers
FROM Customers;

-- Following query is using "IN" clause to copy the data into new table in another database.

SELECT * INTO newCustomers IN 'Backhup.db'
FROM Customers;


-- Following query copies only few columns into new table.

SELECT CustomerName, ContactName INTO  newCustomers
FROM Customers;


-- Following query copies only the Germany customers into a new table.

SELECT * INTO newCustomers
FROM Customers 
WHERE Country = "Germany";


-- Following query copies data from more than 1 table into new table.

SELECT Customers.CustomerName, Orders.OrderID INTO newCustomers
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


-- SELECT INTO can also be used to create a new, empty table using the schema of another. 
-- Just add a WHERE clause that causes the query to return no data.

SELECT * INTO neCustomers
FROM Customers
WHERE 1 = 0;




-------------------------------------------------------------SQL INSERT INTO SELECT------------------------------------------------------------

-- INSERT INTO SELECT copies data from one table and inserts it into another table.
-- INSERT INTO SELECT statement requires that the data type in source and target tables match.

-- NOTE: - The existing records in the Target table are unaffected.


-- Following query copies data from "Suppliers" table to "Customers" table. [The columns that are not filled with data, will contain NULL].

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;


-- Following query copies "Suppliers" to "Customers" [Fill all columns].

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;


-- Following query copies only German "Suppliers" into "Customers".

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country = "Germany";






-------------------------------------------------------------SQL CASE Expression------------------------------------------------------------

/*
1) CASE expression goes through conditions and returns a value when first condition is met (like if-else).
2) So, once a  condition is TRUE is will stop reading and return the result.  If no conditions are TRUE, it returns the value in ELSE clause.
3) If there is no ELSE part and no conditions are TRUE, then it returns NULL.
*/

-- Following query returns a value when 1st condition is met.

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN "Quantity is greater than 30"
    WHEN Quantity = 30 THEN "Quantity is equal to 30"
    ELSE "Quantity is less than 30"
END AS Result
FROM OrderDetails;


-- Following query will order the customers by City. However, if City is NULL then, order by Country.

SELECT CustomerName, City, Country 
FROM Customers
ORDER BY
CASE
    WHEN City IS NULL THEN Country
    Else City
END;




-------------------------------------------------------------SQL NUL Function------------------------------------------------------------


-- SQL IFNULL(), ISNULL(), COALESCE(), NVL() Functions: - 

-- Suppose that the "UnitsOnOrder" column is optional, and may contain NULL values.

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)   
FROM Products;

-- In above example, if any of the "UnitsOnOrder" values are NULL, the result will be NULL.

-- So, solution is: -

-- FOR MYSQL: - 

SELECT ProductName, UnitPrice * (UnitsOnStock + IFNULL(UnitsOnOrder, 0))
FROM Products;

                OR

SELECT ProductName, UnitPrice * (UnitsOnStock + COALESCE(UnitsOnOrder, 0))
FROM Products;



-- FOR SQL SERVER: - 

SELECT ProductName, UnitPrice * (UnitsOnStock + ISNULL(UnitsOnOrder, 0))
FROM Products;

                OR

SELECT ProductName, UnitPrice * (UnitsOnStock + COALESCE(UnitsOnOrder, 0))
FROM Products;



-- FOR MS ACCESS: - 
-- The MS Access IsNull() function returns TRUE (-1) if the expression is a null value, otherwise FALSE (0)

SELECT ProductName, UnitPrice * (UnitsOnStock + IIF(ISNULL(UnitsOnOrder), 0, UnitsOnOrder))
FROM Products;



-- FOR ORACLE: - 

SELECT ProductName, UnitPrice * (UnitsOnStock + NVL(UnitsOnOrder, 0))
FROM Products;

                OR

SELECT ProductName, UnitPrice * (UnitsOnStock + COALESCE(UnitsOnOrder, 0))
FROM Products;





-------------------------------------------------------------SQL Stored Procedure------------------------------------------------------------


-- A stored procedure is a prepared SQL code that you can save, so the code can reuse over and over again.
-- So, if you have any SQL query that you write over and over again, save it as stored procedure, and then just call it to execute.
-- You can also pass the parameters to stored procedure, so the stored procedure can act based on the parameters value that is passed.


-- Creating a procedure: - 

-- Following query creates a stored procedure that selects all records from the "Customers" table.

CREATE PROCEDURE SelectAllCustomers
AS 
SELECT * FROM Customers
GO;


-- Calling a Procedure: - 
EXEC SelectAllCustomers;


-- Stored Procedure with 1 parameter.

-- following query creates a stored procedure that selects Customers from a particular City from the "Customers" table.

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @city
GO;


-- Calling Procedure.

EXEC SelectAllCustomers @City = "Mumbai";


-- Store Procedure with multiple parameters: - 

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

-- Calling Procedure: - 

EXEC SelectAllCustomers @City = 'Mumbai', @PostalCode = '07029';




-------------------------------------------------------------SQL Operator------------------------------------------------------------

/*
1) SQL Arithmetic Operator: - 

+   ADD         =>  SELECT 30+20
-   SUBTRACT    =>  SELECT 30-20
*   MULTIPLY    =>  SELECT 30*20
/   DIVIDE      =>  SELECT 30/20
%   MODULO      =>  SELECT 30%20

*/


2) SQL Bitwise Operator: - 

&   Bitwise AND 
|   Bitwise OR
^   Bitwise Exclusive OR


3) SQL Comparison Operator: - 

=   Equal To                    =>  SELECT * FROM Customers WHERE City = "Mumbai";
<   Less Than                   =>  SELECT * FROM Customers WHERE Price < 30 ;
>   Greater Than                =>  SELECT * FROM Customers WHERE Price > 30 ;
<=  Less Than or Equal To       =>  SELECT * FROM Customers WHERE Price <= 30 ;
>=  Greater Than or Equal To    =>  SELECT * FROM Customers WHERE Price >= 30 ;
<>  Not Equal To                =>  SELECT * FROM Customers WHERE Price <> 30 ;


4) Compound Operator: - 

+=  Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals


5) Logical Operator: - 

ALL         TRUE if all of the subquery values meet the condition	          
AND         TRUE if all the conditions separated by AND is TRUE	            
ANY	        TRUE if any of the subquery values meet the condition           	
BETWEEN	    TRUE if the operand is within the range of comparisons          	
EXISTS	    TRUE if the subquery returns one or more records	            
IN	        TRUE if the operand is equal to one of a list of expressions	
LIKE	    TRUE if the operand matches a pattern	                        
NOT	        Displays a record if the condition(s) is NOT TRUE               	
OR	        TRUE if any of the conditions separated by OR is TRUE           	
SOME	    TRUE if any of the subquery values meet the condition    





------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------SQL DATABASES-------------------------------------------------------------


-------------------------------------------------------------------SQL CREATE DB----------------------------------------------------------------------



-- "CREATE DATABASE" statement is used to create a new SQL database.

CREATE DATABASE testDB;


-------------------------------------------------------------------SQL DROP DB----------------------------------------------------------------------

-- "DROP DATABASE" is used to drop an existing SQL database.

DROP DATABASE testDB;


-------------------------------------------------------------------SQL BACKUP DB----------------------------------------------------------------------

-- "BACKUP DATABASE" is used in SQL server to create a "FULL" backup of an existing SQL database.

BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';

-- SQL BACKUP DATABASE WITH DIFFERENTIAL
-- BACKUP DATABASE WITH DIFFERENTIAL is only backs up the parts of the database that have changed since the last full database backup.


BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;


-------------------------------------------------------------------SQL CREATE TABLE--------------------------------------------------------------

-- CREATE TABLE statement is used to create a new table in a database.
-- Column parameter specifies name of the columns of the database.
-- datatype parameter specifies the type of data the column can hold. (e.g. varchar, int, date, etc.)

CREATE TABLE Persons (
    PersonID int,
    Name VARCHAR(255),
    age int,
    Address VARCHAR(255),
    City VARCHAR(255)
);

-- The above query will create an empty table.



-- CREATE TABLE using another table.
-- Following query will create a new table "Customers" (which is copy of "Customers" table)
-- If you create new table using existing table, the new table will be filled with the existing values from the old table.


CREATE TABLE testTable AS
SELECT customerName, contactName
FROM Customers; 



-------------------------------------------------------------------SQL DROP TABLE--------------------------------------------------------------

-- DROP TABLE is used to drop an existing table in a database.

DROP TABLE testTable;

-- SQL TRUNCATE TABLE
-- TRUNCATE TABLE is used to delete the data inside the table, but not the table itself.

TRUNCATE TABLE testTable;




-------------------------------------------------------------------SQL ALTER TABLE--------------------------------------------------------------


-- ALTER TABLE is used to add, delete, modify the columns in a table.
-- It is also used to add and drop various constraints on an existing table.


-- ALTER TABLE ADD column: - 

ALTER TABLE testTable
ADD Email VARCHAR(255);


-- ALTER TABLE DROP COLUMN: - 

ALTER TABLE testTable
DROP COLUMN Email;


-- ALTER TABLE RENAME COLUMN: - 

ALTER TABLE testTable
RENAME COLUMN email to Email;


-- ALTER TABLE - ALTER/MODIFY DATATYPE: - 
-- To change the data type of a column in a table,

-- SQL SERVER
ALTER TABLE testTable
ALTER COLUMN customerID VARCHAR(255);

-- MS SQL / Oracle: - 

ALTER TABLE testTable
MODIFY COLUMN customerID VARCHAR(255);


-- Oracle: - 

ALTER TABLE testTable
MODIFY customerID VARCHAR(255); 




-------------------------------------------------------------------SQL Constraints--------------------------------------------------------------


-- Constraints are used to specify rules for data in a table.
-- Constraints can be specified when creating the table with "CREATE TABLE" statement, or after the table is created with "ALTER TABLE" statement
/* Constraints are used to limit the type of data that can go into a table. This ensures data accuracy and reliability of the data in table. 
    If there is violation between the constraint and the data action. the action is aborted. */

-- Constraints are column level or table level. Column level constraints are applied to column and table level constraints are applied to table.

/* Constraints are : - 
1) NOT NULL         - Ensures that the column cannot have a NUL values.
2) UNIQUE           - Ensures that all values in a column is unique/different.
3) PRIMARY KEY      - A combination of NOT NULL and UNIQUE. Uniquely identifies each row in a table.
4) FOREIGN KEY      - Prevents actions that would destroy the link between the tables.
5) CHECK            - Ensures that the values in a column satisfies the specific condition.
6) DEFAULT          - Sets a default value for a column if the value is no value is specified.
7) CREATE INDEX     - Used to create and retrieve the data from the database very quickly.



1) NOT NULL Constraint: - 


By default, a column can store NULL values.
NOT NULL constraint enforces the column to NOT accept the NULL values.
This enforces the field to always contain a value, means that you cannot insert a new record, or update a record without adding a value to field.
*/


-- SQL NOT NULL on CREATE TABLE: - 
--      The following query will create a table "Persons" 


CREATE TABLE Persons (
    ID int NOT NULL
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL
    Age int
);


-- SQL NOT NULL on ALTER TABLE: - 
--      The following query is updating the table and applying the constraint on a column.

-- SQL Server / MS Access:
ALTER TABLE Persons
ALTER COLUMN age int NOT NULL;

-- My SQL / Oracle (prior version 10G):
ALTER TABLE Persons
MODIFY COLUMN age int NOT NULL;

-- Oracle 10G and later:
ALTER TABLE Persons
MODIFY age int NOT NULL;



/*
1) UNIQUE Constraint: - 

Unique constraint ensures that all values in a column are different.
Both UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
A primary key constraint automatically has a UNIQUE constant.
However, you can have many UNIQUE constraint per table, but only one PRIMARY KEY constraint per table.
*/

-- SQL UNIQUE constraint on CREATE TABLE: - 

-- SQL Server / Oracle / MS Access:

CREATE TABLE Persons(
    ID int NOT NULL UNIQUE,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255),
    Age int
);

-- MySQL

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255),
    Age int,
    UNIQUE (ID) 
);


-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:
--MySQL / SQL Server / Oracle / MS Access:

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID, LastName)
);


-- SQL UNIQUE Constraint on ALTER TABLE: - 

--MySQL / SQL Server / Oracle / MS Access:

ALTER TABLE Persons
ADD UNIQUE (ID);

-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax: 
-- MySQL / SQL Server / Oracle / MS Access: 

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID, LastName);


-- DROP UNIQUE Constraint: - 

--MySQL:

ALTER TABLE Persons
DROP INDEX UC_Persons;

-- SQL Server / Oracle / MS Access:

ALTER TABLE Persons
DROP CONSTRAINT UC_Persons;


/*
2) PRIMARY KEY Constraint: - 

PRIMARY KEY constraint uniquely identifies each row in a table.
PRIMARY KEY must contain UNIQUE values, and cannot contain NULL values.
A table can have only 1 primary key; And in the table, this primary key can consist of single or multiple columns(fields);

*/


-- SQL PRIMARY KEY on CREATE TABLE: - 

-- MySQL: - 

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);


-- SQL Server / Oracle / MS Access:


CREATE TABLE Persons(
    ID int NOT NULL PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    Age int,
);


-- SQL PRIMARY KEY Constraint on ALTER TABLE: - 

-- MySQL / SQL Server / Oracle / MS Access:

ALTER TABLE Persons
ADD PRIMARY KEY (ID);


-- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:
/* If you use ALTER TABLE to add a primary key, 
the primary key column(s) must have been declared to not contain NULL values (when the table was first created).*/

ALTER TABLE Persons
ADD CONSTRAINT PK_Persons PRIMARY KEY (ID, LastName);


-- DROP PRIMARY KEY Constraint: - 

-- MySQL

ALTER TABLE Persons
DROP PRIMARY KEY;

-- SQL Server / Oracle / MS Access:

ALTER TABLE Persons
DROP CONSTRAINT PK_Persons;


/*
3) FOREIGN KEY Constraint: - 

FOREIGN KEY is used to prevent action that would destroy link between 2 tables.
FOREIGN KEY is a field (collection of fields) in 1 table, that refers to PRIMARY KEY in another table.
A table with foreign key is called as child table, and the table with primary key is called as Parent table or referenced table.
*/

-- SQL FOREIGN KEY Constraint on CREATE TABLE: - 
-- Assume Persons is a parent table/Referenced table and Orders is a Child table.


-- MySQL: - 

CREATE TABLE Orders(
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)    
);


-- SQL Server / Oracle / MS Access:

CREATE TABLE Orders(
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int,
    FOREIGN KEY (PersonID) REFERENCES Persons (PersonID)
);


-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:
-- MySQL / SQL Server / Oracle / MS Access:


CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) 
    REFERENCES Persons (PersonID)
);



-- SQL FOREIGN KEY Constraint on ALTER TABLE: - 

-- MySQL / SQL Server / Oracle / MS Access:

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);


-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

--MySQL / SQL Server / Oracle / MS Access:

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrders 
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);


-- DROP a FOREIGN KEY constraint

--MySQL: - 

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrders;

-- SQL Server / Oracle / MS Access:

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrders;



/*
4) CHECK Constraint: - 

SQL CHECK CONSTRAINT is used to limit the value range that can be placed in a column.
If you define a CHECK constraint on a column it will allow only certain values for them 
If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
*/


-- SQL CHECK Constraint on CREATE TABLE: - 

-- MySQL: - 

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    Age int,
    CHECK (Age>=18)
);


-- SQL Server / Oracle / MS Access:

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    AGE int CHECK (Age>=18)
);


-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

--MySQL / SQL Server / Oracle / MS Access:

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Persons CHECK (Age>=18 and City = 'Mumbai')
);


-- SQL CHECK CONSTRAINT on ALTER TABLE: - 

-- MySQL / SQL Server / Oracle / MS Access:


ALTER TABLE Persons
ADD CHECK (Age>=18);


-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:
-- MySQL / SQL Server / Oracle / MS Access:

ALTER TABLE Persons
ADD CONSTRAINT CHK_Persons CHECK (Age>=18 and City = 'Mumbai');


-- DROP CHECK Constraint: - 

-- SQL Server / Oracle / MS Access:

ALTER TABLE Persons
DROP CONSTRAINT CHK_Persons;


--MySQL: - 

ALTER TABLE Persons 
DROP CHECK CHK_Persons;




/*
5) DEFAULT Constraint: -

DEFAULT Constraint is used to set the default value for a column.
The default value will be added to all new records, if no value is specified.

*/

-- SQL DEFAULT on CREATE TABLE: - 

-- My SQL / SQL Server / Oracle / MS Access:

CREATE TABLE Persons(
    ID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Mumbai'
);

-- The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE():

CREATE TABLE Orders(
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);


-- SQL DEFAULT on ALTER TABLE: - 

--MySQL

ALTER TABLE Persons
ALTER City SET DEFAULT 'Mumbai';

-- SQL Server:

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Mumbai' FOR City;

-- MS Access:

ALTER TABLE Persons
ALTER COLUMN City SET DEFAULT 'Mumbai';


-- Oracle

ALTER TABLE Persons
MODIFY City DEFAULT 'Mumbai';



-- DROP a DEFAULT constraint: - 

-- MySQL: - 

ALTER TABLE Persons
ALTER City DROP DEFAULT;

-- SQL Server / Oracle / MS Access:

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;




/*
6) SQL INDEX: -

SQL CREATE INDEX Statement
The CREATE INDEX statement is used to create indexes in tables.
Indexes are used to retrieve data from the database more quickly than otherwise. 
The users cannot see the indexes, they are just used to speed up searches/queries.


Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update).
So, only create indexes on columns that will be frequently searched against.

*/

-- CREATE INDEX : - 

CREATE INDEX idx_LastName
ON Persons (LastName);

-- If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:

CREATE INDEX idx_pname
ON Persons (FirstName, LastName);


-- DROP INDEX: - 

--MS Access:

DROP INDEX index_name ON table_name;

-- SQL Server:

DROP INDEX table_name.index_name;

-- DB2/Oracle:

DROP INDEX index_name;

-- MySQL

ALTER TABLE table_name
DROP INDEX index_name;





-------------------------------------------------------------------SQL AUTO INCREMENT Field--------------------------------------------------------------

/*
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

*/

--MYSQL: - 

CREATE TABLE Persons(
    ID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255),
    LastName varchar(255),
    Age int 
);

-- MySQL uses the AUTO_INCREMENT keyword to perform an auto-increment feature.
-- By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
-- To let the AUTO_INCREMENT sequence start with another value, use the following SQL statement:

ALTER TABLE Persons AUTO_INCREMENT=100;

/* 
To insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column 
(a unique value will be added automatically):
 */

INSERT INTO Persons (FirstName, LastName)
VALUES ('Tejas','Kenjale');                 -- The inserted row in the table will be: - 1, Tejas, Kenjale



--SQL SERVER: - 

CREATE TABLE Persons(
    ID int IDENTITY(1,1) NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    Age int
);

/*
The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.
In the example above, the starting value for IDENTITY is 1, and it will increment by 1 for each new record.
Tip: To specify that the "Personid" column should start at value 10 and increment by 5, change it to IDENTITY(10,5).


To insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column 
(a unique value will be added automatically):

*/
INSERT INTO Persons(FirstName, LastName)
VALUES('Tejas', 'Kenjale');


-- MS ACCESS: - 

CREATE TABLE Persons(
    ID AUTOINCREMENT NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    Age int
);

/*
The MS Access uses the AUTOINCREMENT keyword to perform an auto-increment feature.
By default, the starting value for AUTOINCREMENT is 1, and it will increment by 1 for each new record.

Tip: To specify that the "Personid" column should start at value 10 and increment by 5, change the autoincrement to AUTOINCREMENT(10,5).

To insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column (a unique value will be added automatically):
*/

ALTER TABLE Persons(FirstName, LastName)
VALUES('Tejas','Kenjale');


-- ORACLE: - 

/*
In Oracle the code is a little bit more tricky.
You will have to create an auto-increment field with the sequence object (this object generates a number sequence).
Use the following CREATE SEQUENCE syntax:

*/

CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

/*
The code above creates a sequence object called seq_person, that starts with 1 and will increment by 1. 
It will also cache up to 10 values for performance. 
The cache option specifies how many sequence values will be stored in memory for faster access.

To insert a new record into the "Persons" table, we will have to use the nextval function 
(this function retrieves the next value from seq_person sequence):
*/

INSERT INTO Persons (Personid,FirstName,LastName)
VALUES (seq_person.nextval,'Lars','Monsen');




-------------------------------------------------------------------SQL DATES--------------------------------------------------------------

/*
The most difficult part when working with dates is to be sure that the format of the date you are trying to insert, 
matches the format of the date column in the database.


As long as your data contains only the date portion, your queries will work as expected. 
However, if a time portion is involved, it gets more complicated.

*/

-- Assume that, we want to select the records with an OrderDate of "2008-11-11" from the table Orders: - 

SELECT * FROM Orders WHERE OrderDate = '2008-11-11';


-- Note: Two dates can easily be compared if there is no time component involved!

/*
 Now assume Orders table contains the the column OrderDate and it has values with this format(with timestamp): - [2008-11-11 13:23:44]

If we use the same SELECT statement: - 
*/

SELECT * FROM Persons WHERE OrderDate = '2008-11-11';

-- we will get no result! This is because the query is looking only for dates with no time portion.
-- Tip: To keep your queries simple and easy to maintain, do not use time-components in your dates, unless you have to!




-------------------------------------------------------------------SQL VIEWS--------------------------------------------------------------

/*
In SQL, a view is a virtual table based on the result-set of an SQL statement.
A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
A view is created with the CREATE VIEW statement. 

*/

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

-- We can query the view as below: - 

SELECT * FROM [Brazil Customers];


-- The following SQL creates a view that selects every product in the "Products" table with a price higher than the average price:

CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- We can query VIEW as follows: - 

SELECT * FROM [Products Above Average Price];



-- SQL UPDATING VIEW: - 

-- A view can be updated with the CREATE OR REPLACE VIEW statement.

CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';


-- SQL DROP VIEW: - 

DROP VIEW [Brazil Customers];



























































































































