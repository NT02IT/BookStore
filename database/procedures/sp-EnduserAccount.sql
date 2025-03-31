DELIMITER //
-- 1. Create new end user account
CREATE PROCEDURE sp_InsertEnduserAccount(
    IN p_enduserProfileID INT,
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    INSERT INTO EnduserAccount(enduserProfileID, username, pwd)
    VALUES (p_enduserProfileID, p_username, p_pwd);
    
    SELECT LAST_INSERT_ID() AS newEnduserAccountID;
END //

-- 2. Update end user account
CREATE PROCEDURE sp_UpdateEnduserAccount(
    IN p_enduserAccountID INT,
    IN p_enduserProfileID INT,
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    UPDATE EnduserAccount
    SET enduserProfileID = p_enduserProfileID,
        username = p_username,
        pwd = p_pwd
    WHERE enduserAccountID = p_enduserAccountID;
END //

-- 3. Hard delete account
CREATE PROCEDURE sp_DeleteEnduserAccount(
    IN p_enduserAccountID INT
)
BEGIN
    DELETE FROM EnduserAccount 
    WHERE enduserAccountID = p_enduserAccountID;
END //

-- 4. Soft delete account
CREATE PROCEDURE sp_SoftDeleteEnduserAccount(
    IN p_enduserAccountID INT
)
BEGIN
    UPDATE EnduserAccount
    SET isDelete = TRUE
    WHERE enduserAccountID = p_enduserAccountID;
END //

-- 5. Restore account
CREATE PROCEDURE sp_RestoreEnduserAccount(
    IN p_enduserAccountID INT
)
BEGIN
    UPDATE EnduserAccount
    SET isDelete = FALSE
    WHERE enduserAccountID = p_enduserAccountID;
END //

-- 6. Get all accounts (non-deleted only)
CREATE PROCEDURE sp_GetAllEnduserAccount()
BEGIN
    SELECT 
        ea.enduserAccountID,
        ea.enduserProfileID,
        ea.username,
        ea.dateCreated,
        ep.prfName,
        ep.email,
        ep.phoneNumber
    FROM EnduserAccount ea
    JOIN EnduserProfile ep ON ea.enduserProfileID = ep.enduserProfileID
    WHERE ea.isDelete = FALSE
    ORDER BY ea.dateCreated DESC;
END //

-- 7. Get all accounts including deleted
CREATE PROCEDURE sp_GetAllEnduserAccountIncludingDeleted()
BEGIN
    SELECT 
        ea.enduserAccountID,
        ea.enduserProfileID,
        ea.username,
        ea.dateCreated,
        ea.isDelete,
        ep.prfName,
        ep.email,
        ep.phoneNumber
    FROM EnduserAccount ea
    JOIN EnduserProfile ep ON ea.enduserProfileID = ep.enduserProfileID
    ORDER BY ea.isDelete, ea.dateCreated DESC;
END //

-- 8. Get account by ID
CREATE PROCEDURE sp_GetEnduserAccountByID(
    IN p_enduserAccountID INT
)
BEGIN
    SELECT 
        ea.*,
        ep.prfName,
        ep.gender,
        ep.dob,
        ep.phoneNumber,
        ep.email,
        ep.avatarURL,
        ep.prfAddress
    FROM EnduserAccount ea
    JOIN EnduserProfile ep ON ea.enduserProfileID = ep.enduserProfileID
    WHERE ea.enduserAccountID = p_enduserAccountID;
END //

-- 9. Get account by username
CREATE PROCEDURE sp_GetEnduserAccountByUsername(
    IN p_username VARCHAR(255)
)
BEGIN
    SELECT 
        ea.*,
        ep.prfName,
        ep.email,
        ep.phoneNumber
    FROM EnduserAccount ea
    JOIN EnduserProfile ep ON ea.enduserProfileID = ep.enduserProfileID
    WHERE ea.username = p_username
    AND ea.isDelete = FALSE;
END //

-- 10. Check if username exists
CREATE PROCEDURE sp_CheckEnduserUsernameExists(
    IN p_username VARCHAR(255)
)
BEGIN
    SELECT COUNT(*) AS usernameExists
    FROM EnduserAccount
    WHERE username = p_username
    AND isDelete = FALSE;
END //

-- 11. Verify login credentials
CREATE PROCEDURE sp_VerifyEnduserLogin(
    IN p_username VARCHAR(255),
    IN p_pwd VARCHAR(255)
)
BEGIN
    SELECT 
        ea.enduserAccountID,
        ea.username,
        ea.enduserProfileID,
        ep.prfName,
        ep.email,
        ep.phoneNumber
    FROM EnduserAccount ea
    JOIN EnduserProfile ep ON ea.enduserProfileID = ep.enduserProfileID
    WHERE ea.username = p_username
    AND ea.pwd = p_pwd
    AND ea.isDelete = FALSE;
END //
DELIMITER ;