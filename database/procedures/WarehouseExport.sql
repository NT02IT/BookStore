DELIMITER //

-- Thêm một bản ghi vào bảng WarehouseExport
CREATE PROCEDURE spWarehouseExport_Create (
    IN p_adminExport INT,
    IN p_adminReceive INT
)
BEGIN
    INSERT INTO WarehouseExport (adminExport, adminReceive, exportDatetime)
    VALUES (p_adminExport, p_adminReceive, NOW());
END //

-- Xóa một bản ghi khỏi bảng WarehouseExport theo ID
CREATE PROCEDURE spWarehouseExport_Delete (
    IN p_warehouseExportID INT
)
BEGIN
    DELETE FROM WarehouseExport WHERE warehouseExportID = p_warehouseExportID;
END //

-- Cập nhật thông tin xuất kho
CREATE PROCEDURE spWarehouseExport_Update (
    IN p_warehouseExportID INT,
    IN p_adminExport INT,
    IN p_adminReceive INT
)
BEGIN
    UPDATE WarehouseExport 
    SET adminExport = p_adminExport, 
        adminReceive = p_adminReceive
    WHERE warehouseExportID = p_warehouseExportID;
END //

-- Lấy tất cả các bản ghi từ bảng WarehouseExport
CREATE PROCEDURE spWarehouseExport_GetAll ()
BEGIN
    SELECT * FROM WarehouseExport;
END //

-- Lấy thông tin xuất kho theo warehouseExportID
CREATE PROCEDURE spWarehouseExport_GetById (
    IN p_warehouseExportID INT
)
BEGIN
    SELECT * FROM WarehouseExport WHERE warehouseExportID = p_warehouseExportID;
END //

-- Lấy danh sách xuất kho theo khoảng thời gian
CREATE PROCEDURE spWarehouseExport_GetByDateRange (
    IN p_startDate DATETIME,
    IN p_endDate DATETIME
)
BEGIN
    SELECT * FROM WarehouseExport 
    WHERE exportDatetime BETWEEN p_startDate AND p_endDate;
END //

-- Lấy danh sách xuất kho theo nhân viên xuất hàng
CREATE PROCEDURE spWarehouseExport_GetByAdminExport (
    IN p_adminExport INT
)
BEGIN
    SELECT * FROM WarehouseExport WHERE adminExport = p_adminExport;
END //

-- Lấy danh sách xuất kho theo nhân viên nhận hàng
CREATE PROCEDURE spWarehouseExport_GetByAdminReceive (
    IN p_adminReceive INT
)
BEGIN
    SELECT * FROM WarehouseExport WHERE adminReceive = p_adminReceive;
END //

DELIMITER ;
