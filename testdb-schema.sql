-- Test db to practice connecting to mysql with python

DROP SCHEMA IF EXISTS testdb;
CREATE SCHEMA testdb character set utf8;
-- CREATE SCHEMA testdb;
USE testdb;

--
-- Table structure for table employee
--

CREATE TABLE employee (
  employee_id int auto_increment not null,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20),
  age INT,
  sex varchar(1),
  income float,  
  primary key (employee_id),
  unique (first_name, last_name, age)
  
);

##create a user
# DROP USER IF EXISTS 'testuser'@'localhost';
# CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test123';
GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';