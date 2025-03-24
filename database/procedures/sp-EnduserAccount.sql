DELIMITER //

CREATE PROCEDURE sp_InsertEnduserAccount(
    IN p_enduserProfileID INT,
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    INSERT INTO EnduserAccount (enduserProfileID, username, pwd, isDelete)
    VALUES (p_enduserProfileID, p_username, p_pwd, FALSE);
END //

CREATE PROCEDURE sp_UpdateEnduserAccount(
    IN p_enduserAccountID INT,
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    UPDATE EnduserAccount
    SET username = p_username,
        pwd = p_pwd
    WHERE enduserAccountID = p_enduserAccountID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteEnduserAccount(
    IN p_enduserAccountID INT
)
BEGIN
    DELETE FROM EnduserAccount
    WHERE enduserAccountID = p_enduserAccountID;
END //

CREATE PROCEDURE sp_SoftDeleteEnduserAccount(
    IN p_enduserAccountID INT
)
BEGIN
    UPDATE EnduserAccount
    SET isDelete = TRUE
    WHERE enduserAccountID = p_enduserAccountID;
END //

CREATE PROCEDURE sp_GetAllEnduserAccount()
BEGIN
    SELECT * FROM EnduserAccount
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllEnduserAccountIncludingDeleted()
BEGIN
    SELECT * FROM EnduserAccount;
END //

CREATE PROCEDURE sp_GetEnduserAccountByID(
    IN p_enduserAccountID INT
)
BEGIN
    SELECT * FROM EnduserAccount
    WHERE enduserAccountID = p_enduserAccountID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetEnduserAccountByProfileID(
    IN p_enduserProfileID INT
)
BEGIN
    SELECT * FROM EnduserAccount
    WHERE enduserProfileID = p_enduserProfileID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreEnduserAccount(
    IN p_enduserAccountID INT
)
BEGIN
    UPDATE EnduserAccount
    SET isDelete = FALSE
    WHERE enduserAccountID = p_enduserAccountID;
END //

CREATE PROCEDURE sp_LoginEnduserAccount(
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    SELECT * FROM EnduserAccount
    WHERE username = p_username AND pwd = p_pwd AND isDelete = FALSE;
END //

DELIMITER ;