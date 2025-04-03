-- Stored Procedure: Tạo mới Role_Permission
DELIMITER $$
CREATE PROCEDURE spRole_Permission_Create (
    IN p_roleID INT,
    IN p_permissionID INT
)
BEGIN
    INSERT INTO Role_Permission (roleID, permissionID) VALUES (p_roleID, p_permissionID);
END $$
DELIMITER ;

-- Stored Procedure: Xóa Role_Permission
DELIMITER $$
CREATE PROCEDURE spRole_Permission_Delete (
    IN p_roleID INT,
    IN p_permissionID INT
)
BEGIN
    DELETE FROM Role_Permission WHERE roleID = p_roleID AND permissionID = p_permissionID;
END $$
DELIMITER ;

-- Stored Procedure: Cập nhật Role_Permission
DELIMITER $$
CREATE PROCEDURE spRole_Permission_Update (
    IN p_oldRoleID INT,
    IN p_oldPermissionID INT,
    IN p_newRoleID INT,
    IN p_newPermissionID INT
)
BEGIN
    UPDATE Role_Permission 
    SET roleID = p_newRoleID, permissionID = p_newPermissionID
    WHERE roleID = p_oldRoleID AND permissionID = p_oldPermissionID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả Role_Permission
DELIMITER $$
CREATE PROCEDURE spRole_Permission_GetAll ()
BEGIN
    SELECT * FROM Role_Permission;
END $$
DELIMITER ;

-- Stored Procedure: Lấy Role_Permission theo ID
DELIMITER $$
CREATE PROCEDURE spRole_Permission_GetById (
    IN p_roleID INT,
    IN p_permissionID INT
)
BEGIN
    SELECT * FROM Role_Permission WHERE roleID = p_roleID AND permissionID = p_permissionID;
END $$
DELIMITER ;
