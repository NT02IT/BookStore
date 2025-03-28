DELIMITER //

CREATE PROCEDURE sp_InsertBookInfo(
    IN p_ISBN VARCHAR(13),
    IN p_categoryID INT,
    IN p_bookTitle VARCHAR(255),
    IN p_bookAuthor VARCHAR(255),
    IN p_yearOfPublication INT,
    IN p_publisher VARCHAR(255),
    IN p_imagesURL VARCHAR(255),
    IN p_bookDesc TEXT
)
BEGIN
    INSERT INTO BookInfo (ISBN, categoryID, bookTitle, bookAuthor, yearOfPublication, publisher, imagesURL, bookDesc, isDelete)
    VALUES (p_ISBN, p_categoryID, p_bookTitle, p_bookAuthor, p_yearOfPublication, p_publisher, p_imagesURL, p_bookDesc, FALSE);
END //

CREATE PROCEDURE sp_UpdateBookInfo(
    IN p_ISBN VARCHAR(13),
    IN p_categoryID INT,
    IN p_bookTitle VARCHAR(255),
    IN p_bookAuthor VARCHAR(255),
    IN p_yearOfPublication INT,
    IN p_publisher VARCHAR(255),
    IN p_imagesURL VARCHAR(255),
    IN p_bookDesc TEXT
)
BEGIN
    UPDATE BookInfo
    SET categoryID = p_categoryID,
        bookTitle = p_bookTitle,
        bookAuthor = p_bookAuthor,
        yearOfPublication = p_yearOfPublication,
        publisher = p_publisher,
        imagesURL = p_imagesURL,
        bookDesc = p_bookDesc
    WHERE ISBN = p_ISBN;
END //

CREATE PROCEDURE sp_DeleteBookInfo(
    IN p_ISBN VARCHAR(13)
)
BEGIN
    DELETE FROM BookInfo WHERE ISBN = p_ISBN;
END //

CREATE PROCEDURE sp_SoftDeleteBookInfo(
    IN p_ISBN VARCHAR(13)
)
BEGIN
    UPDATE BookInfo SET isDelete = TRUE WHERE ISBN = p_ISBN;
END //

CREATE PROCEDURE sp_GetAllBookInfo()
BEGIN
    SELECT * FROM BookInfo WHERE isDelete = FALSE;
END //

-- Khôi phục sách đã bị đánh dấu xóa
CREATE PROCEDURE sp_RestoreBookInfo(
    IN p_ISBN VARCHAR(13)
)
BEGIN
    UPDATE BookInfo SET isDelete = FALSE WHERE ISBN = p_ISBN;
END //

-- Lấy tất cả thông tin sách, bao gồm cả sách đã bị xóa mềm
CREATE PROCEDURE sp_GetAllBookInfoIncludingDeleted()
BEGIN
    SELECT * FROM BookInfo;
END //

-- Tìm kiếm sách theo ISBN
CREATE PROCEDURE sp_GetBookInfoByISBN(
    IN p_ISBN VARCHAR(13)
)
BEGIN
    SELECT * FROM BookInfo WHERE ISBN = p_ISBN;
END //

-- Tìm kiếm sách theo từ khóa (tìm trong tiêu đề, tác giả, nhà xuất bản)
CREATE PROCEDURE sp_SearchBooks(
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * 
    FROM BookInfo
    WHERE (bookTitle LIKE CONCAT('%', p_keyword, '%')
        OR bookAuthor LIKE CONCAT('%', p_keyword, '%')
        OR publisher LIKE CONCAT('%', p_keyword, '%'))
    AND isDelete = FALSE;
END //

DELIMITER ;
