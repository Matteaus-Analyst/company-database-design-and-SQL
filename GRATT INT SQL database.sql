-- 1. CREATE THE COMPANY DATABASE
CREATE DATABASE GRATT_INT;
USE GRATT_INT;

-- CREATE EMPLOYEE TABLE
CREATE TABLE employee_table(
emp_id INT PRIMARY KEY,
name VARCHAR(30),
sex VARCHAR(10),
birth_date DATE,
salary VARCHAR(20),
super_id INT,
branch_id INT
);
 -- 2. CREATE A BRANCH TABLE
 CREATE TABLE branch_table(
 branch_id INT PRIMARY KEY,
 branch_name VARCHAR(30),
 mgr_start_date DATE,
 mgr_id int,
 FOREIGN KEY (mgr_id) REFERENCES employee_table(emp_id) ON DELETE SET NULL
 );
 -- Add foreign keys to employee_table
ALTER TABLE employee_table
ADD FOREIGN KEY(super_id)
REFERENCES employee_table(emp_id)
ON DELETE SET NULL;

ALTER TABLE employee_table
ADD FOREIGN KEY(branch_id)
REFERENCES branch_table(branch_id)
ON DELETE SET NULL;

-- create client_table
CREATE TABLE client_table(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY (branch_id)REFERENCES branch_table(branch_id) ON DELETE SET NULL
);

-- supplier_table
CREATE TABLE supplier_table(
supplier_name VARCHAR(40),
product_type VARCHAR(40),
branch_id INT,
PRIMARY KEY(supplier_name,branch_id),
FOREIGN KEY(branch_id) REFERENCES branch_table(branch_id) ON DELETE CASCADE
);

-- create works_with_table
CREATE TABLE work_with_table(
client_id INT,
emp_id INT,
sales INT,
PRIMARY KEY(client_id,emp_id),
FOREIGN KEY(client_id) REFERENCES client_table(client_id) ON DELETE CASCADE,
FOREIGN KEY(emp_id) REFERENCES employee_table(emp_id) ON DELETE CASCADE
);

-- how to see our tables
-- to view specific table enter specific TABLE name 
-- SELECT * FROM ________;
-- e.g
SELECT * FROM employee_table; 
