#set page(margin: 1.5cm)
#set text(font: "New Computer Modern", size: 13pt)
#set par(justify: true)

#align(center)[
  #text(size: 18pt, weight: "bold")[DBMS LAB]
  #v(0.3em)
  #text(size: 14pt)[Lab Manual & Practical Questions]
  #v(0.5em)
]

#outline(indent: auto)

#pagebreak()

= Lab Session - 06/01/2026
== ADT Practical Question - Flights Database

=== Table Creation
```sql
CREATE TABLE flights (
    fno VARCHAR(255) PRIMARY KEY,
    `from` VARCHAR(255),
    `to` VARCHAR(255),
    fare INT,
    tax INT
);

CREATE TABLE pass (
    passno INT,
    passname VARCHAR(255),
    fno VARCHAR(255),
    PRIMARY KEY (passno),
    FOREIGN KEY(fno) REFERENCES flights(fno)
);
```

=== Data Insertion
```sql
INSERT INTO flights (fno, `from`, `to`, fare, tax) VALUES
('A101', 'COK', 'LON', 2000, 10),
('SIN02', 'MUM', 'SIN', 1500, 5),
('KE01', 'TUM', 'KN', 1200, 10),
('MY01', 'ICN', 'SIN', 1200, 10),
('IND02', 'SIN', 'MUM', 900, 5),
('IND03', 'NEW', 'COK', 1900, 10);

INSERT INTO pass (passno, passname, fno) VALUES
(111, 'XYZ', 'SIN02'),
(112, 'ABC', 'MY01'),
(113, 'ACD', 'IND02'),
(114, 'BCD', 'A101'),
(115, 'XIN', 'SIN02'),
(116, 'ABY', 'KE01');
```

=== Queries

*Query 1:*
```sql
SELECT f.fno, f.to 
FROM flights f 
JOIN pass p ON f.fno = p.fno;
```

*Query 2:*
```sql
SELECT * FROM flights 
ORDER BY fare DESC 
LIMIT 1;
```

*Query 3:*
```sql
SELECT fno, `to`, `from`, fare, tax, 
       (tax/100) AS tax_value, 
       (fare + (tax/100)*fare) AS net_fare 
FROM flights;
```

*Query 4:*
```sql
SELECT COUNT(*) AS total_passengers 
FROM pass p 
WHERE p.fno IN (SELECT fno FROM flights f WHERE f.to = 'SIN');
```

*Query 5:*
```sql
SELECT * FROM flights 
ORDER BY fare ASC 
LIMIT 1;
```

#pagebreak()

= Lab Session - 07/01/2026
== Lab Manual Question 1 - Client & Sales Database

=== Table Creation
```sql
CREATE TABLE client_master (
    client_no VARCHAR(6) PRIMARY KEY,
    name VARCHAR(20),
    city VARCHAR(15),
    pincode INT,
    bal_due DECIMAL(10,2)
);

CREATE TABLE sale_order (
    order_no VARCHAR(6) PRIMARY KEY,
    order_date DATE,
    client_no VARCHAR(6),
    order_status VARCHAR(15),
    dely_date DATE,
    FOREIGN KEY (client_no) REFERENCES client_master(client_no)
);
```

=== Data Insertion
```sql
INSERT INTO client_master (client_no, name, city, pincode, bal_due) VALUES 
('c00001', 'ivan bayross', 'mumbai', 400001, 0),
('c00002', 'mamta muzumdar', 'madras', 600001, 5000),
('c00003', 'chhaya bankar', 'mumbai', 400002, 0),
('c00004', 'ashwini joshi', 'bangalore', 560001, 2000),
('c00005', 'hansel colaco', 'mumbai', 400003, 1500);

INSERT INTO sale_order (order_no, order_date, client_no, order_status, dely_date) VALUES 
('o19001', '2025-01-10', 'c00001', 'in process', '2025-01-20'),
('o19002', '2025-01-12', 'c00002', 'completed', '2025-01-15'),
('o19003', '2025-01-15', 'c00003', 'in process', '2025-01-25');
```

=== Queries

*Query 1:*
```sql
SELECT * FROM client_master WHERE bal_due = 0;
```

*Query 2:*
```sql
UPDATE client_master SET city = "jaipur" WHERE client_no = 'c00004';
```

