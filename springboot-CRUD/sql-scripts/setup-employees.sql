DROP DATABASE IF EXISTS `my_employee_directory`;

CREATE DATABASE IF NOT EXISTS `my_employee_directory`;
USE `my_employee_directory`;

--
-- Table for employees
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL,
    primary key (`id`)
) Engine=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- 
-- Load data
--
INSERT INTO `employee` 
VALUES
(1, 'Alex', 'Adams', 'alex@gmail.com'),
(2, 'Lisa', 'Tran', 'lisa@gmail.com'),
(3, 'Elizabeth', 'Kim', 'jennie@gmail.com'),
(4, 'Leo', 'Chen', 'leo@gmai.com'),
(5, 'Matthew', 'Karr', 'matthew@gmai.com')





