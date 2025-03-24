DELIMITER //

CREATE PROCEDURE sp_InsertRole(
    IN p_roleName VARCHAR(255) CHARACTER SET utf8mb4
)
BEGIN
    INSERT INTO Role (roleName, isDelete)
    VALUES (p_roleName, FALSE);
END //

CREATE PROCEDURE sp_UpdateRole(
    IN p_roleID INT,
    IN p_roleName VARCHAR(255) CHARACTER SET utf8mb4
)
BEGIN
    UPDATE Role
    SET roleName = p_roleName
    WHERE roleID = p_roleID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteRole(
    IN p_roleID INT
)
BEGIN
    DELETE FROM Role
    WHERE roleID = p_roleID;
END //

CREATE PROCEDURE sp_SoftDeleteRole(
    IN p_roleID INT
)
BEGIN
    UPDATE Role
    SET isDelete = TRUE
    WHERE roleID = p_roleID;
END //

CREATE PROCEDURE sp_GetAllRole()
BEGIN
    SELECT * FROM Role
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllRoleIncludingDeleted()
BEGIN
    SELECT * FROM Role;
END //

CREATE PROCEDURE sp_GetRoleByID(
    IN p_roleID INT
)
BEGIN
    SELECT * FROM Role
    WHERE roleID = p_roleID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreRole(
    IN p_roleID INT
)
BEGIN
    UPDATE Role
    SET isDelete = FALSE
    WHERE roleID = p_roleID;
END //

DELIMITER ;