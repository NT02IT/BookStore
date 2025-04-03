CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

CREATE TABLE `DatabaseEntity` (
  `entityID` int PRIMARY KEY AUTO_INCREMENT,
  `entityName` varchar(255) NOT NULL,
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `Permission` (
  `permissionID` int PRIMARY KEY AUTO_INCREMENT,
  `entityID` int NOT NULL,
  `canCreate` bool DEFAULT false,
  `canRead` bool DEFAULT false,
  `canUpdate` bool DEFAULT false,
  `canDelete` bool DEFAULT false,
  `isRestrictedToOwnData` bool DEFAULT false
);

CREATE TABLE `Role` (
  `roleID` int PRIMARY KEY AUTO_INCREMENT,
  `roleName` varchar(255) NOT NULL UNIQUE,
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `Role_Permission` (
  `roleID` int NOT NULL,
  `permissionID` int NOT NULL,
  PRIMARY KEY (`roleID`, `permissionID`)
);

CREATE TABLE `AdminProfile` (
  `adminProfileID` int PRIMARY KEY AUTO_INCREMENT,
  `prfName` varchar(255) NOT NULL,
  `gender` int,
  `dob` date,
  `cccd` varchar(20) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatarURL` varchar(255),
  `prfAddress` varchar(255),
  `salary` dec(10,2),
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `AdminAccount` (
  `adminAccountID` int PRIMARY KEY AUTO_INCREMENT,
  `adminProfileID` int NOT NULL,
  `roleID` int NOT NULL,
  `username` varchar(255) UNIQUE NOT NULL,
  `password` BINARY(60) NOT NULL,
  `createdAt` datetime DEFAULT (now()),
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `EnduserAccount` (
  `enduserAccountID` int PRIMARY KEY AUTO_INCREMENT,
  `prfName` varchar(255) NOT NULL,
  `gender` int,
  `dob` date,
  `phoneNumber` varchar(15) UNIQUE,
  `email` varchar(255) UNIQUE,
  `avatarURL` varchar(255),
  `defaultAddress` varchar(255),
  `password` BINARY(60) NOT NULL,
  `createdAt` datetime DEFAULT (now()),
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `Notification` (
  `notificationID` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `createdAt` datetime DEFAULT (now())
);

CREATE TABLE `Admin_Notification` (
  `adminAccountID` int NOT NULL,
  `notificationID` int NOT NULL,
  `readAt` datetime DEFAULT null,
  PRIMARY KEY (`adminAccountID`, `notificationID`)
);

CREATE TABLE `Enduser_Notification` (
  `enduserAccountID` int NOT NULL,
  `notificationID` int NOT NULL,
  `readAt` datetime DEFAULT null,
  PRIMARY KEY (`enduserAccountID`, `notificationID`)
);

CREATE TABLE `DeliveryInfo` (
  `deliveryInfoID` int PRIMARY KEY AUTO_INCREMENT,
  `enduserAccountID` int NOT NULL,
  `prfName` varchar(255),
  `prfAddress` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `createdAt` datetime DEFAULT (now()),
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `BookCategory` (
  `categoryID` int PRIMARY KEY AUTO_INCREMENT,
  `categoryName` varchar(255) UNIQUE NOT NULL,
  `createdAt` datetime DEFAULT (now()),
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `BookAuthor` (
  `authorID` int PRIMARY KEY AUTO_INCREMENT,
  `authorName` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `BookPublisher` (
  `publisherID` int PRIMARY KEY AUTO_INCREMENT,
  `publisherName` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `BookInfo` (
  `bookID` int PRIMARY KEY AUTO_INCREMENT,
  `ISBN` varchar(13) UNIQUE,
  `bookTitle` varchar(255) UNIQUE NOT NULL,
  `imageURL` varchar(255),
  `ebookURL` varchar(255),
  `bookDesc` text,
  `createdAt` datetime DEFAULT (now()),
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `BookInfo_Category` (
  `bookID` int NOT NULL,
  `categoryID` int NOT NULL,
  PRIMARY KEY (`bookID`, `categoryID`)
);

CREATE TABLE `BookInfo_Author` (
  `bookID` int NOT NULL,
  `authorID` int NOT NULL,
  PRIMARY KEY (`bookID`, `authorID`)
);

CREATE TABLE `BookInfo_Publisher` (
  `bookInfoPublisherID` int PRIMARY KEY AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `publisherID` int NOT NULL,
  `yearOfPublication` int
);

CREATE TABLE `Supplier` (
  `supplierID` int PRIMARY KEY AUTO_INCREMENT,
  `supplierName` varchar(255) UNIQUE NOT NULL,
  `supplierAddress` varchar(255),
  `phoneNumber` varchar(15) UNIQUE NOT NULL,
  `email` varchar(255) UNIQUE,
  `deletedAt` datetime DEFAULT null
);

CREATE TABLE `Supplier_Book` (
  `supplierID` int NOT NULL,
  `bookID` int NOT NULL,
  PRIMARY KEY (`supplierID`, `bookID`)
);

CREATE TABLE `BookInWarehouse` (
  `bookInWarehouseID` int PRIMARY KEY AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `warehouseImportID` int NOT NULL,
  `stock` int NOT NULL DEFAULT 0 COMMENT 'Số lượng tồn kho'
);

CREATE TABLE `WarehouseImport` (
  `warehouseImportID` int PRIMARY KEY AUTO_INCREMENT,
  `supplierID` int NOT NULL,
  `adminAccountID` int NOT NULL,
  `importDatetime` datetime DEFAULT (now())
);

CREATE TABLE `WarehouseImportDetails` (
  `warehouseImportID` int NOT NULL,
  `bookID` int NOT NULL,
  `quantity` int NOT NULL,
  `importPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`warehouseImportID`, `bookID`)
);

CREATE TABLE `WarehouseExport` (
  `warehouseExportID` int PRIMARY KEY AUTO_INCREMENT,
  `adminExport` int NOT NULL COMMENT 'Nv kho - xuất hàng',
  `adminReceive` int NOT NULL COMMENT 'Nv nhận hàng đưa lên cửa hàng',
  `exportDatetime` datetime DEFAULT (now())
);

CREATE TABLE `WarehouseExportDetails` (
  `warehouseExportID` int NOT NULL,
  `bookInWarehouseID` int NOT NULL,
  `quantity` int,
  PRIMARY KEY (`warehouseExportID`, `bookInWarehouseID`)
);

CREATE TABLE `ExportRequestTicket` (
  `exportRequestTicketID` int PRIMARY KEY AUTO_INCREMENT,
  `adminAccountID` int NOT NULL,
  `requestDatetime` datetime DEFAULT (now()),
  `ticketStatus` int DEFAULT 1
);

CREATE TABLE `ExportRequestTicketDetails` (
  `exportRequestTicketID` int NOT NULL,
  `bookID` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`exportRequestTicketID`, `bookID`)
);