*Query 3:*
```sql
SELECT * FROM client_master WHERE city = 'mumbai';
```

*Query 4:*
```sql
SELECT c.name, c.city, c.pincode 
FROM client_master c 
JOIN sale_order s ON c.client_no = s.client_no 
WHERE s.order_no = 'o19003' OR s.order_no = 'o19002';
```

*Query 5:*
```sql
SELECT c.client_no, c.name, c.city, c.pincode 
FROM client_master c 
JOIN sale_order s ON c.client_no = s.client_no 
WHERE s.order_status = 'in process';
```

#pagebreak()

== Rough Record Program 1 - Bank Database

=== Table Creation
```sql
CREATE TABLE bank (
    acc_no INT PRIMARY KEY,
    acc_name VARCHAR(20),
    branch_name VARCHAR(20),
    acc_type VARCHAR(10),
    amount DECIMAL(10,2)
);
```

=== Data Insertion
```sql
INSERT INTO bank (acc_no, acc_name, branch_name, acc_type, amount) VALUES 
(101, 'rahul nair', 'kochi', 'savings', 7500.00),
(102, 'sneha das', 'kochi', 'current', 12000.00),
(103, 'arjun v', 'trivandrum', 'savings', 4500.00),
(104, 'priya p', 'palakkad', 'savings', 9000.00),
(105, 'jithin raj', 'thrissur', 'savings', 6000.00),
(106, 'meera k', 'thrissur', 'savings', 3000.00),
(107, 'anandhu s', 'mahe', 'current', 5000.00),
(108, 'leila khan', 'mahe', 'savings', 8000.00);
```

=== Queries

*Query 1:*
```sql
SELECT * FROM bank WHERE acc_type = 'savings';
```

*Query 2:*
```sql
UPDATE bank SET branch_name = 'thiruvananthapuram' 
WHERE branch_name = 'trivandrum';
```

*Query 3:*
```sql
SELECT * FROM bank 
WHERE branch_name IN ('thiruvananthapuram', 'kochi', 'palakkad');
```

*Query 4:*
```sql
SELECT * FROM bank 
WHERE branch_name = 'thrissur' AND amount > 5000;
```

*Query 5:*
```sql
DELETE FROM bank 
WHERE acc_type = 'current' AND branch_name = 'mahe';
```

#pagebreak()

= Lab Session - 13/01/2026
== Lab Manual Question 2 - Employee Database

=== Problem Statement
```sql
-- create a table employee with attributes employee_id, firstname, lastname, 
-- email, phone_number, hire_date, job_id, salary, manager_id, department_id
-- 1. insert five rows into the employee table
-- 2. change the phone number of employee whose employee_id is 3
-- 3. write a query to display the name (first_name and last_name) for those 
--    employees who gets more salary than the employee whose ID is 163
-- 4. write a query to display the name (first name and last name), salary, 
--    department_id, job_id, for those employees who works in the same 
--    designation as the employees works whose id is 169
```

=== Table Creation
```sql
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(255),
    email VARCHAR(255),
    phone_number CHAR(10),
    hire_date DATE,
    job_id INT,
    salary INT,
    manager_id INT,
    department_id INT
);
```

=== Solutions

*Question 1: Insert five rows into the employee table*
```sql
INSERT INTO employee (employee_id, firstname, lastname, email, phone_number, 
                      hire_date, job_id, salary, manager_id, department_id) VALUES
(1, 'Alice', 'Johnson', 'alice.j@example.com', '1234567890', '2023-01-15', 10, 85000, NULL, 1),
(2, 'Bob', 'Smith', 'bob.s@example.com', '2345678901', '2023-03-20', 11, 72000, 1, 1),
(3, 'Charlie', 'Davis', 'charlie.d@example.com', '3456789012', '2023-05-10', 12, 65000, 1, 2),
(163, 'David', 'Miller', 'david.m@example.com', '4567890123', '2022-11-05', 10, 70000, 1, 1),
(169, 'Eve', 'Wilson', 'eve.w@example.com', '5678901234', '2023-08-12', 12, 68000, 3, 2);
```

*Question 2: Change the phone number of employee whose employee_id is 3*
```sql
UPDATE employee SET phone_number = '0225502255' 
WHERE employee_id = 3;
```

