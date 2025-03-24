DELIMITER //

CREATE PROCEDURE sp_InsertAdminProfile(
    IN p_prfName VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_gender INT,
    IN p_dob DATE,
    IN p_CCCD VARCHAR(20),
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_prfAddress VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_salary DECIMAL(10, 2)
)
BEGIN
    INSERT INTO AdminProfile (prfName, gender, dob, CCCD, phoneNumber, email, avatarURL, prfAddress, salary, isDelete)
    VALUES (p_prfName, p_gender, p_dob, p_CCCD, p_phoneNumber, p_email, p_avatarURL, p_prfAddress, p_salary, FALSE);
END //

CREATE PROCEDURE sp_UpdateAdminProfile(
    IN p_adminProfileID INT,
    IN p_prfName VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_gender INT,
    IN p_dob DATE,
    IN p_CCCD VARCHAR(20),
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_prfAddress VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_salary DECIMAL(10, 2)
)
BEGIN
    UPDATE AdminProfile
    SET prfName = p_prfName,
        gender = p_gender,
        dob = p_dob,
        CCCD = p_CCCD,
        phoneNumber = p_phoneNumber,
        email = p_email,
        avatarURL = p_avatarURL,
        prfAddress = p_prfAddress,
        salary = p_salary
    WHERE adminProfileID = p_adminProfileID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteAdminProfile(
    IN p_adminProfileID INT
)
BEGIN
    DELETE FROM AdminProfile
    WHERE adminProfileID = p_adminProfileID;
END //

CREATE PROCEDURE sp_SoftDeleteAdminProfile(
    IN p_adminProfileID INT
)
BEGIN
    UPDATE AdminProfile
    SET isDelete = TRUE
    WHERE adminProfileID = p_adminProfileID;
END //

CREATE PROCEDURE sp_GetAllAdminProfile()
BEGIN
    SELECT * FROM AdminProfile
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllAdminProfileIncludingDeleted()
BEGIN
    SELECT * FROM AdminProfile;
END //

CREATE PROCEDURE sp_GetAdminProfileByID(
    IN p_adminProfileID INT
)
BEGIN
    SELECT * FROM AdminProfile
    WHERE adminProfileID = p_adminProfileID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreAdminProfile(
    IN p_adminProfileID INT
)
BEGIN
    UPDATE AdminProfile
    SET isDelete = FALSE
    WHERE adminProfileID = p_adminProfileID;
END //

DELIMITER ;