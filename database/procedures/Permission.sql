-- Stored Procedure: Tạo mới Permission
DELIMITER $$
CREATE PROCEDURE spPermission_Create (
    IN p_entityID INT,
    IN p_canCreate BOOL,
    IN p_canRead BOOL,
    IN p_canUpdate BOOL,
    IN p_canDelete BOOL,
    IN p_isRestrictedToOwnData BOOL
)
BEGIN
    INSERT INTO Permission (entityID, canCreate, canRead, canUpdate, canDelete, isRestrictedToOwnData)
    VALUES (p_entityID, p_canCreate, p_canRead, p_canUpdate, p_canDelete, p_isRestrictedToOwnData);
END $$
DELIMITER ;

-- Stored Procedure: Xóa Permission
DELIMITER $$
CREATE PROCEDURE spPermission_Delete (
    IN p_permissionID INT
)
BEGIN
    DELETE FROM Permission WHERE permissionID = p_permissionID;
END $$
DELIMITER ;

-- Stored Procedure: Cập nhật Permission
DELIMITER $$
CREATE PROCEDURE spPermission_Update (
    IN p_permissionID INT,
    IN p_entityID INT,
    IN p_canCreate BOOL,
    IN p_canRead BOOL,
    IN p_canUpdate BOOL,
    IN p_canDelete BOOL,
    IN p_isRestrictedToOwnData BOOL
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
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả Permission
DELIMITER $$
CREATE PROCEDURE spPermission_GetAll ()
BEGIN
    SELECT * FROM Permission;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả Role
DELIMITER $$
CREATE PROCEDURE spPermission_GetAllRole ()
BEGIN
    SELECT r.*
    FROM Role r
    INNER JOIN Role_Permission rp ON r.roleID = rp.roleID
    INNER JOIN Permission p ON rp.permissionID = p.permissionID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy Permission theo ID
DELIMITER $$
CREATE PROCEDURE spPermission_GetById (
    IN p_permissionID INT
)
BEGIN
    SELECT * FROM Permission WHERE permissionID = p_permissionID;
END $$
DELIMITER ;
