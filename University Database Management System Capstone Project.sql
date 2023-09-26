create database UTKAL_UNIVERSITY

USE UTKAL_UNIVERSITY

CREATE TABLE College_Table(

College_ID INT NOT NULL PRIMARY KEY,
College_Name VARCHAR(100) NOT NULL,
College_Area  VARCHAR(100) NOT NULL
)

SELECT * FROM College_Table

CREATE TABLE Department_Table(

Dept_ID INT NOT NULL PRIMARY KEY,
Dept_Name VARCHAR(100)NOT NULL,
Dept_Facility VARCHAR(100)NOT NULL,
College_ID INT

)

DROP TABLE College_Table

CREATE TABLE Professor_Table
(Professor_ID INT PRIMARY KEY,
Professor_Name VARCHAR(100),
Professor_Subject VARCHAR(100))

CREATE TABLE Student_Table
(Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(100),
Student_Stream VARCHAR(100),
Professor_ID INT)

INSERT INTO College_Table (College_ID,College_Name,College_Area)
VALUES
	(8000,'DAV','Delhi'),
	(8001,'Era International','Noida'),
	(8002,'Loyola High','Gurgaon'),
	(8003,'St. Johns High','Gachibowli'),
	(8004,'Little Angels Public','Chennai'),
	(8005,'Satavahana College','Pune'),
	(8006, 'V.B.R English Medium High','Nagpur'),
	(8007,'Srikrishna Vidya Mandir','Visakhapatnam'),
	(8008,'St. Xaviers High','Bhubaneswar'),
	(8009,'Government Secondary','Kolkata')

INSERT INTO Department_Table(Dept_ID, Dept_Name ,Dept_Facility,College_ID)
VALUES 
	(101,'TEACHING','Communication Skills',8000),
	(201,'HOSTEL','ac AND WASHING MACHINE',8001),
	(110,'CANTEEN','OVEN',8002 ),
	(010,'GARDENING','PLANTING',8003),
	(011,'SPORTS','SWIMMING POOL AND PLAY GROUND',8004 ),
	(021,'Marketing','ADMISSION',8005 ),
	(041,'Accounting','FEES COLLECTION',8006 ),
	(441,'IT','COMPUTER LAB',8007 ),
	(244,'Research and Development','CHEMISTRY LAB',8008 ),
	(343,'RECEPTION','ENQUIRY',8009)


INSERT INTO Professor_Table (Professor_ID , Professor_Name , Professor_Subject)
VALUES 
	(400166, 'shipra','Mathematics'),
	(400167, 'Sudhipta','English') ,
	(400168, 'Deepak','Chemistry'),
	(400169, 'Geetha','Social Science'),
	(400170, 'Ram','Geography'),
	(400171, 'Samuel','History'),
	(400172, 'Virendra','Biology'),
	(400173, 'Vidya','Botany'),
	(400174, 'Bhawna','Computer science'),
	(400175, 'Vedika','Sports')

DROP TABLE Professor_Table


INSERT INTO Student_Table (Student_ID,Student_Name,Student_Stream,Professor_ID)
VALUES 
	(2258963,'Aman','Mathematics',400166),
	(4455632,'Mir','English',400167),
	(0032058,'Gaurav','Chemistry',400168),
	(0092058,'Gaurav','Social Science',400169),
	(0258963,'Nitesh','History',400170),
	(0321963,'Amosh','Geography',400171),
	(0963245,'Sam','History',400172),
	(0258063,'Vijay','Biology',400173),
	(8745623,'Vivek','Botany',400174),
	(2258258,'Awani','Computer science',400175)


--Task 2:-
--Give the information of College_ID and College_name from College_Table

SELECT College_ID,College_name FROM College_Table

--2.Show  Top 5 rows from Student_table.

SELECT TOP 5* FROM Student_Table

--3.What is the name of  professor  whose ID  is 400175

SELECT Professor_Name FROM Professor_Table
WHERE Professor_ID = 400175

--4.Convert the name of the Professor into Upper case 

SELECT UPPER(Professor_Name) FROM Professor_Table

--5.Show me the names of those students whose name is start with a

