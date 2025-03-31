DELIMITER //

CREATE PROCEDURE sp_InsertCategory(
    IN p_categoryName VARCHAR(255),
    IN p_dateCreate DATETIME
)
BEGIN
    INSERT INTO Category(categoryName, dateCreate)
    VALUES (p_categoryName, p_dateCreate);
    
    SELECT LAST_INSERT_ID() AS newCategoryID;
END //

CREATE PROCEDURE sp_UpdateCategory(
    IN p_categoryID INT,
    IN p_categoryName VARCHAR(255),
    IN p_dateCreate DATETIME
)
BEGIN
    UPDATE Category
    SET categoryName = p_categoryName,
        dateCreate = p_dateCreate
    WHERE categoryID = p_categoryID;
END //

CREATE PROCEDURE sp_DeleteCategory(
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

CREATE PROCEDURE sp_RestoreCategory(
    IN p_categoryID INT
)
BEGIN
    UPDATE Category
    SET isDelete = FALSE
    WHERE categoryID = p_categoryID;
END //

CREATE PROCEDURE sp_GetAllCategory()
BEGIN
    SELECT * FROM Category
    WHERE isDelete = FALSE
    ORDER BY categoryName;
END //

CREATE PROCEDURE sp_GetAllCategoryIncludingDeleted()
BEGIN
    SELECT * FROM Category
    ORDER BY categoryName;
END //

CREATE PROCEDURE sp_GetCategoryByID(
    IN p_categoryID INT
)
BEGIN
    SELECT * FROM Category
    WHERE categoryID = p_categoryID;
END //

CREATE PROCEDURE sp_SearchCategories(
    IN p_searchTerm VARCHAR(255)
)
BEGIN
    SELECT * FROM Category
    WHERE categoryName LIKE CONCAT('%', p_searchTerm, '%')
    AND isDelete = FALSE
    ORDER BY categoryName;
END //

CREATE PROCEDURE sp_CheckCategoryExists(
    IN p_categoryName VARCHAR(255)
)
BEGIN
    SELECT categoryID FROM Category
    WHERE categoryName = p_categoryName
    AND isDelete = FALSE;
END //

DELIMITER ;