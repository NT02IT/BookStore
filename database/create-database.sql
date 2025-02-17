CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- Tạo bảng DatabaseEntity
CREATE TABLE DatabaseEntity (
    entityID INT AUTO_INCREMENT PRIMARY KEY,
    entityName VARCHAR(255) NOT NULL,
    isDelete BOOLEAN DEFAULT FALSE
);

-- Tạo bảng Role
CREATE TABLE Role (
    roleID INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    isDelete BOOLEAN DEFAULT FALSE
);

-- Tạo bảng Permission
CREATE TABLE Permission (
    permissionID INT AUTO_INCREMENT PRIMARY KEY,
    entityID INT NOT NULL,
    canCreate BOOLEAN DEFAULT FALSE,
    canRead BOOLEAN DEFAULT FALSE,
    canUpdate BOOLEAN DEFAULT FALSE,
    canDelete BOOLEAN DEFAULT FALSE,
    isRestrictedToOwnData BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (entityID) REFERENCES DatabaseEntity(entityID)
);

-- Tạo bảng Role_Permission
CREATE TABLE Role_Permission (
    rolePermissionID INT AUTO_INCREMENT PRIMARY KEY,
    roleID INT NOT NULL,
    permissionID INT NOT NULL,
    FOREIGN KEY (roleID) REFERENCES Role(roleID),
    FOREIGN KEY (permissionID) REFERENCES Permission(permissionID)
);

-- Tạo bảng AdminProfile
CREATE TABLE AdminProfile (
    adminProfileID INT AUTO_INCREMENT PRIMARY KEY,    
    prfName VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    gender INT,
    dob DATE,
    CCCD VARCHAR(20) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    avatarURL VARCHAR(255),
    prfAddress VARCHAR(255) CHARACTER SET utf8mb4,
    salary DECIMAL(10, 2) NOT NULL,
    isDelete BOOLEAN DEFAULT FALSE    
);

-- Tạo bảng AdminAccount
CREATE TABLE AdminAccount (
    adminAccountID INT AUTO_INCREMENT PRIMARY KEY,
    roleID INT NOT NULL,
    username VARCHAR(255) NOT NULL,
    pwd VARCHAR(255) NOT NULL,
    adminProfileID INT NOT NULL,
    dateCreated DATETIME DEFAULT NOW(),
    isDelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (adminProfileID) REFERENCES AdminProfile(adminProfileID),
    FOREIGN KEY (roleID) REFERENCES Role(roleID)
);

-- Tạo bảng Notification
CREATE TABLE Notification (
    notificationID INT AUTO_INCREMENT PRIMARY KEY,
    adminAccountID INT NOT NULL,
    title VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    content TEXT CHARACTER SET utf8mb4 NOT NULL,
    isRead BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (adminAccountID) REFERENCES AdminAccount(adminAccountID)
);

-- Tạo bảng EnduserProfile
CREATE TABLE EnduserProfile (
    enduserProfileID INT AUTO_INCREMENT PRIMARY KEY,
    prfName VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    gender INT,
    dob DATE,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(255),
    avatarURL VARCHAR(255),
    prfAddress VARCHAR(255),
    isDelete BOOLEAN DEFAULT FALSE
);

-- Tạo bảng EnduserAccount
CREATE TABLE EnduserAccount (
    enduserAccountID INT AUTO_INCREMENT PRIMARY KEY,
    enduserProfileID INT NOT NULL,
    username VARCHAR(255) NOT NULL,
    pwd VARCHAR(255) NOT NULL,
    dateCreated DATETIME DEFAULT NOW(),
    isDelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (enduserProfileID) REFERENCES EnduserProfile(enduserProfileID)
);

-- Tạo bảng DeliveryInfo
CREATE TABLE DeliveryInfo (
    deliveryInfoID INT AUTO_INCREMENT PRIMARY KEY,
    enduserAccountID INT NOT NULL,
    prfName VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    prfAddress VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    isDelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (enduserAccountID) REFERENCES EnduserAccount(enduserAccountID)
);

-- Tạo bảng Category
CREATE TABLE Category (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    dateCreate DATETIME DEFAULT NOW(),
    isDelete BOOLEAN DEFAULT FALSE
);

-- Tạo bảng BookInfo
CREATE TABLE BookInfo (
    ISBN VARCHAR(13) PRIMARY KEY,
    categoryID INT NOT NULL,
    bookTitle VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    bookAuthor VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    yearOfPublication INT,
    publisher VARCHAR(255) CHARACTER SET utf8mb4,
    imagesURL VARCHAR(255) CHARACTER SET utf8mb4,
    bookDesc TEXT CHARACTER SET utf8mb4,
    isDelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
);

