USE bookstore;

INSERT INTO EnduserAccount (prfName, gender, dob, phoneNumber, email, defaultAddress, `password`)
VALUES
('Nguyễn Văn A', 1, '1995-05-20', '0912345678', 'nguyenvana@example.com', '123 Đường A, TP.HCM', SHA2('a123456@', 256)),
('Trần Thị B', 2, '1998-09-15', '0987654321', 'tranthib@example.com', '456 Đường B, Hà Nội', SHA2('a123456@', 256)),
('Lê Văn C', 1, '1990-12-05', '0909123456', 'levanc@example.com', '789 Đường C, Đà Nẵng', SHA2('a123456@', 256)),
('Phạm Thị D', 2, '2000-07-22', '0933221100', 'phamthid@example.com', '159 Đường D, Cần Thơ', SHA2('a123456@', 256)),
('Hoàng Minh E', 1, '1988-02-10', '0944556677', 'hoangminhe@example.com', '753 Đường E, Hải Phòng', SHA2('a123456@', 256));

-- Chèn thông báo chung vào bảng Notification
INSERT INTO Notification (title, content)
VALUES
('Bảo trì hệ thống', 'Hệ thống sẽ bảo trì vào lúc 23:00 ngày 10/04/2025. Vui lòng lưu ý.'),
('Cập nhật chính sách', 'Chính sách bảo mật của chúng tôi đã được cập nhật.'),
('Khuyến mãi tháng 4', 'Giảm giá 20% cho tất cả các đơn hàng từ 01/04 đến 15/04.'),
('Lịch nghỉ lễ', 'Hệ thống sẽ ngừng hoạt động vào ngày 30/04 và 01/05.'),
('Thông báo quan trọng', 'Vui lòng xác nhận lại thông tin tài khoản để đảm bảo bảo mật.');

-- Giả lập adminAccountID từ 1 đến 3 nhận thông báo
INSERT INTO Admin_Notification (adminAccountID, notificationID, readAt)
VALUES
(1, 1, NULL), (1, 2, NOW()), (2, 3, NULL), (2, 4, NOW()), (3, 5, NULL);

-- Giả lập enduserAccountID từ 1 đến 5 nhận thông báo
INSERT INTO Enduser_Notification (enduserAccountID, notificationID, readAt)
VALUES
(1, 1, NOW()), (1, 3, NULL), (2, 2, NOW()), (3, 4, NULL), (4, 5, NULL), (5, 3, NOW());

INSERT INTO DeliveryInfo (enduserAccountID, prfName, prfAddress, phoneNumber)
VALUES
(1, 'Nguyễn Văn A', '123 Đường Lê Lợi, Quận 1, TP.HCM', '0912345678'),
(2, 'Trần Thị B', '456 Đường Trần Hưng Đạo, Quận 5, TP.HCM', '0987654321'),
(3, 'Lê Văn C', '789 Đường Nguyễn Huệ, Quận 1, TP.HCM', '0909090909'),
(4, 'Phạm Thị D', '321 Đường Cách Mạng Tháng 8, Quận 10, TP.HCM', '0888123123'),
(5, 'Hoàng Văn E', '654 Đường Phan Xích Long, Phú Nhuận, TP.HCM', '0999888777');

INSERT INTO BookAuthor (authorName) VALUES
('Nguyễn Nhật Ánh'),
('Isaac Asimov'),
('Daniel Kahneman'),
('Adam Smith'),
('Robert C. Martin');

INSERT INTO BookPublisher (publisherName) VALUES
('NXB Trẻ'),
('NXB Kim Đồng'),
('NXB Khoa học & Kỹ thuật'),
('NXB Tài chính'),
('NXB Công nghệ thông tin');

INSERT INTO BookInfo (ISBN, bookTitle, imageURL, ebookURL, bookDesc) VALUES
('9786043359123', 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 'images/hoa_vang.jpg', NULL, 'Một câu chuyện tuổi thơ đầy cảm xúc.'),
('9780553293357', 'Foundation', 'images/foundation.jpg', 'ebooks/foundation.pdf', 'Một tác phẩm khoa học viễn tưởng kinh điển.'),
('9780374533557', 'Thinking, Fast and Slow', 'images/thinking_fast_slow.jpg', NULL, 'Cuốn sách về tâm lý học hành vi con người.'),
('9780141034591', 'The Wealth of Nations', 'images/wealth_nations.jpg', NULL, 'Tác phẩm kinh điển về kinh tế học.'),
('9780132350884', 'Clean Code', 'images/clean_code.jpg', 'ebooks/clean_code.pdf', 'Cuốn sách hướng dẫn về lập trình sạch.');

