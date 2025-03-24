DELIMITER //

CREATE PROCEDURE sp_InsertRolePermission(
    IN p_roleID INT,
    IN p_permissionID INT
)
BEGIN
    INSERT INTO Role_Permission (roleID, permissionID)
    VALUES (p_roleID, p_permissionID);
END //

CREATE PROCEDURE sp_UpdateRolePermission(
    IN p_rolePermissionID INT,
    IN p_roleID INT,
    IN p_permissionID INT
)
BEGIN
    UPDATE Role_Permission
    SET roleID = p_roleID,
        permissionID = p_permissionID
    WHERE rolePermissionID = p_rolePermissionID;
END //

CREATE PROCEDURE sp_DeleteRolePermission(
    IN p_rolePermissionID INT
)
BEGIN
    DELETE FROM Role_Permission
    WHERE rolePermissionID = p_rolePermissionID;
END //

CREATE PROCEDURE sp_GetAllRolePermission()
BEGIN
    SELECT * FROM Role_Permission;
END //

CREATE PROCEDURE sp_GetRolePermissionByID(
    IN p_rolePermissionID INT
)
BEGIN
    SELECT * FROM Role_Permission
    WHERE rolePermissionID = p_rolePermissionID;
END //

CREATE PROCEDURE sp_GetRolePermissionByRoleID(
    IN p_roleID INT
)
BEGIN
    SELECT * FROM Role_Permission
    WHERE roleID = p_roleID;
END //

CREATE PROCEDURE sp_GetRolePermissionByPermissionID(
    IN p_permissionID INT
)
BEGIN
    SELECT * FROM Role_Permission
    WHERE permissionID = p_permissionID;
END //

DELIMITER ;