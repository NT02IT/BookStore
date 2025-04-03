DELIMITER //
CREATE PROCEDURE spBookPublisher_Create (
    IN p_publisherName VARCHAR(255)
)
BEGIN
    INSERT INTO BookPublisher (publisherName)
    VALUES (p_publisherName);
END //

CREATE PROCEDURE spBookPublisher_Delete (
    IN p_publisherID INT
)
BEGIN
    DELETE FROM BookPublisher WHERE publisherID = p_publisherID;
END //

CREATE PROCEDURE spBookPublisher_Update (
    IN p_publisherID INT,
    IN p_publisherName VARCHAR(255)
)
BEGIN
    UPDATE BookPublisher 
    SET publisherName = p_publisherName
    WHERE publisherID = p_publisherID;
END //

CREATE PROCEDURE spBookPublisher_GetAll ()
BEGIN
    SELECT * FROM BookPublisher;
END //

CREATE PROCEDURE spBookPublisher_GetAllBookInfo ()
BEGIN
    SELECT 
        b.*
    FROM BookInfo_Publisher bp
    JOIN BookInfo b ON bp.bookID = b.bookID
    JOIN BookPublisher p ON bp.publisherID = p.publisherID
    WHERE b.deletedAt IS NULL AND p.deletedAt IS NULL;
END //

CREATE PROCEDURE spBookPublisher_GetById (
    IN p_publisherID INT
)
BEGIN
    SELECT * FROM BookPublisher WHERE publisherID = p_publisherID;
END //

CREATE PROCEDURE spBookPublisher_Search (
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * FROM BookPublisher 
    WHERE publisherName LIKE CONCAT('%', p_keyword, '%');
END //
DELIMITER ;