INSERT INTO BookInfo_Category (bookID, categoryID) VALUES
(1, 1),  -- 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh' thuộc danh mục Văn học
(2, 2),  -- 'Foundation' thuộc danh mục Khoa học viễn tưởng
(3, 3),  -- 'Thinking, Fast and Slow' thuộc danh mục Tâm lý học
(4, 4),  -- 'The Wealth of Nations' thuộc danh mục Kinh tế
(5, 5);  -- 'Clean Code' thuộc danh mục Công nghệ thông tin

INSERT INTO BookInfo_Author (bookID, authorID) VALUES
(1, 1),  -- Nguyễn Nhật Ánh viết 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh'
(2, 2),  -- Isaac Asimov viết 'Foundation'
(3, 3),  -- Daniel Kahneman viết 'Thinking, Fast and Slow'
(4, 4),  -- Adam Smith viết 'The Wealth of Nations'
(5, 5);  -- Robert C. Martin viết 'Clean Code'

INSERT INTO BookInfo_Publisher (bookID, publisherID, yearOfPublication) VALUES
(1, 1, 2010),  -- 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh' - NXB Trẻ - 2010
(2, 3, 1951),  -- 'Foundation' - NXB Khoa học & Kỹ thuật - 1951
(3, 3, 2011),  -- 'Thinking, Fast and Slow' - NXB Khoa học & Kỹ thuật - 2011
(4, 4, 1776),  -- 'The Wealth of Nations' - NXB Tài chính - 1776
(5, 5, 2008);  -- 'Clean Code' - NXB Công nghệ thông tin - 2008

INSERT INTO Supplier (supplierName, supplierAddress, phoneNumber, email) VALUES
('Công ty Sách Alpha', '123 Đường Lê Lợi, Quận 1, TP. Hồ Chí Minh', '0901234567', 'contact@alphabooks.vn'),
('Nhà sách Fahasa', '45 Nguyễn Văn Cừ, Quận 5, TP. Hồ Chí Minh', '0907654321', 'info@fahasa.com'),
('Nhà sách Phương Nam', '12 Đinh Tiên Hoàng, Quận 1, TP. Hồ Chí Minh', '0912345678', 'support@pnbooks.com'),
('Nhà xuất bản Trẻ', '157 Lý Chính Thắng, Quận 3, TP. Hồ Chí Minh', '0987654321', 'sales@nxbt.com'),
('Công ty Vinabook', '88 Trần Hưng Đạo, Quận 1, TP. Hồ Chí Minh', '0971122334', 'vinabook@support.vn'),
('Nhà sách Đông A', '76 Hai Bà Trưng, Quận 1, TP. Hồ Chí Minh', '0966677889', 'contact@donga.vn');

INSERT INTO Supplier_Book (supplierID, bookID) VALUES
(1, 1), (1, 2), (1, 3), (1, 5),
(2, 2), (2, 4),
(3, 1),
(4, 5),
(5, 3),
(6, 4);

INSERT INTO WarehouseImport (supplierID, adminAccountID, importDatetime) VALUES
(1, 1, '2024-03-01 08:30:00'),
(2, 2, '2024-03-05 10:15:00'),
(3, 1, '2024-03-10 14:45:00'),
(4, 3, '2024-03-15 09:00:00'),
(5, 2, '2024-03-20 16:30:00');

INSERT INTO WarehouseImportDetails (warehouseImportID, bookID, quantity, importPrice) VALUES
(1, 1, 50, 120000),
(1, 3, 30, 85000),
(2, 2, 60, 100000),
(2, 5, 40, 150000),
(3, 4, 45, 95000);

INSERT INTO BookInWarehouse (bookID, warehouseImportID, stock) VALUES
(1, 1, 50),
(3, 1, 30),
(2, 2, 60),
(5, 2, 40),
(4, 3, 45);

