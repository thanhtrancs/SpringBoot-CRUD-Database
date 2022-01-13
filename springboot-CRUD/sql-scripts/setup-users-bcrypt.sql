DROP DATABASE  IF EXISTS `springboot_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `springboot_bcrypt`;
USE `springboot_bcrypt`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Default passwords are: password
--

INSERT INTO `users` 
VALUES 
('jennie','{bcrypt}$2a$12$g/8VAa2O2ihRUxWe6M4FwuYyPoSr9PrAS8vaq9BTu3m3yjv5fx1N6',1),
('lisa','{bcrypt}$2a$12$g/8VAa2O2ihRUxWe6M4FwuYyPoSr9PrAS8vaq9BTu3m3yjv5fx1N6',1),
('rose','{bcrypt}$2a$12$g/8VAa2O2ihRUxWe6M4FwuYyPoSr9PrAS8vaq9BTu3m3yjv5fx1N6',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('jennie','ROLE_EMPLOYEE'),
('lisa','ROLE_EMPLOYEE'),
('lisa','ROLE_MANAGER'),
('rose','ROLE_EMPLOYEE'),
('rose','ROLE_ADMIN');


