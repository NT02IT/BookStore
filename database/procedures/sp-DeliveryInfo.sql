DELIMITER //

CREATE PROCEDURE sp_InsertDeliveryInfo(
    IN p_enduserAccountID INT,
    IN p_prfName VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_prfAddress VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_phoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO DeliveryInfo (enduserAccountID, prfName, prfAddress, phoneNumber, isDelete)
    VALUES (p_enduserAccountID, p_prfName, p_prfAddress, p_phoneNumber, FALSE);
END //

CREATE PROCEDURE sp_UpdateDeliveryInfo(
    IN p_deliveryInfoID INT,
    IN p_enduserAccountID INT,
    IN p_prfName VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_prfAddress VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_phoneNumber VARCHAR(15)
)
BEGIN
    UPDATE DeliveryInfo
    SET enduserAccountID = p_enduserAccountID,
        prfName = p_prfName,
        prfAddress = p_prfAddress,
        phoneNumber = p_phoneNumber
    WHERE deliveryInfoID = p_deliveryInfoID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteDeliveryInfo(
    IN p_deliveryInfoID INT
)
BEGIN
    DELETE FROM DeliveryInfo
    WHERE deliveryInfoID = p_deliveryInfoID;
END //

CREATE PROCEDURE sp_SoftDeleteDeliveryInfo(
    IN p_deliveryInfoID INT
)
BEGIN
    UPDATE DeliveryInfo
    SET isDelete = TRUE
    WHERE deliveryInfoID = p_deliveryInfoID;
END //

CREATE PROCEDURE sp_GetAllDeliveryInfo()
BEGIN
    SELECT * FROM DeliveryInfo
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllDeliveryInfoIncludingDeleted()
BEGIN
    SELECT * FROM DeliveryInfo;
END //

CREATE PROCEDURE sp_GetDeliveryInfoByID(
    IN p_deliveryInfoID INT
)
BEGIN
    SELECT * FROM DeliveryInfo
    WHERE deliveryInfoID = p_deliveryInfoID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreDeliveryInfo(
    IN p_deliveryInfoID INT
)
BEGIN
    UPDATE DeliveryInfo
    SET isDelete = FALSE
    WHERE deliveryInfoID = p_deliveryInfoID;
END //

DELIMITER ;