*Question 3: Display the name (first_name and last_name) for those employees who gets more salary than the employee whose ID is 163*
```sql
SELECT CONCAT(firstname, ' ', lastname) AS NAME 
FROM employee 
WHERE salary > (SELECT salary FROM employee WHERE employee_id = 163);
```

*Output:*

#table(
  columns: 1,
  stroke: 0.5pt,
  [*NAME*],
  [Alice Johnson],
  [Bob Smith]
)

*Question 4: Display the name (first name and last name), salary, department_id, job_id, for those employees who works in the same designation as the employees works whose id is 169*
```sql
SELECT CONCAT(firstname, ' ', lastname) AS Name, salary, department_id, job_id 
FROM employee 
WHERE job_id = (SELECT job_id FROM employee WHERE employee_id = 169);
```

*Output:*

#table(
  columns: 4,
  stroke: 0.5pt,
  [*Name*], [*salary*], [*department_id*], [*job_id*],
  [Charlie Davis], [65000], [2], [12],
  [Eve Wilson], [68000], [2], [12]
)

#pagebreak()

== Rough Record Program 2 - Supplier, Parts & Shipment

=== Problem Statement
```sql
-- Create table supplier with attributes supplier number as primary key, 
-- supplier name and city
-- create a table parts with attributes partno as primary key, partname, 
-- color, weight and city
-- create a table shipment with attributes sno as references supplier number 
-- of supplier table, pno references partnumber of parts table, quantity, 
-- sno and pno as primary key

-- insert values into three tables

-- 1. Change the city of suppliers whose sno is S1 to Hyderabad
-- 2. Update the quantity of all parts in the shipment table to quantity+10
-- 3. Get supplier name for all supplier who supply part p1
-- 4. Get supplier number for supplier who are located in the same city as sno=S1
-- 5. Get supplier number for suppliers who supply at least one part supplied by sno=S2
-- 6. Get Sno's for suppliers who do not supply any part supplied by sno=S2
```

=== Table Creation
```sql
CREATE TABLE supplier (
    supplier_number VARCHAR(10),
    supplier_name VARCHAR(255),
    city VARCHAR(50),
    PRIMARY KEY (supplier_number)
);

CREATE TABLE parts (
    partno VARCHAR(10),
    partname VARCHAR(255),
    color VARCHAR(50),
    weight VARCHAR(10),
    city VARCHAR(50),
    PRIMARY KEY (partno)
);

CREATE TABLE shipment (
    sno VARCHAR(10),
    pno VARCHAR(10),
    quantity INT,
    FOREIGN KEY (pno) REFERENCES parts(partno),
    FOREIGN KEY (sno) REFERENCES supplier(supplier_number),
    PRIMARY KEY (sno, pno)
);
```

=== Data Insertion

*Populating the Supplier Table*
```sql
INSERT INTO supplier (supplier_number, supplier_name, city) VALUES
('S1', 'Global Tech', 'Delhi'),
('S2', 'Alpha Corp', 'Mumbai'),
('S3', 'Zenith Ltd', 'Chennai'),
('S4', 'Nexus Indus', 'Delhi'),
('S5', 'Pioneer Inc', 'Bangalore');
```

*Populating the Parts Table*
```sql
INSERT INTO parts (partno, partname, color, weight, city) VALUES
('P1', 'Nut', 'Red', '12', 'Delhi'),
('P2', 'Bolt', 'Green', '17', 'Mumbai'),
('P3', 'Screw', 'Blue', '14', 'Chennai'),
('P4', 'Cam', 'Red', '12', 'Delhi'),
('P5', 'Gear', 'Black', '25', 'Bangalore');
```

*Populating the Shipment Table*
```sql
INSERT INTO shipment (sno, pno, quantity) VALUES
('S1', 'P1', 300),
('S1', 'P2', 200),
('S2', 'P1', 300),
('S2', 'P4', 400),
('S3', 'P2', 200),
('S4', 'P2', 200),
('S4', 'P4', 300),
('S5', 'P5', 400);
```

=== Solutions

*Question 1: Change the city of suppliers whose sno is S1 to Hyderabad*
```sql
UPDATE supplier SET city = 'hyderabad' 
WHERE supplier_number = 'S1';
```

