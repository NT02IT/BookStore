DELIMITER //

-- Thêm một chi tiết đơn hàng mới
CREATE PROCEDURE spOrderDetails_Create (
    IN p_orderID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT,
    IN p_purchasePrice INT
)
BEGIN
    INSERT INTO `OrderDetails` (orderID, bookOnStoreID, quantity, purchasePrice)
    VALUES (p_orderID, p_bookOnStoreID, p_quantity, p_purchasePrice);
END //

-- Xóa chi tiết đơn hàng
CREATE PROCEDURE spOrderDetails_Delete (
    IN p_orderDetailsID INT
)
BEGIN
    DELETE FROM `OrderDetails` WHERE orderDetailsID = p_orderDetailsID;
END //

-- Cập nhật chi tiết đơn hàng
CREATE PROCEDURE spOrderDetails_Update (
    IN p_orderDetailsID INT,
    IN p_orderID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT,
    IN p_purchasePrice INT
)
BEGIN
    UPDATE `OrderDetails`
    SET orderID = p_orderID, bookOnStoreID = p_bookOnStoreID, quantity = p_quantity, purchasePrice = p_purchasePrice
    WHERE orderDetailsID = p_orderDetailsID;
END //

-- Lấy tất cả chi tiết đơn hàng
CREATE PROCEDURE spOrderDetails_GetAll ()
BEGIN
    SELECT * FROM `OrderDetails`;
END //

-- Lấy chi tiết của một đơn hàng theo orderDetailsID
CREATE PROCEDURE spOrderDetails_GetById (
    IN p_orderDetailsID INT
)
BEGIN
    SELECT * FROM `OrderDetails` WHERE orderDetailsID = p_orderDetailsID;
END //

DELIMITER ;
