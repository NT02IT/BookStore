USE bookstore;

-- Insert data into DatabaseEntity table
INSERT INTO DatabaseEntity (entityName) VALUES
('Role'),
('Permission'),
('AdminProfile'),
('AdminAccount'),
('Notification'),
('EnduserProfile'),
('EnduserAccount'),
('DeliveryInfo'),
('Category'),
('BookInfo'),
('BookOnStore'),
('Cart'),
('Order'),
('OrderDetails'),
('Supplier'),
('WarehouseImport'),
('WarehouseImportDetails'),
('OnairStoreTicket'),
('OnairStoreTicketDetails'),
('BookRating');

-- Insert data into Role table
INSERT INTO Role (roleName) VALUES
('Admin'),
('Sales staff'),
('Warehouse staff'),
('HR Manager');

-- Insert data into Permission table (Permission for Admin)
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData) VALUES
(1, TRUE, TRUE, TRUE, TRUE, FALSE),
(2, TRUE, TRUE, TRUE, TRUE, FALSE),
(3, TRUE, TRUE, TRUE, TRUE, FALSE),
(4, TRUE, TRUE, TRUE, TRUE, FALSE),
(5, TRUE, TRUE, TRUE, TRUE, FALSE),
(6, TRUE, TRUE, TRUE, TRUE, FALSE),
(7, TRUE, TRUE, TRUE, TRUE, FALSE),
(8, TRUE, TRUE, TRUE, TRUE, FALSE),
(9, TRUE, TRUE, TRUE, TRUE, FALSE),
(10, TRUE, TRUE, TRUE, TRUE, FALSE),
(11, TRUE, TRUE, TRUE, TRUE, FALSE),
(12, TRUE, TRUE, TRUE, TRUE, FALSE),
(13, TRUE, TRUE, TRUE, TRUE, FALSE),
(14, TRUE, TRUE, TRUE, TRUE, FALSE),
(15, TRUE, TRUE, TRUE, TRUE, FALSE),
(16, TRUE, TRUE, TRUE, TRUE, FALSE),
(17, TRUE, TRUE, TRUE, TRUE, FALSE),
(18, TRUE, TRUE, TRUE, TRUE, FALSE),
(19, TRUE, TRUE, TRUE, TRUE, FALSE),
(20, TRUE, TRUE, TRUE, TRUE, FALSE);

-- Insert data into Role_Permission table (Admin role)
INSERT INTO Role_Permission (roleID, permissionID) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20);

-- Insert data into Permission table  (Permission for Sales staff)
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData) VALUES
(1, FALSE, FALSE, FALSE, FALSE, FALSE),
(2, FALSE, FALSE, FALSE, FALSE, FALSE),
(3, FALSE, FALSE, FALSE, FALSE, TRUE),
(4, FALSE, FALSE, FALSE, FALSE, TRUE),
(5, FALSE, FALSE, FALSE, FALSE, TRUE),
(6, TRUE, TRUE, TRUE, TRUE, FALSE),
(7, TRUE, TRUE, TRUE, TRUE, FALSE),
(8, TRUE, TRUE, TRUE, TRUE, FALSE),
(9, FALSE, TRUE, FALSE, FALSE, FALSE),
(10, FALSE, TRUE, FALSE, FALSE, FALSE),
(11, TRUE, TRUE, TRUE, TRUE, FALSE),
(12, FALSE, FALSE, FALSE, FALSE, FALSE),
(13, TRUE, TRUE, TRUE, TRUE, FALSE),
(14, TRUE, TRUE, TRUE, TRUE, FALSE),
(15, FALSE, FALSE, FALSE, FALSE, FALSE),
(16, FALSE, TRUE, FALSE, FALSE, FALSE),
(17, FALSE, TRUE, FALSE, FALSE, FALSE),
(18, TRUE, TRUE, TRUE, TRUE, FALSE),
(19, TRUE, TRUE, TRUE, TRUE, FALSE),
(20, FALSE, TRUE, FALSE, FALSE, FALSE);

-- Insert data into Role_Permission table (Sales staff role)
INSERT INTO Role_Permission (roleID, permissionID) VALUES
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40);

