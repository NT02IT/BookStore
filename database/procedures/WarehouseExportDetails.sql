DELIMITER //

-- Thêm một bản ghi vào bảng WarehouseExportDetails
CREATE PROCEDURE spWarehouseExportDetails_Create (
    IN p_warehouseExportID INT,
    IN p_bookInWarehouseID INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO WarehouseExportDetails (warehouseExportID, bookInWarehouseID, quantity)
    VALUES (p_warehouseExportID, p_bookInWarehouseID, p_quantity);
END //

-- Xóa một bản ghi khỏi bảng WarehouseExportDetails theo warehouseExportID và bookInWarehouseID
CREATE PROCEDURE spWarehouseExportDetails_Delete (
    IN p_warehouseExportID INT,
    IN p_bookInWarehouseID INT
)
BEGIN
    DELETE FROM WarehouseExportDetails 
    WHERE warehouseExportID = p_warehouseExportID AND bookInWarehouseID = p_bookInWarehouseID;
END //

-- Cập nhật thông tin chi tiết xuất kho
CREATE PROCEDURE spWarehouseExportDetails_Update (
    IN p_warehouseExportID INT,
    IN p_bookInWarehouseID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE WarehouseExportDetails 
    SET quantity = p_quantity
    WHERE warehouseExportID = p_warehouseExportID AND bookInWarehouseID = p_bookInWarehouseID;
END //

-- Lấy tất cả các bản ghi từ bảng WarehouseExportDetails
CREATE PROCEDURE spWarehouseExportDetails_GetAll ()
BEGIN
    SELECT * FROM WarehouseExportDetails;
END //

-- Lấy thông tin chi tiết xuất kho theo warehouseExportID
CREATE PROCEDURE spWarehouseExportDetails_GetById (
    IN p_warehouseExportID INT
)
BEGIN
    SELECT * FROM WarehouseExportDetails WHERE warehouseExportID = p_warehouseExportID;
END //

DELIMITER ;