SELECT Student_Name FROM Student_Table
WHERE Student_Name LIKE 'A%'

--UPDATED THE STUDENT TABLE
UPDATE Student_Table
SET Student_Name = 
case
WHEN Student_ID = 4455632 then 'Mira' 
WHEN Student_ID = 0092058 then 'Richa'
WHEN Student_ID = 0963245 then 'Sama'
WHEN Student_ID = 8745623 then 'Vidisa'
END
WHERE Student_ID in (4455632,0092058,0963245,8745623)

--6.Give the name of those colleges whose end with a

SELECT College_Name FROM College_Table WHERE College_Name LIKE '%A'

--7. Add one Salary Column in Professor_Table

ALTER TABLE Professor_Table
ADD SALARY DECIMAL(10,2)

ALTER TABLE Professor_Table
ADD [Dept_ID] INT

SELECT * FROM Professor_Table

UPDATE Professor_Table
SET [Dept_ID] = 
case
WHEN Professor_ID = 400166 then 101 
WHEN Professor_ID = 400167 then 201
WHEN Professor_ID = 400168 then 110
WHEN Professor_ID = 400169 then 010
WHEN Professor_ID = 400170 then 011
WHEN Professor_ID = 400171 then 021
WHEN Professor_ID = 400172 then 041
WHEN Professor_ID = 400173 then 441
WHEN Professor_ID = 400174 then 244
WHEN Professor_ID = 400175 then 343
END
WHERE Professor_ID in (400166,400167,400168,400169,400170,400171,400172,400173,400174,400175)


--8.Add one Contact Column in Student_table

ALTER TABLE Student_table
ADD CONTACT INT

SELECT * FROM Student_table

UPDATE Student_table
SET CONTACT = 
case
WHEN Student_ID = 2258963 then 95354
WHEN Student_ID = 4455632 then 95354
WHEN Student_ID = 0032058 then 953549
WHEN Student_ID = 0092058 then 953549
WHEN Student_ID = 0258963 then 953542
WHEN Student_ID = 0321963 then 952354
WHEN Student_ID = 0963245 then 953249
WHEN Student_ID = 0258063 then 953542
WHEN Student_ID = 8745623 then 955249
WHEN Student_ID = 2258258 then 953529
END
WHERE Student_ID in (2258963,4455632,0032058,0092058,0258963,0321963,0963245,0258063,8745623,2258258)

--9.Find the total Salary of Professor 

SELECT SUM(SALARY) AS TOTAL_SALARY FROM Professor_Table

--10.Change datatype of any one column of any one Table

ALTER TABLE Professor_Table
ALTER COLUMN SALARY INT



--Task 3:-
--1.Show first 5 records from Students table and Professor table Combine

SELECT TOP 5* FROM Student_Table
INNER JOIN Professor_Table
ON Student_Table.Professor_ID = Professor_Table.Professor_ID

--2.Apply Inner join on all 4 tables together

SELECT * FROM College_Table
INNER JOIN Department_Table ON [dbo].[College_Table].College_ID = [dbo].[Department_Table].College_ID
INNER JOIN Professor_Table ON [dbo].[Department_Table].[Dept_ID] = [dbo].[Professor_Table].[Dept_ID]
INNER JOIN Student_Table ON [dbo].[Professor_Table].[Professor_ID] =  Student_Table.Professor_ID

--3.Show Some null values from Department table and Professor table.

SELECT * FROM Professor_Table 
INNER JOIN [Department_Table]
ON [dbo].[Department_Table].[Dept_ID] = [dbo].[Professor_Table].[Dept_ID]
WHERE Professor_Name IS NULL AND Dept_Name IS NULL

--4.Create a View from College Table  and give those records whose college name starts with L

CREATE VIEW COLLEGENAMEL AS
SELECT College_Name FROM College_Table
WHERE College_Name LIKE 'L%'

SELECT * FROM COLLEGENAMEL

--5.Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.

CREATE PROCEDURE ProfessorStoredProcedure
AS SELECT [Professor_ID] FROM [Professor_Table]
GO

EXEC ProfessorStoredProcedure

--6.Rename the College_Table to College_Tables_Data .

EXEC sp_rename College_Table, College_Tables_Data