INSERT INTO WarehouseExport (adminExport, adminReceive, exportDatetime) VALUES
(1, 2, '2024-03-02 10:00:00'),
(2, 3, '2024-03-06 13:30:00'),
(3, 1, '2024-03-12 15:45:00'),
(1, 4, '2024-03-18 09:20:00');

INSERT INTO WarehouseExportDetails (warehouseExportID, bookInWarehouseID, quantity) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 15),
(2, 4, 8);

INSERT INTO ExportRequestTicket (adminAccountID, requestDatetime, ticketStatus) VALUES
(1, '2024-03-01 09:15:00', 1),
(2, '2024-03-05 11:30:00', 2),
(3, '2024-03-10 14:45:00', 1),
(1, '2024-03-15 16:00:00', 3),
(2, '2024-03-20 08:20:00', 2);

INSERT INTO ExportRequestTicketDetails (exportRequestTicketID, bookID, quantity) VALUES
(1, 1, 10),
(1, 3, 5),
(2, 2, 15),
(2, 5, 8),
(3, 4, 12);

INSERT INTO BookOnStore (bookInWarehouseID, sellingPrice, stock) VALUES
(1, 250000.00, 30),   -- Sách với bookInWarehouseID = 1
(2, 150000.00, 50),   -- Sách với bookInWarehouseID = 2
(3, 350000.00, 20),   -- Sách với bookInWarehouseID = 3
(4, 500000.00, 10),   -- Sách với bookInWarehouseID = 4
(5, 200000.00, 40);   -- Sách với bookInWarehouseID = 5

INSERT INTO BookRating (enduserAccountID, bookOnStoreID, rate, comment) VALUES
(1, 1, 5, 'Sách rất hay và hữu ích, tôi học được rất nhiều điều từ cuốn sách này.'),
(2, 2, 4, 'Sách tốt nhưng một số phần hơi khó hiểu, tuy nhiên vẫn rất giá trị.'),
(3, 3, 3, 'Sách có nội dung thú vị nhưng cần cải thiện cách diễn giải.'),
(1, 4, 5, 'Một cuốn sách xuất sắc, rất dễ hiểu và thực tế.'),
(2, 5, 4, 'Sách rất bổ ích, nhưng tôi mong có thêm phần thực hành chi tiết hơn.');

INSERT INTO CartDetails (enduserAccountID, bookOnStoreID, quantity) VALUES
(1, 1, 2),   -- Người dùng 1 thêm 2 cuốn sách có bookOnStoreID = 1
(1, 2, 1),   -- Người dùng 1 thêm 1 cuốn sách có bookOnStoreID = 2
(2, 3, 3),   -- Người dùng 2 thêm 3 cuốn sách có bookOnStoreID = 3
(3, 4, 1),   -- Người dùng 3 thêm 1 cuốn sách có bookOnStoreID = 4
(3, 5, 2);   -- Người dùng 3 thêm 2 cuốn sách có bookOnStoreID = 5

INSERT INTO `Order` (deliveryinfoID, paid, orderStatus) VALUES
(1, true, 1),   -- Đơn hàng của người dùng 1, đã thanh toán và trạng thái đơn hàng là "đang xử lý"
(2, false, 2);  -- Đơn hàng của người dùng 2, chưa thanh toán và trạng thái đơn hàng là "đã hủy"

INSERT INTO `OrderDetails` (orderID, bookOnStoreID, quantity, purchasePrice) VALUES
(1, 1, 2, 250000),   -- Đơn hàng 1, sách có bookOnStoreID = 1, số lượng 2, giá mua là 250,000 VND
(1, 2, 1, 150000),   -- Đơn hàng 1, sách có bookOnStoreID = 2, số lượng 1, giá mua là 150,000 VND
(2, 3, 3, 350000),   -- Đơn hàng 2, sách có bookOnStoreID = 3, số lượng 3, giá mua là 350,000 VND
(2, 4, 1, 500000),   -- Đơn hàng 2, sách có bookOnStoreID = 4, số lượng 1, giá mua là 500,000 VND
(2, 5, 2, 200000);   -- Đơn hàng 2, sách có bookOnStoreID = 5, số lượng 2, giá mua là 200,000 VND