CREATE TABLE `BookOnStore` (
  `bookOnStoreID` int PRIMARY KEY AUTO_INCREMENT,
  `bookInWarehouseID` int NOT NULL,
  `sellingPrice` dec(15,2) NOT NULL,
  `stock` int NOT NULL
);

CREATE TABLE `BookRating` (
  `bookRatingID` int PRIMARY KEY AUTO_INCREMENT,
  `enduserAccountID` int NOT NULL,
  `bookOnStoreID` int,
  `rate` int NOT NULL,
  `comment` text,
  `createdAt` datetime DEFAULT (now())
);

CREATE TABLE `CartDetails` (
  `enduserAccountID` int NOT NULL,
  `bookOnStoreID` int,
  `quantity` int DEFAULT 1,
  `dateAdd` datetime DEFAULT (now()),
  PRIMARY KEY (`enduserAccountID`, `bookOnStoreID`)
);

CREATE TABLE `Order` (
  `orderID` int PRIMARY KEY AUTO_INCREMENT,
  `deliveryinfoID` int NOT NULL,
  `orderDatetime` datetime DEFAULT (now()),
  `paid` bool NOT NULL,
  `orderStatus` int DEFAULT 1
);

CREATE TABLE `OrderDetails` (
  `orderDetailsID` int PRIMARY KEY AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `bookOnStoreID` int,
  `quantity` int DEFAULT 1,
  `purchasePrice` int NOT NULL
);

CREATE INDEX `Admin_Notification_index_0` ON `Admin_Notification` (`readAt`, `adminAccountID`);

CREATE INDEX `Enduser_Notification_index_1` ON `Enduser_Notification` (`readAt`, `enduserAccountID`);

CREATE INDEX `BookInfo_Category_index_2` ON `BookInfo_Category` (`categoryID`, `bookID`);

CREATE INDEX `BookInfo_Author_index_3` ON `BookInfo_Author` (`authorID`, `bookID`);

CREATE INDEX `BookInfo_Publisher_index_4` ON `BookInfo_Publisher` (`publisherID`, `bookID`);

ALTER TABLE `Permission` ADD FOREIGN KEY (`entityID`) REFERENCES `DatabaseEntity` (`entityID`);

ALTER TABLE `Role_Permission` ADD FOREIGN KEY (`roleID`) REFERENCES `Role` (`roleID`);

ALTER TABLE `Role_Permission` ADD FOREIGN KEY (`permissionID`) REFERENCES `Permission` (`permissionID`);

ALTER TABLE `AdminAccount` ADD FOREIGN KEY (`adminProfileID`) REFERENCES `AdminProfile` (`adminProfileID`);