*Output:*
```
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

*Question 2: Update the quantity of all parts in the shipment table to quantity+10*
```sql
UPDATE shipment SET quantity = quantity + 10;
```

*Output:*
```
Query OK, 8 rows affected (0.11 sec)
Rows matched: 8  Changed: 8  Warnings: 0
```

*Question 3: Get supplier name for all supplier who supply part p1*
```sql
SELECT supplier_name 
FROM supplier s 
JOIN shipment shpmt ON s.supplier_number = shpmt.sno 
WHERE shpmt.pno = 'P1';
```

*Output:*

#table(
  columns: 1,
  stroke: 0.5pt,
  [*supplier_name*],
  [Global Tech],
  [Alpha Corp]
)

*Question 4: Get supplier number for supplier who are located in the same city as sno=S1*
```sql
SELECT supplier_number 
FROM supplier 
WHERE city = (SELECT city FROM supplier WHERE supplier_number = 'S2');
```

*Output:*

#table(
  columns: 1,
  stroke: 0.5pt,
  [*supplier_number*],
  [S2]
)

*Question 5: Get supplier number for suppliers who supply at least one part supplied by sno=S2*
```sql
SELECT DISTINCT sno 
FROM shipment 
WHERE pno IN (SELECT pno FROM shipment WHERE sno = 'S2') 
AND sno <> 'S2';
```

*Output:*

#table(
  columns: 1,
  stroke: 0.5pt,
  [*sno*],
  [S1],
  [S4]
)

*Question 6: Get Sno's for suppliers who do not supply any part supplied by sno=S2*
```sql
SELECT supplier_number 
FROM supplier 
WHERE supplier_number NOT IN (
    SELECT DISTINCT sno FROM shipment
    WHERE pno IN (SELECT pno FROM shipment WHERE sno = 'S2')
);
```

*Output:*

#table(
  columns: 1,
  stroke: 0.5pt,
  [*supplier_number*],
  [S3],
  [S5]
)

#pagebreak()

= Lab Session - 14/01/2026
== Lab Manual Question 3 - Views

=== Problem Statement
```sql
-- 1. Create a view of the table supplier with Supplier Number, Supplier Name and City
-- 2. Display the View
-- 3. Update the value of supplier name on view
-- 4. Display the supplier table
-- 5. Drop the view
```

=== Solutions

*Question 1: Create a view of the table supplier with Supplier Number, Supplier Name and City*
```sql
CREATE VIEW supplier_view AS (SELECT * FROM supplier);
```

*Question 2: Display the View*
```sql
SELECT * FROM supplier_view;
```

*Output:*

#table(
  columns: 3,
  stroke: 0.5pt,
  [*supplier_number*], [*supplier_name*], [*city*],
  [S1], [Alpha Corp], [hyderabad],
  [S2], [Alpha Corp], [Mumbai],
  [S3], [Zenith Ltd], [Chennai],
  [S4], [Nexus Indus], [Delhi],
  [S5], [Pioneer Inc], [Bangalore]
)

*Question 3: Update the value of supplier name on view*
```sql
UPDATE supplier_view SET supplier_name = "Alpha Corp" 
WHERE city = 'Hyderabad';
```

*Question 4: Display the supplier table*
```sql
SELECT * FROM supplier;
```

*Output:*

#table(
  columns: 3,
  stroke: 0.5pt,
  [*supplier_number*], [*supplier_name*], [*city*],
  [S1], [Alpha Corp], [hyderabad],
  [S2], [Alpha Corp], [Mumbai],
  [S3], [Zenith Ltd], [Chennai],
  [S4], [Nexus Indus], [Delhi],
  [S5], [Pioneer Inc], [Bangalore]
)

*Question 5: Drop the view*
```sql
DROP VIEW supplier_view;
```

*Output:*
```
Query OK, 0 rows affected (0.19 sec)
```

#pagebreak()

== Lab Manual Question 4 - Indexes & Auto Increment

=== Problem Statement
```sql
-- 1. Create a table employee with attributes employee number, name, designation, 
--    salary, date of birth, date of joining, depno
-- 2. Insert values into table employee
-- 3. Create an index on name of employee table
-- 4. Select the details from the table using name
-- 5. Drop the index
-- 6. Delete all rows from employee table
-- 7. Create a sequence on employee number of employee table
-- 8. Insert value into employee table
-- 9. Display the details of employee table
```

=== Solutions

*Question 1: Create a table employee with attributes employee number, name, designation, salary, date of birth, date of joining, depno*
```sql
CREATE TABLE employee2 (
    employee_no VARCHAR(10),
    name VARCHAR(100),
    designation VARCHAR(100),
    salary INT,
    dob DATE,
    doj DATE,
    depno VARCHAR(10),
    PRIMARY KEY(employee_no)
);
```

*Output:*
```
Query OK, 0 rows affected (0.63 sec)
```

*Question 2: Insert values into table employee*
```sql
INSERT INTO employee2 (employee_no, name, designation, salary, dob, doj, depno) VALUES
('E101', 'James Miller', 'Software Engineer', 72000, '1992-04-15', '2020-01-10', 'D10'),
('E102', 'Sophia Lopez', 'UX Designer', 68000, '1995-09-22', '2021-05-18', 'D20'),
('E103', 'Robert Brown', 'Systems Admin', 65000, '1989-12-02', '2018-11-30', 'D10'),
('E104', 'Linda Zhao', 'Product Manager', 95000, '1985-06-14', '2016-03-25', 'D30');
```

*Output:*
```
Query OK, 4 rows affected (0.11 sec)
Records: 4  Duplicates: 0  Warnings: 0
```

*Question 3: Create an index on name of employee table*
```sql
CREATE INDEX emp_name_idx ON employee2(name);
```

*Output:*
```
Query OK, 0 rows affected (0.89 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

*Question 4: Select the details from the table using name*
```sql
SELECT * FROM employee2 WHERE name LIKE 'S%';
```

*Output:*

#table(
  columns: 7,
  stroke: 0.5pt,
  [*employee_no*], [*name*], [*designation*], [*salary*], [*dob*], [*doj*], [*depno*],
  [E102], [Sophia Lopez], [UX Designer], [68000], [1995-09-22], [2021-05-18], [D20]
)

