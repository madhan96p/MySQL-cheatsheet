-- Create a new database
CREATE DATABASE cheatsheet;

-- Select the database to use
USE cheatsheet;

-- Create the employees table
CREATE TABLE employees (
    eid INT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20),
    salary REAL,
    joindate DATE,
    dept VARCHAR(10),
    gender CHAR
);

-- Create the project table
CREATE TABLE project (
    pid INT PRIMARY KEY,
    eid INT,
    pname VARCHAR(20),
    FOREIGN KEY (eid) REFERENCES employees(eid)
);

-- Temporarily disable foreign key checks to insert data
SET foreign_key_checks = 0;

-- Insert data into employees table
INSERT INTO employees VALUES (1, "Vikas", "Ahlawat", 600000, "2013-02-15", "IT", "M");
INSERT INTO employees VALUES (2, "Nikita", "Jain", 530000, "2014-01-09", "HR", "F");
INSERT INTO employees VALUES (3, "Ashish", "Kumar", 1000000, "2014-01-09", "IT", "M");
INSERT INTO employees VALUES (4, "Nikhil", "Sharma", 480000, "2014-01-09", "HR", "M");
INSERT INTO employees VALUES (5, "Anish", "Kadian", 500000, "2014-01-09", "Payroll", "M");

-- Insert data into project table
INSERT INTO project VALUES (1, 1, "Task Track");
INSERT INTO project VALUES (2, 1, "CLP");
INSERT INTO project VALUES (3, 1, "Survey Management");
INSERT INTO project VALUES (4, 2, "HR Management");
INSERT INTO project VALUES (5, 3, "Task Track");
INSERT INTO project VALUES (6, 3, "GRS");
INSERT INTO project VALUES (7, 3, "DDS");
INSERT INTO project VALUES (8, 4, "HR Management");
INSERT INTO project VALUES (9, 6, "GL Management");

-- Re-enable foreign key checks
SET foreign_key_checks = 1;

-- Perform an inner join to retrieve data where matches are found in both tables
SELECT e.fname, p.pname 
FROM employees AS e 
INNER JOIN project AS p 
ON e.eid = p.eid;

-- Perform an outer join to retrieve all records from both tables where matches exist or not
SELECT e.fname, p.pname 
FROM employees AS e 
LEFT OUTER JOIN project AS p 
ON e.eid = p.eid
UNION
SELECT e.fname, p.pname 
FROM employees AS e 
RIGHT OUTER JOIN project AS p 
ON e.eid = p.eid;

-- Perform a left outer join to retrieve all records from the employees table
SELECT e.fname, p.pname 
FROM employees AS e 
LEFT OUTER JOIN project AS p 
ON e.eid = p.eid;

-- Perform a right outer join to retrieve all records from the project table
SELECT e.fname, p.pname 
FROM employees AS e 
RIGHT OUTER JOIN project AS p 
ON e.eid = p.eid;