-- Tạo bảng BookOnStore
CREATE TABLE BookOnStore (
    bookOnStoreID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13) NOT NULL,
    sellingPrice DECIMAL(15,2) NOT NULL,
    quantity INT NOT NULL, 
    FOREIGN KEY (ISBN) REFERENCES Bookinfo(ISBN)
);

-- Tạo bảng Cart
CREATE TABLE Cart (
    cartID INT AUTO_INCREMENT PRIMARY KEY,
    enduserAccountID INT NOT NULL,
    bookOnStoreID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (enduserAccountID) REFERENCES EnduserAccount(enduserAccountID),
    FOREIGN KEY (bookOnStoreID) REFERENCES BookOnStore(bookOnStoreID)
);

-- Tạo bảng Order 
CREATE TABLE `Order` (  -- Order is a reserved word in SQL, so we use backticks
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    deliveryinfoID INT NOT NULL,
    orderDatetime DATETIME DEFAULT NOW(),
    paid BOOLEAN NOT NULL,
    orderStatus INT DEFAULT 1,
    FOREIGN KEY (deliveryinfoID) REFERENCES Deliveryinfo(deliveryinfoID)
);

-- Tạo bảng OrderDetails 
CREATE TABLE OrderDetails (
    orderDetailsID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT NOT NULL,
    bookOnStoreID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES `Order`(orderID),
    FOREIGN KEY (bookOnStoreID) REFERENCES BookOnStore(bookOnStoreID)
);

-- Tạo bảng Supplier
CREATE TABLE Supplier (
    supplierID INT AUTO_INCREMENT PRIMARY KEY,
    supplierName VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    supplierAddress VARCHAR(255) CHARACTER SET utf8mb4,
    phoneNumber VARCHAR(15) NOT NULL
);

-- Tạo bảng Supplier_Book
CREATE TABLE Supplier_Book (
    supplierBookID INT AUTO_INCREMENT PRIMARY KEY,
    supplierID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID),
    FOREIGN KEY (ISBN) REFERENCES BookInfo(ISBN)
);

-- Tạo bảng WarehouseImport 
CREATE TABLE WarehouseImport (
    warehouseImportID INT AUTO_INCREMENT PRIMARY KEY,
    adminAccountID INT NOT NULL,
    supplierID INT NOT NULL,
    importDatetime DATETIME DEFAULT NOW(),
    FOREIGN KEY (adminAccountID) REFERENCES AdminAccount(adminAccountID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

-- Tạo bảng WarehouseImportDetails
CREATE TABLE WarehouseImportDetails (
    warehouseImportDetailsID INT AUTO_INCREMENT PRIMARY KEY,
    warehouseImportID INT,
    ISBN VARCHAR(13) NOT NULL,
    importPrice DECIMAL(15,2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (warehouseImportID) REFERENCES WarehouseImport(warehouseImportID),
    FOREIGN KEY (ISBN) REFERENCES BookInfo(ISBN)
);

-- Tạo bảng OnairStoreTicket
CREATE TABLE OnairStoreTicket (
    onairStoreTicketID INT AUTO_INCREMENT PRIMARY KEY,
    adminAccountID INT NOT NULL,
    ticketStatus INT DEFAULT 1,
    FOREIGN KEY (adminAccountID) REFERENCES AdminAccount(adminAccountID)
);

-- Tạo bảng OnairStoreTicketDetails
CREATE TABLE OnairStoreTicketDetails (
    onairStoreTicketDetailsID INT AUTO_INCREMENT PRIMARY KEY,
    onairStoreTicketID INT NOT NULL,
    warehouseImportDetailsID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (onairStoreTicketID) REFERENCES OnairStoreTicket(onairStoreTicketID),
    FOREIGN KEY (warehouseImportDetailsID) REFERENCES WarehouseImportDetails(warehouseImportDetailsID)
);

-- Tạo bảng BookRating
CREATE TABLE BookRating (
    bookRatingID INT AUTO_INCREMENT PRIMARY KEY,
    enduserAccountID INT NOT NULL,
    bookOnStoreID INT NOT NULL,
    rate INT NOT NULL,
    comment TEXT CHARACTER SET utf8mb4,
    FOREIGN KEY (enduserAccountID) REFERENCES EnduserAccount(enduserAccountID),
    FOREIGN KEY (bookOnStoreID) REFERENCES BookOnStore(bookOnStoreID)
);