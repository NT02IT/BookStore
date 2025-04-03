DELIMITER //

-- Thêm một bản ghi vào bảng BookInWarehouse
CREATE PROCEDURE spBookInWarehouse_Create (
    IN p_bookID INT,
    IN p_warehouseImportID INT,
    IN p_stock INT
)
BEGIN
    INSERT INTO BookInWarehouse (bookID, warehouseImportID, stock)
    VALUES (p_bookID, p_warehouseImportID, p_stock);
END //

-- Xóa một bản ghi khỏi bảng BookInWarehouse theo ID
CREATE PROCEDURE spBookInWarehouse_Delete (
    IN p_bookInWarehouseID INT
)
BEGIN
    DELETE FROM BookInWarehouse 
    WHERE bookInWarehouseID = p_bookInWarehouseID;
END //

-- Cập nhật số lượng tồn kho cho một sách trong kho
CREATE PROCEDURE spBookInWarehouse_Update (
    IN p_bookInWarehouseID INT,
    IN p_bookID INT,
    IN p_warehouseImportID INT,
    IN p_stock INT
)
BEGIN
    UPDATE BookInWarehouse 
    SET bookID = p_bookID, 
        warehouseImportID = p_warehouseImportID, 
        stock = p_stock
    WHERE bookInWarehouseID = p_bookInWarehouseID;
END //

-- Lấy tất cả các bản ghi từ bảng BookInWarehouse
CREATE PROCEDURE spBookInWarehouse_GetAll ()
BEGIN
    SELECT * FROM BookInWarehouse;
END //

-- Lấy thông tin một bản ghi từ bảng BookInWarehouse theo ID
CREATE PROCEDURE spBookInWarehouse_GetById (
    IN p_bookInWarehouseID INT
)
BEGIN
    SELECT * FROM BookInWarehouse WHERE bookInWarehouseID = p_bookInWarehouseID;
END //

DELIMITER ;