-- Insert data into Permission table  (Permission for Warehouse staff)
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData) VALUES
(1, FALSE, FALSE, FALSE, FALSE, FALSE),
(2, FALSE, FALSE, FALSE, FALSE, FALSE),
(3, FALSE, FALSE, FALSE, FALSE, TRUE),
(4, FALSE, FALSE, FALSE, FALSE, TRUE),
(5, FALSE, FALSE, FALSE, FALSE, TRUE),
(6, FALSE, FALSE, FALSE, FALSE, FALSE),
(7, FALSE, FALSE, FALSE, FALSE, FALSE),
(8, FALSE, FALSE, FALSE, FALSE, FALSE),
(9, TRUE, TRUE, TRUE, TRUE, FALSE),
(10, TRUE, TRUE, TRUE, TRUE, FALSE),
(11, FALSE, FALSE, FALSE, FALSE, FALSE),
(12, FALSE, FALSE, FALSE, FALSE, FALSE),
(13, FALSE, FALSE, FALSE, FALSE, FALSE),
(14, FALSE, FALSE, FALSE, FALSE, FALSE),
(15, TRUE, TRUE, TRUE, TRUE, FALSE),
(16, TRUE, TRUE, TRUE, TRUE, FALSE),
(17, TRUE, TRUE, TRUE, TRUE, FALSE),
(18, FALSE, TRUE, TRUE, TRUE, FALSE),
(19, FALSE, TRUE, TRUE, TRUE, FALSE),
(20, FALSE, FALSE, FALSE, FALSE, FALSE);

-- Insert data into Role_Permission table (Warehouse staff role)
INSERT INTO Role_Permission (roleID, permissionID) VALUES
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(3, 47),
(3, 48),
(3, 49),
(3, 50),
(3, 51),
(3, 52),
(3, 53),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60);

-- Insert data into Permission table  (Permission for HR Manager)
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData) VALUES
(1, TRUE, TRUE, TRUE, TRUE, FALSE),
(2, TRUE, TRUE, TRUE, TRUE, FALSE),
(3, TRUE, TRUE, TRUE, TRUE, FALSE),
(4, TRUE, TRUE, TRUE, TRUE, FALSE),
(5, FALSE, FALSE, FALSE, FALSE, TRUE),
(6, FALSE, FALSE, FALSE, FALSE, FALSE),
(7, FALSE, FALSE, FALSE, FALSE, FALSE),
(8, FALSE, FALSE, FALSE, FALSE, FALSE),
(9, FALSE, FALSE, FALSE, FALSE, FALSE),
(10, FALSE, FALSE, FALSE, FALSE, FALSE),
(11, FALSE, FALSE, FALSE, FALSE, FALSE),
(12, FALSE, FALSE, FALSE, FALSE, FALSE),
(13, FALSE, FALSE, FALSE, FALSE, FALSE),
(14, FALSE, FALSE, FALSE, FALSE, FALSE),
(15, TRUE, TRUE, TRUE, TRUE, FALSE),
(16, FALSE, FALSE, FALSE, FALSE, FALSE),
(17, FALSE, FALSE, FALSE, FALSE, FALSE),
(18, FALSE, FALSE, FALSE, FALSE, FALSE),
(19, FALSE, FALSE, FALSE, FALSE, FALSE),
(20, FALSE, FALSE, FALSE, FALSE, FALSE);

-- Insert data into Role_Permission table (Warehouse staff role)
INSERT INTO Role_Permission (roleID, permissionID) VALUES
(4, 61),
(4, 62),
(4, 63),
(4, 64),
(4, 65),
(4, 66),
(4, 67),
(4, 68),
(4, 69),
(4, 70),
(4, 71),
(4, 72),
(4, 73),
(4, 74),
(4, 75),
(4, 76),
(4, 77),
(4, 78),
(4, 79),
(4, 80);

-- Insert data into AdminProfile table
INSERT INTO AdminProfile (prfName, CCCD, phoneNumber, email, salary) VALUES
('Admin', '123456789012', '0901234567', 'lowtee.vn@gmail.com', 100000000.00),
('Nguyễn Anh Tuấn', '123456789012', '0901234567', 'lowtee.vn@gmail.com', 10000000.00),
('Nguyễn Duy Nghiêm', '123456789012', '0901234567', 'ndnghiemsgu@gmail.com', 10000000.00),
('Nguyễn Công Huấn', '123456789012', '0901234567', 'huan82141@gmail.com', 10000000.00),
('Nguyễn Đức Toàn', '123456789012', '0901234567', 'lowtee.vn@gmail.com', 10000000.00);

-- Insert data into AdminAccount table
-- Using SHA256 for password hashing
INSERT INTO AdminAccount (roleID, username, pwd, adminProfileID) VALUES
(1, 'admin', SHA2('admin', 256), 1), 
(1, 'ntuan', SHA2('ntuan123@', 256), 2), 
(2, 'nnghiem', SHA2('nnghiem123@', 256), 3), 
(3, 'nhuan', SHA2('nhuan123@', 256), 4), 
(4, 'ntoan', SHA2('ntoan123@', 256), 5); 