DELIMITER //

CREATE PROCEDURE sp_InsertEnduserProfile(
    IN p_prfName VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_gender INT,
    IN p_dob DATE,
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_prfAddress VARCHAR(255)
)
BEGIN
    INSERT INTO EnduserProfile (prfName, gender, dob, phoneNumber, email, avatarURL, prfAddress, isDelete)
    VALUES (p_prfName, p_gender, p_dob, p_phoneNumber, p_email, p_avatarURL, p_prfAddress, FALSE);
END //

CREATE PROCEDURE sp_UpdateEnduserProfile(
    IN p_enduserProfileID INT,
    IN p_prfName VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_gender INT,
    IN p_dob DATE,
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_prfAddress VARCHAR(255)
)
BEGIN
    UPDATE EnduserProfile
    SET prfName = p_prfName,
        gender = p_gender,
        dob = p_dob,
        phoneNumber = p_phoneNumber,
        email = p_email,
        avatarURL = p_avatarURL,
        prfAddress = p_prfAddress
    WHERE enduserProfileID = p_enduserProfileID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteEnduserProfile(
    IN p_enduserProfileID INT
)
BEGIN
    DELETE FROM EnduserProfile
    WHERE enduserProfileID = p_enduserProfileID;
END //

CREATE PROCEDURE sp_SoftDeleteEnduserProfile(
    IN p_enduserProfileID INT
)
BEGIN
    UPDATE EnduserProfile
    SET isDelete = TRUE
    WHERE enduserProfileID = p_enduserProfileID;
END //

CREATE PROCEDURE sp_GetAllEnduserProfile()
BEGIN
    SELECT * FROM EnduserProfile
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllEnduserProfileIncludingDeleted()
BEGIN
    SELECT * FROM EnduserProfile;
END //

CREATE PROCEDURE sp_GetEnduserProfileByID(
    IN p_enduserProfileID INT
)
BEGIN
    SELECT * FROM EnduserProfile
    WHERE enduserProfileID = p_enduserProfileID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreEnduserProfile(
    IN p_enduserProfileID INT
)
BEGIN
    UPDATE EnduserProfile
    SET isDelete = FALSE
    WHERE enduserProfileID = p_enduserProfileID;
END //

DELIMITER ;