DELIMITER //

-- Thêm một nhà cung cấp mới
CREATE PROCEDURE spSupplier_Create (
    IN p_supplierName VARCHAR(255),
    IN p_supplierAddress VARCHAR(255),
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255)
)
BEGIN
    INSERT INTO Supplier (supplierName, supplierAddress, phoneNumber, email)
    VALUES (p_supplierName, p_supplierAddress, p_phoneNumber, p_email);
END //

-- Xóa hoàn toàn một nhà cung cấp theo ID
CREATE PROCEDURE spSupplier_Delete (
    IN p_supplierID INT
)
BEGIN
    DELETE FROM Supplier WHERE supplierID = p_supplierID;
END //

-- Xóa mềm một nhà cung cấp (đánh dấu deletedAt)
CREATE PROCEDURE spSupplier_SoftDelete (
    IN p_supplierID INT
)
BEGIN
    UPDATE Supplier 
    SET deletedAt = NOW()
    WHERE supplierID = p_supplierID;
END //

-- Khôi phục một nhà cung cấp đã bị xóa mềm
CREATE PROCEDURE spSupplier_Restore (
    IN p_supplierID INT
)
BEGIN
    UPDATE Supplier 
    SET deletedAt = NULL
    WHERE supplierID = p_supplierID;
END //

-- Cập nhật thông tin nhà cung cấp
CREATE PROCEDURE spSupplier_Update (
    IN p_supplierID INT,
    IN p_supplierName VARCHAR(255),
    IN p_supplierAddress VARCHAR(255),
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255)
)
BEGIN
    UPDATE Supplier 
    SET supplierName = p_supplierName,
        supplierAddress = p_supplierAddress,
        phoneNumber = p_phoneNumber,
        email = p_email
    WHERE supplierID = p_supplierID;
END //

-- Lấy tất cả nhà cung cấp chưa bị xóa
CREATE PROCEDURE spSupplier_GetAll ()
BEGIN
    SELECT * FROM Supplier WHERE deletedAt IS NULL;
END //

-- Lấy tất cả nhà cung cấp kể cả đã bị xóa mềm
CREATE PROCEDURE spSupplier_GetAllIncludeDeleted ()
BEGIN
    SELECT * FROM Supplier;
END //

DELIMITER //

CREATE PROCEDURE spSupplier_GetAllBook (
    IN p_supplierID INT
)
BEGIN
    SELECT b.*
    FROM Supplier_Book sb
    JOIN BookInfo b ON sb.bookID = b.bookID
    WHERE sb.supplierID = p_supplierID;
END //

DELIMITER ;

-- Lấy nhà cung cấp theo ID
CREATE PROCEDURE spSupplier_GetById (
    IN p_supplierID INT
)
BEGIN
    SELECT * FROM Supplier WHERE supplierID = p_supplierID;
END //

-- Lấy nhà cung cấp theo tên
CREATE PROCEDURE spSupplier_GetByName (
    IN p_supplierName VARCHAR(255)
)
BEGIN
    SELECT * FROM Supplier WHERE supplierName = p_supplierName;
END //

-- Tìm kiếm nhà cung cấp theo nhiều tiêu chí
CREATE PROCEDURE spSupplier_Search (
    IN p_searchText VARCHAR(255)
)
BEGIN
    SELECT * FROM Supplier 
    WHERE (supplierName LIKE CONCAT('%', p_searchText, '%') 
        OR supplierAddress LIKE CONCAT('%', p_searchText, '%')
        OR phoneNumber LIKE CONCAT('%', p_searchText, '%')
        OR email LIKE CONCAT('%', p_searchText, '%'))
        AND deletedAt IS NULL;
END //

DELIMITER ;
