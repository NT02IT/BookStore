DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_Create(
    IN p_enduserAccountID INT,
    IN p_prfName VARCHAR(255),
    IN p_prfAddress VARCHAR(255),
    IN p_phoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO DeliveryInfo (enduserAccountID, prfName, prfAddress, phoneNumber, createdAt)
    VALUES (p_enduserAccountID, p_prfName, p_prfAddress, p_phoneNumber, NOW());
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_Delete(
    IN p_deliveryInfoID INT
)
BEGIN
    DELETE FROM DeliveryInfo WHERE deliveryInfoID = p_deliveryInfoID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_SoftDelete(
    IN p_deliveryInfoID INT
)
BEGIN
    UPDATE DeliveryInfo SET deletedAt = NOW() WHERE deliveryInfoID = p_deliveryInfoID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_Restore(
    IN p_deliveryInfoID INT
)
BEGIN
    UPDATE DeliveryInfo SET deletedAt = NULL WHERE deliveryInfoID = p_deliveryInfoID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_Update(
    IN p_deliveryInfoID INT,
    IN p_prfName VARCHAR(255),
    IN p_prfAddress VARCHAR(255),
    IN p_phoneNumber VARCHAR(15)
)
BEGIN
    UPDATE DeliveryInfo
    SET prfName = p_prfName,
        prfAddress = p_prfAddress,
        phoneNumber = p_phoneNumber
    WHERE deliveryInfoID = p_deliveryInfoID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_GetAll()
BEGIN
    SELECT * FROM DeliveryInfo WHERE deletedAt IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_GetAllIncludeDeleted()
BEGIN
    SELECT * FROM DeliveryInfo;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_GetById(
    IN p_deliveryInfoID INT
)
BEGIN
    SELECT * FROM DeliveryInfo WHERE deliveryInfoID = p_deliveryInfoID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_GetByName(
    IN p_prfName VARCHAR(255)
)
BEGIN
    SELECT * FROM DeliveryInfo WHERE prfName LIKE CONCAT('%', p_prfName, '%') AND deletedAt IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spDeliveryInfo_Search(
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * FROM DeliveryInfo
    WHERE (prfName LIKE CONCAT('%', p_keyword, '%') OR phoneNumber LIKE CONCAT('%', p_keyword, '%'))
    AND deletedAt IS NULL;
END $$
DELIMITER ;