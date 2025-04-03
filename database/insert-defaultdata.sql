USE bookstore;

-- Thêm danh sách Entitys
INSERT INTO DatabaseEntity (entityName) VALUES
('DatabaseEntity'),
('Permission'),
('Role'),
('Role_Permission'),
('AdminProfile'),
('AdminAccount'),
('EnduserAccount'),
('Notification'),
('Admin_Notification'),
('Enduser_Notification'),
('DeliveryInfo'),
('BookCategory'),
('BookAuthor'),
('BookPublisher'),
('BookInfo'),
('BookInfo_Category'),
('BookInfo_Author'),
('BookInfo_Publisher'),
('Supplier'),
('Supplier_Book'),
('BookInWarehouse'),
('WarehouseImport'),
('WarehouseImportDetails'),
('WarehouseExport'),
('WarehouseExportDetails'),
('ExportRequestTicket'),
('ExportRequestTicketDetails'),
('BookOnStore'),
('BookRating'),
('CartDetails'),
('Order'),
('OrderDetails');

-- Thêm danh sách Role
INSERT INTO Role (roleName) VALUES
('Admin'),
('Sales staff'),
('Warehouse staff'),
('HR Manager');

-- Admin có toàn quyền trên tất cả entities
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData)
SELECT entityID, true, true, true, true, false FROM DatabaseEntity;

-- Gán quyền Admin (được toàn quyền)
INSERT INTO Role_Permission (roleID, permissionID)
SELECT (SELECT roleID FROM Role WHERE roleName = 'Admin'), permissionID FROM Permission;

-- Sales staff chỉ có quyền trên các bảng liên quan đến bán hàng
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData)
SELECT entityID, true, true, true, false, true 
FROM DatabaseEntity 
WHERE entityName IN ('Order', 'OrderDetails', 'CartDetails', 'EnduserAccount', 'BookOnStore', 'BookRating');

-- Gán quyền Sales staff
INSERT INTO Role_Permission (roleID, permissionID)
SELECT (SELECT roleID FROM Role WHERE roleName = 'Sales staff'), permissionID 
FROM Permission 
WHERE entityID IN (SELECT entityID FROM DatabaseEntity WHERE entityName IN ('Order', 'OrderDetails', 'CartDetails', 'EnduserAccount', 'BookOnStore', 'BookRating'));

-- Warehouse staff chỉ có quyền trên kho, xuất nhập hàng
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData)
SELECT entityID, true, true, true, false, false
FROM DatabaseEntity
WHERE entityName IN ('BookInWarehouse', 'WarehouseImport', 'WarehouseImportDetails', 'WarehouseExport', 'WarehouseExportDetails', 'ExportRequestTicket', 'ExportRequestTicketDetails');

-- Gán quyền Warehouse staff
INSERT INTO Role_Permission (roleID, permissionID)
SELECT (SELECT roleID FROM Role WHERE roleName = 'Warehouse staff'), permissionID 
FROM Permission 
WHERE entityID IN (SELECT entityID FROM DatabaseEntity WHERE entityName IN ('BookInWarehouse', 'WarehouseImport', 'WarehouseImportDetails', 'WarehouseExport', 'WarehouseExportDetails', 'ExportRequestTicket', 'ExportRequestTicketDetails'));

-- HR Manager chỉ có quyền trên nhân sự và tài khoản admin
INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData)
SELECT entityID, true, true, true, false, false
FROM DatabaseEntity
WHERE entityName IN ('AdminProfile', 'AdminAccount', 'Role', 'Role_Permission');

-- Gán quyền HR Manager
INSERT INTO Role_Permission (roleID, permissionID)
SELECT (SELECT roleID FROM Role WHERE roleName = 'HR Manager'), permissionID 
FROM Permission 
WHERE entityID IN (SELECT entityID FROM DatabaseEntity WHERE entityName IN ('AdminProfile', 'AdminAccount', 'Role', 'Role_Permission'));

-- Thêm AdminProfile
INSERT INTO AdminProfile (prfName, CCCD, phoneNumber, email, salary) VALUES
('Admin', '123456789012', '0901234567', 'lowtee.vn@gmail.com', 100000000.00),
('Nguyễn Anh Tuấn', '123456789012', '0901234567', 'lowtee.vn@gmail.com', 10000000.00),
('Nguyễn Duy Nghiêm', '123456789012', '0901234567', 'ndnghiemsgu@gmail.com', 10000000.00),
('Nguyễn Công Huấn', '123456789012', '0901234567', 'huan82141@gmail.com', 10000000.00),
('Nguyễn Đức Toàn', '123456789012', '0901234567', 'lowtee.vn@gmail.com', 10000000.00);

-- Tạo tài khoản cho Admin
-- Using SHA256 for password hashing
INSERT INTO AdminAccount (adminProfileID, roleID, username, `password`) VALUES
(1, 1, 'admin', SHA2('admin', 256)), 
(2, 1, 'ntuan', SHA2('ntuan123@', 256)), 
(3, 2, 'nnghiem', SHA2('nnghiem123@', 256)), 
(4, 3, 'nhuan', SHA2('nhuan123@', 256)), 
(5, 4, 'ntoan', SHA2('ntoan123@', 256)); 

-- Thêm tài khoản cho khách vãng lai
INSERT INTO EnduserAccount (prfName, gender, dob, phoneNumber, email, defaultAddress, `password`)
VALUES
('Guest', NULL, NULL, NULL, NULL, NULL, SHA2('guest', 256)); 

-- Danh sách danh mục sách
INSERT INTO BookCategory (categoryName) VALUES
('Văn học'),
('Tiểu thuyết'),
('Truyện ngắn'),
('Khoa học viễn tưởng'),
('Huyền bí'),
('Kinh dị'),
('Trinh thám'),
('Phiêu lưu'),
('Lãng mạn'),
('Tâm lý học'),
('Tự truyện - Hồi ký'),
('Kinh tế'),
('Quản trị kinh doanh'),
('Marketing'),
('Tài chính - Đầu tư'),
('Khởi nghiệp'),
('Công nghệ thông tin'),
('Lập trình'),
('Trí tuệ nhân tạo'),
('An ninh mạng'),
('Dữ liệu lớn'),
('Kỹ thuật - Công nghệ'),
('Điện tử - Viễn thông'),
('Khoa học vũ trụ'),
('Y học'),
('Dinh dưỡng - Sức khỏe'),
('Tâm lý học ứng dụng'),
('Phát triển bản thân'),
('Giáo dục'),
('Nuôi dạy con'),
('Tâm linh - Tôn giáo'),
('Triết học'),
('Lịch sử'),
('Địa lý'),
('Chính trị'),
('Xã hội học'),
('Luật'),
('Nghệ thuật'),
('Âm nhạc'),
('Hội họa'),
('Nhiếp ảnh'),
('Thiết kế đồ họa'),
('Kiến trúc'),
('Phong thủy'),
('Thể thao'),
('Nấu ăn'),
('Làm vườn'),
('Du lịch'),
('Ngôn ngữ học'),
('Sách thiếu nhi'),
('Truyện tranh - Manga'),
('Light Novel'),
('Kỹ năng sống'),
('Khoa học tự nhiên'),
('Vật lý'),
('Hóa học'),
('Sinh học'),
('Thiên văn học'),
('Sách giáo khoa'),
('Luyện thi đại học'),
('Tiếng Anh'),
('Ngoại ngữ khác'),
('Thơ ca'),
('Sách tham khảo'),
('Sách cổ điển'),
('Văn học nước ngoài'),
('Tạp chí');