DELIMITER //

-- Thêm một bản ghi vào bảng BookInfo_Publisher
CREATE PROCEDURE spBookInfo_Publisher_Create (
    IN p_bookID INT,
    IN p_publisherID INT,
    IN p_yearOfPublication INT
)
BEGIN
    INSERT INTO BookInfo_Publisher (bookID, publisherID, yearOfPublication)
    VALUES (p_bookID, p_publisherID, p_yearOfPublication);
END //

-- Xóa một bản ghi khỏi bảng BookInfo_Publisher theo ID
CREATE PROCEDURE spBookInfo_Publisher_Delete (
    IN p_bookInfoPublisherID INT
)
BEGIN
    DELETE FROM BookInfo_Publisher 
    WHERE bookInfoPublisherID = p_bookInfoPublisherID;
END //

-- Cập nhật thông tin nhà xuất bản của một sách
CREATE PROCEDURE spBookInfo_Publisher_Update (
    IN p_bookInfoPublisherID INT,
    IN p_bookID INT,
    IN p_publisherID INT,
    IN p_yearOfPublication INT
)
BEGIN
    UPDATE BookInfo_Publisher 
    SET bookID = p_bookID, 
        publisherID = p_publisherID, 
        yearOfPublication = p_yearOfPublication
    WHERE bookInfoPublisherID = p_bookInfoPublisherID;
END //

-- Lấy tất cả các bản ghi từ bảng BookInfo_Publisher
CREATE PROCEDURE spBookInfo_Publisher_GetAll ()
BEGIN
    SELECT * FROM BookInfo_Publisher;
END //

-- Lấy thông tin nhà xuất bản của một sách theo bookInfoPublisherID
CREATE PROCEDURE spBookInfo_Publisher_GetById (
    IN p_bookInfoPublisherID INT
)
BEGIN
    SELECT * FROM BookInfo_Publisher WHERE bookInfoPublisherID = p_bookInfoPublisherID;
END //

DELIMITER ;
