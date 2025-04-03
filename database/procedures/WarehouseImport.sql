DELIMITER //

-- Thêm một bản ghi vào bảng WarehouseImport
CREATE PROCEDURE spWarehouseImport_Create (
    IN p_supplierID INT,
    IN p_adminAccountID INT
)
BEGIN
    INSERT INTO WarehouseImport (supplierID, adminAccountID, importDatetime)
    VALUES (p_supplierID, p_adminAccountID, NOW());
END //

-- Xóa một bản ghi khỏi bảng WarehouseImport theo ID
CREATE PROCEDURE spWarehouseImport_Delete (
    IN p_warehouseImportID INT
)
BEGIN
    DELETE FROM WarehouseImport WHERE warehouseImportID = p_warehouseImportID;
END //

-- Cập nhật thông tin nhập kho
CREATE PROCEDURE spWarehouseImport_Update (
    IN p_warehouseImportID INT,
    IN p_supplierID INT,
    IN p_adminAccountID INT
)
BEGIN
    UPDATE WarehouseImport 
    SET supplierID = p_supplierID, 
        adminAccountID = p_adminAccountID
    WHERE warehouseImportID = p_warehouseImportID;
END //

-- Lấy tất cả các bản ghi từ bảng WarehouseImport
CREATE PROCEDURE spWarehouseImport_GetAll ()
BEGIN
    SELECT * FROM WarehouseImport;
END //

-- Lấy thông tin nhập kho theo ID
CREATE PROCEDURE spWarehouseImport_GetById (
    IN p_warehouseImportID INT
)
BEGIN
    SELECT * FROM WarehouseImport WHERE warehouseImportID = p_warehouseImportID;
END //

-- Lấy danh sách nhập kho theo khoảng ngày
CREATE PROCEDURE spWarehouseImport_GetByDateRange (
    IN p_startDate DATETIME,
    IN p_endDate DATETIME
)
BEGIN
    SELECT * FROM WarehouseImport 
    WHERE importDatetime BETWEEN p_startDate AND p_endDate;
END //

-- Lấy danh sách nhập kho theo nhà cung cấp
CREATE PROCEDURE spWarehouseImport_GetBySupplier (
    IN p_supplierID INT
)
BEGIN
    SELECT * FROM WarehouseImport WHERE supplierID = p_supplierID;
END //

-- Lấy danh sách nhập kho theo tài khoản admin
CREATE PROCEDURE spWarehouseImport_GetByAdminAccount (
    IN p_adminAccountID INT
)
BEGIN
    SELECT * FROM WarehouseImport WHERE adminAccountID = p_adminAccountID;
END //

DELIMITER ;