*Question 5: Drop the index*
```sql
DROP INDEX emp_name_idx ON employee2;
```

*Output:*
```
Query OK, 0 rows affected (0.44 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

*Question 6: Delete all rows from employee table*
```sql
DELETE FROM employee2;
```

*Output:*
```
Query OK, 4 rows affected (0.10 sec)
```

*Question 7: Create a sequence on employee number of employee table*
```sql
ALTER TABLE employee2 MODIFY COLUMN employee_no INT AUTO_INCREMENT = 100;
ALTER TABLE employee2 AUTO_INCREMENT = 100;
```

*Output:*
```
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

*Question 8: Insert value into employee table*
```sql
INSERT INTO employee2 (name, designation, salary, dob, doj, depno) VALUES
('Rahul Sharma', 'Software Engineer', 65000, '1995-05-15', '2022-01-10', 'D10'),
('Priya Nair', 'Data Analyst', 58000, '1997-08-22', '2021-11-05', 'D20'),
('Amit Verma', 'Project Manager', 95000, '1988-12-02', '2019-03-15', 'D10'),
('Sneha Patel', 'HR Specialist', 52000, '1993-02-28', '2023-06-01', 'D30'),
('Vikram Singh', 'UI/UX Designer', 60000, '1996-10-10', '2022-08-12', 'D20');
```

*Output:*
```
Query OK, 5 rows affected (0.12 sec)
Records: 5  Duplicates: 0  Warnings: 0
```

*Question 9: Display the details of employee table*
```sql
SELECT * FROM employee2;
```

*Output:*

#table(
  columns: 7,
  stroke: 0.5pt,
  [*employee_no*], [*name*], [*designation*], [*salary*], [*dob*], [*doj*], [*depno*],
  [100], [Rahul Sharma], [Software Engineer], [65000], [1995-05-15], [2022-01-10], [D10],
  [101], [Priya Nair], [Data Analyst], [58000], [1997-08-22], [2021-11-05], [D20],
  [102], [Amit Verma], [Project Manager], [95000], [1988-12-02], [2019-03-15], [D10],
  [103], [Sneha Patel], [HR Specialist], [52000], [1993-02-28], [2023-06-01], [D30],
  [104], [Vikram Singh], [UI/UX Designer], [60000], [1996-10-10], [2022-08-12], [D20]
)

