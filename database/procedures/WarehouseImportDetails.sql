DELIMITER //

-- Thêm một bản ghi vào bảng WarehouseImportDetails
CREATE PROCEDURE spWarehouseImportDetails_Create (
    IN p_warehouseImportID INT,
    IN p_bookID INT,
    IN p_quantity INT,
    IN p_importPrice DECIMAL(10,2)
)
BEGIN
    INSERT INTO WarehouseImportDetails (warehouseImportID, bookID, quantity, importPrice)
    VALUES (p_warehouseImportID, p_bookID, p_quantity, p_importPrice);
END //

-- Xóa một bản ghi khỏi bảng WarehouseImportDetails theo ID
CREATE PROCEDURE spWarehouseImportDetails_Delete (
    IN p_warehouseImportID INT,
    IN p_bookID INT
)
BEGIN
    DELETE FROM WarehouseImportDetails 
    WHERE warehouseImportID = p_warehouseImportID AND bookID = p_bookID;
END //

-- Cập nhật thông tin chi tiết nhập kho
CREATE PROCEDURE spWarehouseImportDetails_Update (
    IN p_warehouseImportID INT,
    IN p_bookID INT,
    IN p_quantity INT,
    IN p_importPrice DECIMAL(10,2)
)
BEGIN
    UPDATE WarehouseImportDetails 
    SET quantity = p_quantity, 
        importPrice = p_importPrice
    WHERE warehouseImportID = p_warehouseImportID AND bookID = p_bookID;
END //

-- Lấy tất cả các bản ghi từ bảng WarehouseImportDetails
CREATE PROCEDURE spWarehouseImportDetails_GetAll ()
BEGIN
    SELECT * FROM WarehouseImportDetails;
END //

-- Lấy thông tin nhập kho theo warehouseImportID
CREATE PROCEDURE spWarehouseImportDetails_GetById (
    IN p_warehouseImportID INT
)
BEGIN
    SELECT * FROM WarehouseImportDetails WHERE warehouseImportID = p_warehouseImportID;
END //

DELIMITER ;
