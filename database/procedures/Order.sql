DELIMITER //

-- Thêm một đơn hàng mới
CREATE PROCEDURE spOrder_Create (
    IN p_deliveryinfoID INT,
    IN p_paid BOOL,
    IN p_orderStatus INT
)
BEGIN
    INSERT INTO `Order` (deliveryinfoID, orderDatetime, paid, orderStatus)
    VALUES (p_deliveryinfoID, NOW(), p_paid, p_orderStatus);
END //

-- Xóa một đơn hàng
CREATE PROCEDURE spOrder_Delete (
    IN p_orderID INT
)
BEGIN
    DELETE FROM `Order` WHERE orderID = p_orderID;
END //

-- Cập nhật thông tin đơn hàng
CREATE PROCEDURE spOrder_Update (
    IN p_orderID INT,
    IN p_deliveryinfoID INT,
    IN p_paid BOOL,
    IN p_orderStatus INT
)
BEGIN
    UPDATE `Order`
    SET deliveryinfoID = p_deliveryinfoID, paid = p_paid, orderStatus = p_orderStatus
    WHERE orderID = p_orderID;
END //

-- Lấy tất cả các đơn hàng
CREATE PROCEDURE spOrder_GetAll ()
BEGIN
    SELECT * FROM `Order`;
END //

-- Lấy thông tin của một đơn hàng theo orderID
CREATE PROCEDURE spOrder_GetById (
    IN p_orderID INT
)
BEGIN
    SELECT * FROM `Order` WHERE orderID = p_orderID;
END //

DELIMITER ;