ALTER TABLE `AdminAccount` ADD FOREIGN KEY (`roleID`) REFERENCES `Role` (`roleID`);

ALTER TABLE `Admin_Notification` ADD FOREIGN KEY (`adminAccountID`) REFERENCES `AdminAccount` (`adminAccountID`);

ALTER TABLE `Admin_Notification` ADD FOREIGN KEY (`notificationID`) REFERENCES `Notification` (`notificationID`);

ALTER TABLE `Enduser_Notification` ADD FOREIGN KEY (`enduserAccountID`) REFERENCES `EnduserAccount` (`enduserAccountID`);

ALTER TABLE `Enduser_Notification` ADD FOREIGN KEY (`notificationID`) REFERENCES `Notification` (`notificationID`);

ALTER TABLE `DeliveryInfo` ADD FOREIGN KEY (`enduserAccountID`) REFERENCES `EnduserAccount` (`enduserAccountID`);

ALTER TABLE `BookInfo_Category` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `BookInfo_Category` ADD FOREIGN KEY (`categoryID`) REFERENCES `BookCategory` (`categoryID`);

ALTER TABLE `BookInfo_Author` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `BookInfo_Author` ADD FOREIGN KEY (`authorID`) REFERENCES `BookAuthor` (`authorID`);

ALTER TABLE `BookInfo_Publisher` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `BookInfo_Publisher` ADD FOREIGN KEY (`publisherID`) REFERENCES `BookPublisher` (`publisherID`);

ALTER TABLE `Supplier_Book` ADD FOREIGN KEY (`supplierID`) REFERENCES `Supplier` (`supplierID`);

ALTER TABLE `Supplier_Book` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `BookInWarehouse` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `BookInWarehouse` ADD FOREIGN KEY (`warehouseImportID`) REFERENCES `WarehouseImport` (`warehouseImportID`);

ALTER TABLE `WarehouseImport` ADD FOREIGN KEY (`supplierID`) REFERENCES `Supplier` (`supplierID`);

ALTER TABLE `WarehouseImport` ADD FOREIGN KEY (`adminAccountID`) REFERENCES `AdminAccount` (`adminAccountID`);

ALTER TABLE `WarehouseImportDetails` ADD FOREIGN KEY (`warehouseImportID`) REFERENCES `WarehouseImport` (`warehouseImportID`);

ALTER TABLE `WarehouseImportDetails` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `WarehouseExport` ADD FOREIGN KEY (`adminExport`) REFERENCES `AdminAccount` (`adminAccountID`);

ALTER TABLE `WarehouseExport` ADD FOREIGN KEY (`adminReceive`) REFERENCES `AdminAccount` (`adminAccountID`);

ALTER TABLE `WarehouseExportDetails` ADD FOREIGN KEY (`warehouseExportID`) REFERENCES `WarehouseExport` (`warehouseExportID`);

ALTER TABLE `WarehouseExportDetails` ADD FOREIGN KEY (`bookInWarehouseID`) REFERENCES `BookInWarehouse` (`bookInWarehouseID`);

ALTER TABLE `ExportRequestTicket` ADD FOREIGN KEY (`adminAccountID`) REFERENCES `AdminAccount` (`adminAccountID`);

ALTER TABLE `ExportRequestTicketDetails` ADD FOREIGN KEY (`exportRequestTicketID`) REFERENCES `ExportRequestTicket` (`exportRequestTicketID`);

ALTER TABLE `ExportRequestTicketDetails` ADD FOREIGN KEY (`bookID`) REFERENCES `BookInfo` (`bookID`);

ALTER TABLE `BookOnStore` ADD FOREIGN KEY (`bookInWarehouseID`) REFERENCES `BookInWarehouse` (`bookInWarehouseID`);

ALTER TABLE `BookRating` ADD FOREIGN KEY (`enduserAccountID`) REFERENCES `EnduserAccount` (`enduserAccountID`);

ALTER TABLE `BookRating` ADD FOREIGN KEY (`bookOnStoreID`) REFERENCES `BookOnStore` (`bookOnStoreID`);

ALTER TABLE `CartDetails` ADD FOREIGN KEY (`enduserAccountID`) REFERENCES `EnduserAccount` (`enduserAccountID`);

ALTER TABLE `CartDetails` ADD FOREIGN KEY (`bookOnStoreID`) REFERENCES `BookOnStore` (`bookOnStoreID`);

ALTER TABLE `Order` ADD FOREIGN KEY (`deliveryinfoID`) REFERENCES `DeliveryInfo` (`deliveryInfoID`);

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`orderID`) REFERENCES `Order` (`orderID`);

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`bookOnStoreID`) REFERENCES `BookOnStore` (`bookOnStoreID`);
