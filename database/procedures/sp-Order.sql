DELIMITER //

CREATE PROCEDURE sp_InsertOrder(
    IN p_deliveryinfoID INT,
    IN p_paid BOOLEAN,
    IN p_orderStatus INT
)
BEGIN
    INSERT INTO `Order` (deliveryinfoID, orderDatetime, paid, orderStatus)
    VALUES (p_deliveryinfoID, NOW(), p_paid, p_orderStatus);
END //

CREATE PROCEDURE sp_UpdateOrder(
    IN p_orderID INT,
    IN p_deliveryinfoID INT,
    IN p_paid BOOLEAN,
    IN p_orderStatus INT
)
BEGIN
    UPDATE `Order`
    SET deliveryinfoID = p_deliveryinfoID,
        paid = p_paid,
        orderStatus = p_orderStatus
    WHERE orderID = p_orderID;
END //

CREATE PROCEDURE sp_DeleteOrder(
    IN p_orderID INT
)
BEGIN
    DELETE FROM `Order` WHERE orderID = p_orderID;
END //

CREATE PROCEDURE sp_GetAllOrder()
BEGIN
    SELECT * FROM `Order`;
END //

DELIMITER ;
