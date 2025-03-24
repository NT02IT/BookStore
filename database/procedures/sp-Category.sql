DELIMITER //

CREATE PROCEDURE sp_InsertCategory(
    IN p_categoryName VARCHAR(255) CHARACTER SET utf8mb4
)
BEGIN
    INSERT INTO Category (categoryName, isDelete)
    VALUES (p_categoryName, FALSE);
END //

CREATE PROCEDURE sp_UpdateCategory(
    IN p_categoryID INT,
    IN p_categoryName VARCHAR(255) CHARACTER SET utf8mb4
)
BEGIN
    UPDATE Category
    SET roleName = p_categoryName
    WHERE categoryID = p_categoryID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_HardDeleteCategory(
    IN p_categoryID INT
)
BEGIN
    DELETE FROM Category
    WHERE categoryID = p_categoryID;
END //

CREATE PROCEDURE sp_SoftDeleteCategory(
    IN p_categoryID INT
)
BEGIN
    UPDATE Category
    SET isDelete = TRUE
    WHERE categoryID = p_categoryID;
END //

CREATE PROCEDURE sp_GetAllCategory()
BEGIN
    SELECT * FROM Category
    WHERE isDelete = FALSE;
END //

CREATE PROCEDURE sp_GetAllCategoryIncludingDeleted()
BEGIN
    SELECT * FROM Category;
END //

CREATE PROCEDURE sp_GetCategoryByID(
    IN p_categoryID INT
)
BEGIN
    SELECT * FROM Category
    WHERE categoryID = p_categoryID AND isDelete = FALSE;
END //

CREATE PROCEDURE sp_RestoreCategory(
    IN p_categoryID INT
)
BEGIN
    UPDATE Category
    SET isDelete = FALSE
    WHERE categoryID = p_categoryID;
END //

DELIMITER ;