#pagebreak()

== Lab Manual Question 5
*Note:* Lab V question already done as rough record refer rough record program 2

#pagebreak()

== Lab Manual Question 6 - Product & Vendor Database

=== Problem Statement
```sql
-- Consider the following relations
-- Product (P_code, Description, Stocking_date, QtyOnHand, MinQty, Prices, Discount, V_code)
-- Vendor (V_code, Name, Address, Phone)

-- Here a vendor can supply more than one product but a product is supplied by 
-- only one vendor (NOTE: Identify the primary keys and foreign key from this statement)

-- Write Sql queries for the following:
-- 1. List the name of all the vendors who supply more than one product
-- 2. List the details of the products whose prices exceed the average product price.
-- 3. List the Name, Address and Phone of the vendors who are currently not supplying any product
```

=== Table Creation
```sql
CREATE TABLE vendor (
    v_code VARCHAR(10),
    name VARCHAR(100),
    address VARCHAR(255),
    phone CHAR(10),
    PRIMARY KEY (v_code),
    CONSTRAINT chk_phone CHECK (phone REGEXP '^[0-9]{10}$')
);

CREATE TABLE product (
    p_no VARCHAR(10),
    description VARCHAR(255),
    stocking_date DATE,
    qty_on_hand INT,
    min_qty INT,
    prices INT,
    discount INT,
    v_code VARCHAR(10),
    PRIMARY KEY(p_no),
    FOREIGN KEY (v_code) REFERENCES vendor(v_code)
);
```

=== Data Insertion
```sql
INSERT INTO vendor (v_code, name, address, phone) VALUES 
('V001', 'TechLogistics', '123 Industrial Way, NY', '9876543210'),
('V002', 'Global Parts', '456 Supply Road, CA', '8123456789'),
('V003', 'Prime Goods', '789 Market St, TX', '7012345678'),
('V004', 'Static Supply', '101 Inactive Ave, FL', '6543210987');
```

*Output:*
```
Query OK, 4 rows affected (0.14 sec)
Records: 4  Duplicates: 0  Warnings: 0
```

```sql
INSERT INTO product (p_no, description, stocking_date, qty_on_hand, min_qty, prices, discount, v_code) VALUES 
('P101', 'Wireless Mouse', '2023-10-01', 50, 10, 25, 5, 'V001'),
('P102', 'Mechanical Keyboard', '2023-11-15', 30, 5, 80, 10, 'V001'),
('P103', 'HD Monitor', '2024-01-10', 15, 2, 200, 15, 'V002'),
('P104', 'USB-C Cable', '2024-02-01', 100, 20, 15, 0, 'V003');
```

*Output:*
```
Query OK, 4 rows affected (0.09 sec)
Records: 4  Duplicates: 0  Warnings: 0
```

=== Solutions

*Question 1: List the name of all the vendors who supply more than one product*
```sql
SELECT v.name 
FROM vendor v 
JOIN product p ON v.v_code = p.v_code 
GROUP BY v.v_code 
HAVING COUNT(p.p_no) > 1;
```

*Output:*

#table(
  columns: 1,
  stroke: 0.5pt,
  [*name*],
  [TechLogistics]
)

```
1 row in set (0.00 sec)
```

*Question 2: List the details of the products whose prices exceed the average product price*
```sql
SELECT * FROM product 
WHERE prices > (SELECT AVG(prices) FROM product);
```

*Output:*

#table(
  columns: 8,
  stroke: 0.5pt,
  [*p_no*], [*description*], [*stocking_date*], [*qty_on_hand*], [*min_qty*], [*prices*], [*discount*], [*v_code*],
  [P103], [HD Monitor], [2024-01-10], [15], [2], [200], [15], [V002]
)

*Question 3: List the Name, Address and Phone of the vendors who are currently not supplying any product*
```sql
SELECT name, address, phone 
FROM vendor 
WHERE v_code NOT IN (SELECT v_code FROM product);
```
#pagebreak()
*Output:*

#table(
  columns: 3,
  stroke: 0.5pt,
  [*name*], [*address*], [*phone*],
  [Static Supply], [101 Inactive Ave, FL], [6543210987]
)

```
1 row in set (0.00 sec)
```
