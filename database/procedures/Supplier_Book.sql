DELIMITER //

-- Thêm một bản ghi vào bảng Supplier_Book
CREATE PROCEDURE spSupplier_Book_Create (
    IN p_supplierID INT,
    IN p_bookID INT
)
BEGIN
    INSERT INTO Supplier_Book (supplierID, bookID)
    VALUES (p_supplierID, p_bookID);
END //

-- Xóa một bản ghi khỏi bảng Supplier_Book
CREATE PROCEDURE spSupplier_Book_Delete (
    IN p_supplierID INT,
    IN p_bookID INT
)
BEGIN
    DELETE FROM Supplier_Book 
    WHERE supplierID = p_supplierID AND bookID = p_bookID;
END //

-- Cập nhật thông tin nhà cung cấp sách (Xóa bản ghi cũ và thêm bản ghi mới)
CREATE PROCEDURE spSupplier_Book_Update (
    IN p_oldSupplierID INT,
    IN p_oldBookID INT,
    IN p_newSupplierID INT,
    IN p_newBookID INT
)
BEGIN
    DELETE FROM Supplier_Book 
    WHERE supplierID = p_oldSupplierID AND bookID = p_oldBookID;
    
    INSERT INTO Supplier_Book (supplierID, bookID)
    VALUES (p_newSupplierID, p_newBookID);
END //

-- Lấy tất cả các bản ghi từ bảng Supplier_Book
CREATE PROCEDURE spSupplier_Book_GetAll ()
BEGIN
    SELECT * FROM Supplier_Book;
END //

-- Lấy danh sách sách của một nhà cung cấp theo supplierID
CREATE PROCEDURE spSupplier_Book_GetById (
    IN p_supplierID INT
)
BEGIN
    SELECT b.bookID, b.bookTitle
    FROM Supplier_Book sb
    JOIN BookInfo b ON sb.bookID = b.bookID
    WHERE sb.supplierID = p_supplierID;
END //

DELIMITER ;
