DELIMITER //
CREATE PROCEDURE spBookAuthor_Create (
    IN p_authorName VARCHAR(255)
)
BEGIN
    INSERT INTO BookAuthor (authorName)
    VALUES (p_authorName);
END //

CREATE PROCEDURE spBookAuthor_Delete (
    IN p_authorID INT
)
BEGIN
    DELETE FROM BookAuthor WHERE authorID = p_authorID;
END //

CREATE PROCEDURE spBookAuthor_Update (
    IN p_authorID INT,
    IN p_authorName VARCHAR(255)
)
BEGIN
    UPDATE BookAuthor 
    SET authorName = p_authorName
    WHERE authorID = p_authorID;
END //

CREATE PROCEDURE spBookAuthor_GetAll ()
BEGIN
    SELECT * FROM BookAuthor;
END //

CREATE PROCEDURE spBookAuthor_GetAllBookInfo ()
BEGIN
    SELECT 
        b.*
    FROM BookInfo_Author ba
    JOIN BookInfo b ON ba.bookID = b.bookID
    JOIN BookAuthor a ON ba.authorID = a.authorID
    WHERE b.deletedAt IS NULL;
END //

CREATE PROCEDURE spBookAuthor_GetById (
    IN p_authorID INT
)
BEGIN
    SELECT * FROM BookAuthor WHERE authorID = p_authorID;
END //

CREATE PROCEDURE spBookAuthor_Search (
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * FROM BookAuthor 
    WHERE authorName LIKE CONCAT('%', p_keyword, '%');
END //
DELIMITER ;
