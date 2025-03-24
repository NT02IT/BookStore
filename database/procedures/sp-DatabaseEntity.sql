DELIMITER //

CREATE PROCEDURE sp_InsertDatabaseEntity(
    IN p_entityName VARCHAR(255)
)
BEGIN
    INSERT INTO DatabaseEntity (entityName, isDelete)
    VALUES (p_entityName, FALSE);
END //

CREATE PROCEDURE sp_UpdateDatabaseEntity(
    IN p_entityID INT,
    IN p_entityName VARCHAR(255)
)
BEGIN
    UPDATE DatabaseEntity
    SET entityName = p_entityName
    WHERE entityID = p_entityID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteDatabaseEntity(
    IN p_entityID INT
)
BEGIN
    DELETE FROM DatabaseEntity
    WHERE entityID = p_entityID;
END //

CREATE PROCEDURE sp_SoftDeleteDatabaseEntity(
    IN p_entityID INT
)
BEGIN
    UPDATE DatabaseEntity
    SET isDelete = TRUE
    WHERE entityID = p_entityID;
END //

CREATE PROCEDURE sp_GetAllDatabaseEntity()
BEGIN
    SELECT * FROM DatabaseEntity
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllDatabaseEntityIncludingDeleted()
BEGIN
    SELECT * FROM DatabaseEntity;
END //

CREATE PROCEDURE sp_GetDatabaseEntityByID(
    IN p_entityID INT
)
BEGIN
    SELECT * FROM DatabaseEntity
    WHERE entityID = p_entityID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreDatabaseEntity(
    IN p_entityID INT
)
BEGIN
    UPDATE DatabaseEntity
    SET isDelete = FALSE
    WHERE entityID = p_entityID;
END //

DELIMITER ;