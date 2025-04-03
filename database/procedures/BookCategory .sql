DELIMITER $$
CREATE PROCEDURE spBookCategory_Create(
    IN p_categoryName VARCHAR(255)
)
BEGIN
    INSERT INTO BookCategory (categoryName, createdAt)
    VALUES (p_categoryName, NOW());
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_Delete(
    IN p_categoryID INT
)
BEGIN
    DELETE FROM BookCategory WHERE categoryID = p_categoryID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_SoftDelete(
    IN p_categoryID INT
)
BEGIN
    UPDATE BookCategory 
    SET deletedAt = NOW() 
    WHERE categoryID = p_categoryID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_Restore(
    IN p_categoryID INT
)
BEGIN
    UPDATE BookCategory 
    SET deletedAt = NULL 
    WHERE categoryID = p_categoryID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_Update(
    IN p_categoryID INT,
    IN p_categoryName VARCHAR(255)
)
BEGIN
    UPDATE BookCategory 
    SET categoryName = p_categoryName
    WHERE categoryID = p_categoryID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_GetAll()
BEGIN
    SELECT * FROM BookCategory WHERE deletedAt IS NULL;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_GetAllIncludeDeleted()
BEGIN
    SELECT * FROM BookCategory;
END $$
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spBookCategory_GetAllBookInfo ()
BEGIN
    SELECT 
        b.*
    FROM BookInfo_Category bc
    JOIN BookInfo b ON bc.bookID = b.bookID
    JOIN BookCategory c ON bc.categoryID = c.categoryID
    WHERE b.deletedAt IS NULL AND c.deletedAt IS NULL;
END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_GetById(
    IN p_categoryID INT
)
BEGIN
    SELECT * FROM BookCategory WHERE categoryID = p_categoryID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_GetByName(
    IN p_categoryName VARCHAR(255)
)
BEGIN
    SELECT * FROM BookCategory 
    WHERE categoryName = p_categoryName;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spBookCategory_Search(
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * FROM BookCategory 
    WHERE categoryName LIKE CONCAT('%', p_keyword, '%');
END $$
DELIMITER ;
