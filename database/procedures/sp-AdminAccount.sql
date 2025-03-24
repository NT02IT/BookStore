DELIMITER //

CREATE PROCEDURE sp_InsertAdminAccount(
    IN p_roleID INT,
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255),
    IN p_adminProfileID INT
)
BEGIN
    INSERT INTO AdminAccount (roleID, username, pwd, adminProfileID, isDelete)
    VALUES (p_roleID, p_username, p_pwd, p_adminProfileID, FALSE);
END //

CREATE PROCEDURE sp_UpdateAdminAccount(
    IN p_adminAccountID INT,
    IN p_roleID INT,
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255),
    IN p_adminProfileID INT
)
BEGIN
    UPDATE AdminAccount
    SET roleID = p_roleID,
        username = p_username,
        pwd = p_pwd,
        adminProfileID = p_adminProfileID
    WHERE adminAccountID = p_adminAccountID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteAdminAccount(
    IN p_adminAccountID INT
)
BEGIN
    DELETE FROM AdminAccount
    WHERE adminAccountID = p_adminAccountID;
END //

CREATE PROCEDURE sp_SoftDeleteAdminAccount(
    IN p_adminAccountID INT
)
BEGIN
    UPDATE AdminAccount
    SET isDelete = TRUE
    WHERE adminAccountID = p_adminAccountID;
END //

CREATE PROCEDURE sp_GetAllAdminAccount()
BEGIN
    SELECT * FROM AdminAccount
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllAdminAccountIncludingDeleted()
BEGIN
    SELECT * FROM AdminAccount;
END //

CREATE PROCEDURE sp_GetAdminAccountByID(
    IN p_adminAccountID INT
)
BEGIN
    SELECT * FROM AdminAccount
    WHERE adminAccountID = p_adminAccountID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAdminAccountByProfileID(
    IN p_adminProfileID INT
)
BEGIN
    SELECT * FROM AdminAccount
    WHERE adminProfileID = p_adminProfileID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreAdminAccount(
    IN p_adminAccountID INT
)
BEGIN
    UPDATE AdminAccount
    SET isDelete = FALSE
    WHERE adminAccountID = p_adminAccountID;
END //

CREATE PROCEDURE sp_LoginAdminAccount(
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    SELECT * FROM AdminAccount
    WHERE username = p_username AND pwd = p_pwd AND isDelete = FALSE;
END //

DELIMITER ;