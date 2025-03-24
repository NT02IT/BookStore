DELIMITER //

CREATE PROCEDURE sp_InsertPermission(
    IN p_entityID INT,
    IN p_canCreate BOOLEAN,
    IN p_canRead BOOLEAN,
    IN p_canUpdate BOOLEAN,
    IN p_canDelete BOOLEAN,
    IN p_isRestrictedToOwnData BOOLEAN
)
BEGIN
    INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData)
    VALUES (p_entityID, p_canCreate, p_canRead, p_canUpdate, p_canDelete, p_isRestrictedToOwnData);
END //

CREATE PROCEDURE sp_UpdatePermission(
    IN p_permissionID INT,
    IN p_entityID INT,
    IN p_canCreate BOOLEAN,
    IN p_canRead BOOLEAN,
    IN p_canUpdate BOOLEAN,
    IN p_canDelete BOOLEAN,
    IN p_isRestrictedToOwnData BOOLEAN
)
BEGIN
    UPDATE Permission
    SET entityID = p_entityID,
        canCreate = p_canCreate,
        canRead = p_canRead,
        canUpdate = p_canUpdate,
        canDelete = p_canDelete,
        isRestrictedToOwnData = p_isRestrictedToOwnData
    WHERE permissionID = p_permissionID;
END //

CREATE PROCEDURE sp_DeletePermission(
    IN p_permissionID INT
)
BEGIN
    DELETE FROM Permission
    WHERE permissionID = p_permissionID;
END //

CREATE PROCEDURE sp_GetAllPermission()
BEGIN
    SELECT * FROM Permission;
END //

CREATE PROCEDURE sp_GetPermissionByID(
    IN p_permissionID INT
)
BEGIN
    SELECT * FROM Permission
    WHERE permissionID = p_permissionID;
END //

CREATE PROCEDURE sp_GetPermissionByEntityID(
    IN p_entityID INT
)
BEGIN
    SELECT * FROM Permission
    WHERE entityID = p_entityID;
END //

DELIMITER ;