-- Stored Procedure: Tạo mới Role
DELIMITER $$
CREATE PROCEDURE spRole_Create (
    IN p_roleName VARCHAR(255)
)
BEGIN
    INSERT INTO Role (roleName) VALUES (p_roleName);
END $$
DELIMITER ;

-- Stored Procedure: Xóa cứng Role
DELIMITER $$
CREATE PROCEDURE spRole_Delete (
    IN p_roleID INT
)
BEGIN
    DELETE FROM Role WHERE roleID = p_roleID;
END $$
DELIMITER ;

-- Stored Procedure: Xóa mềm Role
DELIMITER $$
CREATE PROCEDURE spRole_SoftDelete (
    IN p_roleID INT
)
BEGIN
    UPDATE Role SET deletedAt = NOW() WHERE roleID = p_roleID;
END $$
DELIMITER ;

-- Stored Procedure: Khôi phục Role bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spRole_Restore (
    IN p_roleID INT
)
BEGIN
    UPDATE Role SET deletedAt = NULL WHERE roleID = p_roleID;
END $$
DELIMITER ;

-- Stored Procedure: Cập nhật Role
DELIMITER $$
CREATE PROCEDURE spRole_Update (
    IN p_roleID INT,
    IN p_roleName VARCHAR(255)
)
BEGIN
    UPDATE Role SET roleName = p_roleName WHERE roleID = p_roleID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả Role không bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spRole_GetAll ()
BEGIN
    SELECT * FROM Role WHERE deletedAt IS NULL;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả Role bao gồm cả bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spRole_GetAllIncludeDeleted ()
BEGIN
    SELECT * FROM Role;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả Permission của một Role
DELIMITER $$
CREATE PROCEDURE spRole_GetAllPermission (
    IN p_roleID INT
)
BEGIN
    SELECT rp.permissionID, p.entityID, p.canCreate, p.canRead, p.canUpdate, p.canDelete, p.isRestrictedToOwnData
    FROM Role_Permission rp
    INNER JOIN Permission p ON rp.permissionID = p.permissionID
    WHERE rp.roleID = p_roleID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy Role theo ID
DELIMITER $$
CREATE PROCEDURE spRole_GetById (
    IN p_roleID INT
)
BEGIN
    SELECT * FROM Role WHERE roleID = p_roleID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy Role theo tên
DELIMITER $$
CREATE PROCEDURE spRole_GetByName (
    IN p_roleName VARCHAR(255)
)
BEGIN
    SELECT * FROM Role WHERE roleName = p_roleName;
END $$
DELIMITER ;

-- Stored Procedure: Tìm kiếm Role theo tên gần đúng
DELIMITER $$
CREATE PROCEDURE spRole_Search (
    IN p_searchTerm VARCHAR(255)
)
BEGIN
    SELECT * FROM Role WHERE roleName LIKE CONCAT('%', p_searchTerm, '%');
END $$
DELIMITER ;
