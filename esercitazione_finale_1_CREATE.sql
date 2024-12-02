CREATE DATABASE  IF NOT EXISTS CambiaNome;
USE CambiaNome;

CREATE TABLE `country` (
  `CountryID` varchar(2) NOT NULL,
  `CountryName` tinytext,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `NameCustomer` VARCHAR(16),
  `SurnameCustomer` VARCHAR(16),
  `CountryID` VARCHAR(2),
  `Sex` VARCHAR(1),
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `ProdName` VARCHAR(30),
  `Category` VARCHAR(20),
  `Price` double(5,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sales` (
  `SaleID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `CountryID` varchar(2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` double(5,2) DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `ProductID` (`ProductID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CountryID` (`CountryID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;