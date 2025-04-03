-- spEnduserAccount_Create
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_Create(
    IN p_prfName VARCHAR(255),
    IN p_gender INT,
    IN p_dob DATE,
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_defaultAddress VARCHAR(255),
    IN p_password BINARY(60)
)
BEGIN
    INSERT INTO EnduserAccount (prfName, gender, dob, phoneNumber, email, avatarURL, defaultAddress, password)
    VALUES (p_prfName, p_gender, p_dob, p_phoneNumber, p_email, p_avatarURL, p_defaultAddress, p_password);
END $$
DELIMITER ;

-- spEnduserAccount_Delete
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_Delete(
    IN p_enduserAccountID INT
)
BEGIN
    DELETE FROM EnduserAccount WHERE enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_DeleteAllDeliveryInfo
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_DeleteAllDeliveryInfo(
    IN p_enduserAccountID INT
)
BEGIN
    DELETE FROM DeliveryInfo WHERE enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_SoftDelete
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_SoftDelete(
    IN p_enduserAccountID INT
)
BEGIN
    UPDATE EnduserAccount SET deletedAt = NOW() WHERE enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_Restore
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_Restore(
    IN p_enduserAccountID INT
)
BEGIN
    UPDATE EnduserAccount SET deletedAt = NULL WHERE enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_Update
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_Update(
    IN p_enduserAccountID INT,
    IN p_prfName VARCHAR(255),
    IN p_gender INT,
    IN p_dob DATE,
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_defaultAddress VARCHAR(255),
    IN p_password BINARY(60)
)
BEGIN
    UPDATE EnduserAccount 
    SET prfName = p_prfName,
        gender = p_gender,
        dob = p_dob,
        phoneNumber = p_phoneNumber,
        email = p_email,
        avatarURL = p_avatarURL,
        defaultAddress = p_defaultAddress,
        password = p_password
    WHERE enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_GetAll
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_GetAll()
BEGIN
    SELECT * FROM EnduserAccount;
END $$
DELIMITER ;

-- spEnduserAccount_GetAllIncludeDeleted
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_GetAllIncludeDeleted()
BEGIN
    SELECT * FROM EnduserAccount;
END $$
DELIMITER ;

-- spEnduserAccount_GetAllNotification
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_GetAllNotification(
    IN p_enduserAccountID INT
)
BEGIN
    SELECT EN.enduserAccountID, EN.notificationID, N.title, N.content, EN.readAt
    FROM Enduser_Notification EN
    JOIN Notification N ON EN.notificationID = N.notificationID
    WHERE EN.enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_GetById
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_GetById(
    IN p_enduserAccountID INT
)
BEGIN
    SELECT * FROM EnduserAccount WHERE enduserAccountID = p_enduserAccountID;
END $$
DELIMITER ;

-- spEnduserAccount_GetByName
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_GetByName(
    IN p_prfName VARCHAR(255)
)
BEGIN
    SELECT * FROM EnduserAccount WHERE prfName = p_prfName;
END $$
DELIMITER ;

-- Lấy tất cả sản phẩm trong giỏ hàng của người dùng
DELIMITER //
CREATE PROCEDURE spEnduserAccount_GetCartDetails (
    IN p_enduserAccountID INT
)
BEGIN
    SELECT cd.*
    FROM CartDetails cd
    JOIN BookOnStore bs ON cd.bookOnStoreID = bs.bookOnStoreID
    WHERE cd.enduserAccountID = p_enduserAccountID;
END //
DELIMITER ;

-- spEnduserAccount_Search
DELIMITER $$
CREATE PROCEDURE spEnduserAccount_Search(
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * 
    FROM EnduserAccount
    WHERE prfName LIKE CONCAT('%', p_keyword, '%')
       OR phoneNumber LIKE CONCAT('%', p_keyword, '%')
       OR email LIKE CONCAT('%', p_keyword, '%')
       OR defaultAddress LIKE CONCAT('%', p_keyword, '%');
END $$
DELIMITER ;
