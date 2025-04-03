-- Stored Procedure: Tạo mới AdminProfile
DELIMITER $$
CREATE PROCEDURE spAdminProfile_Create (
    IN p_prfName VARCHAR(255),
    IN p_gender INT,
    IN p_dob DATE,
    IN p_cccd VARCHAR(20),
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_prfAddress VARCHAR(255),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO AdminProfile (prfName, gender, dob, cccd, phoneNumber, email, avatarURL, prfAddress, salary)
    VALUES (p_prfName, p_gender, p_dob, p_cccd, p_phoneNumber, p_email, p_avatarURL, p_prfAddress, p_salary);
END $$
DELIMITER ;

-- Stored Procedure: Xóa cứng AdminProfile
DELIMITER $$
CREATE PROCEDURE spAdminProfile_Delete (
    IN p_adminProfileID INT
)
BEGIN
    DELETE FROM AdminProfile WHERE adminProfileID = p_adminProfileID;
END $$
DELIMITER ;

-- Stored Procedure: Xóa mềm AdminProfile
DELIMITER $$
CREATE PROCEDURE spAdminProfile_SoftDelete (
    IN p_adminProfileID INT
)
BEGIN
    UPDATE AdminProfile SET deletedAt = NOW() WHERE adminProfileID = p_adminProfileID;
END $$
DELIMITER ;

-- Stored Procedure: Khôi phục AdminProfile bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spAdminProfile_Restore (
    IN p_adminProfileID INT
)
BEGIN
    UPDATE AdminProfile SET deletedAt = NULL WHERE adminProfileID = p_adminProfileID;
END $$
DELIMITER ;

-- Stored Procedure: Cập nhật AdminProfile
DELIMITER $$
CREATE PROCEDURE spAdminProfile_Update (
    IN p_adminProfileID INT,
    IN p_prfName VARCHAR(255),
    IN p_gender INT,
    IN p_dob DATE,
    IN p_cccd VARCHAR(20),
    IN p_phoneNumber VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_avatarURL VARCHAR(255),
    IN p_prfAddress VARCHAR(255),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE AdminProfile 
    SET prfName = p_prfName, gender = p_gender, dob = p_dob, cccd = p_cccd,
        phoneNumber = p_phoneNumber, email = p_email, avatarURL = p_avatarURL,
        prfAddress = p_prfAddress, salary = p_salary
    WHERE adminProfileID = p_adminProfileID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả AdminProfile không bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spAdminProfile_GetAll ()
BEGIN
    SELECT * FROM AdminProfile WHERE deletedAt IS NULL;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả AdminProfile bao gồm cả bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spAdminProfile_GetAllIncludeDeleted ()
BEGIN
    SELECT * FROM AdminProfile;
END $$
DELIMITER ;

-- Stored Procedure: Lấy AdminProfile theo ID
DELIMITER $$
CREATE PROCEDURE spAdminProfile_GetById (
    IN p_adminProfileID INT
)
BEGIN
    SELECT * FROM AdminProfile WHERE adminProfileID = p_adminProfileID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy AdminProfile theo tên
DELIMITER $$
CREATE PROCEDURE spAdminProfile_GetByName (
    IN p_prfName VARCHAR(255)
)
BEGIN
    SELECT * FROM AdminProfile WHERE prfName = p_prfName;
END $$
DELIMITER ;

-- Stored Procedure: Tìm kiếm AdminProfile theo tên gần đúng
DELIMITER $$
CREATE PROCEDURE spAdminProfile_Search(
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * 
    FROM AdminProfile
    WHERE prfName LIKE CONCAT('%', p_keyword, '%')
      OR cccd LIKE CONCAT('%', p_keyword, '%')
      OR phoneNumber LIKE CONCAT('%', p_keyword, '%')
      OR email LIKE CONCAT('%', p_keyword, '%')
      OR prfAddress LIKE CONCAT('%', p_keyword, '%');
END $$
DELIMITER ;
