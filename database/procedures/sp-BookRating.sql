DELIMITER //

CREATE PROCEDURE sp_InsertBookRating(
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_rate INT,
    IN p_comment TEXT
)
BEGIN
    INSERT INTO BookRating (enduserAccountID, bookOnStoreID, rate, comment)
    VALUES (p_enduserAccountID, p_bookOnStoreID, p_rate, p_comment);
END //

CREATE PROCEDURE sp_UpdateBookRating(
    IN p_bookRatingID INT,
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_rate INT,
    IN p_comment TEXT
)
BEGIN
    UPDATE BookRating
    SET enduserAccountID = p_enduserAccountID,
        bookOnStoreID = p_bookOnStoreID,
        rate = p_rate,
        comment = p_comment
    WHERE bookRatingID = p_bookRatingID;
END //

CREATE PROCEDURE sp_DeleteBookRating(
    IN p_bookRatingID INT
)
BEGIN
    DELETE FROM BookRating WHERE bookRatingID = p_bookRatingID;
END //

CREATE PROCEDURE sp_GetAllBookRating()
BEGIN
    SELECT * FROM BookRating;
END //

DELIMITER ;