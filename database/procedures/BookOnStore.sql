DELIMITER //

-- Thêm một bản ghi vào bảng BookOnStore
CREATE PROCEDURE spBookOnStore_Create (
    IN p_bookInWarehouseID INT,
    IN p_sellingPrice DECIMAL(15,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO BookOnStore (bookInWarehouseID, sellingPrice, stock)
    VALUES (p_bookInWarehouseID, p_sellingPrice, p_stock);
END //

-- Xóa một bản ghi khỏi bảng BookOnStore theo bookOnStoreID
CREATE PROCEDURE spBookOnStore_Delete (
    IN p_bookOnStoreID INT
)
BEGIN
    DELETE FROM BookOnStore WHERE bookOnStoreID = p_bookOnStoreID;
END //

-- Cập nhật thông tin cho bảng BookOnStore
CREATE PROCEDURE spBookOnStore_Update (
    IN p_bookOnStoreID INT,
    IN p_sellingPrice DECIMAL(15,2),
    IN p_stock INT
)
BEGIN
    UPDATE BookOnStore 
    SET sellingPrice = p_sellingPrice, stock = p_stock
    WHERE bookOnStoreID = p_bookOnStoreID;
END //

-- Lấy tất cả các bản ghi từ bảng BookOnStore
CREATE PROCEDURE spBookOnStore_GetAll ()
BEGIN
    SELECT * FROM BookOnStore;
END //

-- Lấy thông tin chi tiết của một bản ghi theo bookOnStoreID
CREATE PROCEDURE spBookOnStore_GetById (
    IN p_bookOnStoreID INT
)
BEGIN
    SELECT * FROM BookOnStore WHERE bookOnStoreID = p_bookOnStoreID;
END //

DELIMITER ;
