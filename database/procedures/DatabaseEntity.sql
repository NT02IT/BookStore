-- Stored Procedure: Tạo mới entity
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_Create (
    IN p_entityName VARCHAR(255)
)
BEGIN
    INSERT INTO DatabaseEntity (entityName) VALUES (p_entityName);
END $$
DELIMITER ;

-- Stored Procedure: Xóa cứng entity
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_Delete (
    IN p_entityID INT
)
BEGIN
    DELETE FROM DatabaseEntity WHERE entityID = p_entityID;
END $$
DELIMITER ;

-- Stored Procedure: Xóa mềm entity
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_SoftDelete (
    IN p_entityID INT
)
BEGIN
    UPDATE DatabaseEntity SET deletedAt = NOW() WHERE entityID = p_entityID;
END $$
DELIMITER ;

-- Stored Procedure: Khôi phục entity bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_Restore (
    IN p_entityID INT
)
BEGIN
    UPDATE DatabaseEntity SET deletedAt = NULL WHERE entityID = p_entityID;
END $$
DELIMITER ;

-- Stored Procedure: Cập nhật entity
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_Update (
    IN p_entityID INT,
    IN p_entityName VARCHAR(255)
)
BEGIN
    UPDATE DatabaseEntity SET entityName = p_entityName WHERE entityID = p_entityID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả entity không bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_GetAll ()
BEGIN
    SELECT * FROM DatabaseEntity WHERE deletedAt IS NULL;
END $$
DELIMITER ;

-- Stored Procedure: Lấy tất cả entity bao gồm cả bị xóa mềm
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_GetAllIncludeDeleted ()
BEGIN
    SELECT * FROM DatabaseEntity;
END $$
DELIMITER ;

-- Stored Procedure: Lấy entity theo ID
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_GetById (
    IN p_entityID INT
)
BEGIN
    SELECT * FROM DatabaseEntity WHERE entityID = p_entityID;
END $$
DELIMITER ;

-- Stored Procedure: Lấy entity theo tên
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_GetByName (
    IN p_entityName VARCHAR(255)
)
BEGIN
    SELECT * FROM DatabaseEntity WHERE entityName = p_entityName;
END $$
DELIMITER ;

-- Stored Procedure: Tìm kiếm entity theo tên gần đúng
DELIMITER $$
CREATE PROCEDURE spDatabaseEntity_Search (
    IN p_searchTerm VARCHAR(255)
)
BEGIN
    SELECT * FROM DatabaseEntity WHERE entityName LIKE CONCAT('%', p_searchTerm, '%');
END $$
DELIMITER ;
