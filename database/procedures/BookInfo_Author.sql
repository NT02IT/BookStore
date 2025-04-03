DELIMITER //

-- Thêm một bản ghi vào bảng BookInfo_Author
CREATE PROCEDURE spBookInfo_Author_Create (
    IN p_bookID INT,
    IN p_authorID INT
)
BEGIN
    INSERT INTO BookInfo_Author (bookID, authorID)
    VALUES (p_bookID, p_authorID);
END //

-- Xóa một bản ghi khỏi bảng BookInfo_Author
CREATE PROCEDURE spBookInfo_Author_Delete (
    IN p_bookID INT,
    IN p_authorID INT
)
BEGIN
    DELETE FROM BookInfo_Author 
    WHERE bookID = p_bookID AND authorID = p_authorID;
END //

-- Cập nhật author của một book (Xóa bản ghi cũ và thêm bản ghi mới)
CREATE PROCEDURE spBookInfo_Author_Update (
    IN p_oldBookID INT,
    IN p_oldAuthorID INT,
    IN p_newBookID INT,
    IN p_newAuthorID INT
)
BEGIN
    DELETE FROM BookInfo_Author 
    WHERE bookID = p_oldBookID AND authorID = p_oldAuthorID;
    
    INSERT INTO BookInfo_Author (bookID, authorID)
    VALUES (p_newBookID, p_newAuthorID);
END //

-- Lấy tất cả các bản ghi từ bảng BookInfo_Author
CREATE PROCEDURE spBookInfo_Author_GetAll ()
BEGIN
    SELECT * FROM BookInfo_Author;
END //

-- Lấy danh sách tác giả của một sách theo bookID
CREATE PROCEDURE spBookInfo_Author_GetById (
    IN p_bookID INT
)
BEGIN
    SELECT a.authorID, a.authorName
    FROM BookInfo_Author ba
    JOIN BookAuthor a ON ba.authorID = a.authorID
    WHERE ba.bookID = p_bookID;
END //

DELIMITER ;
