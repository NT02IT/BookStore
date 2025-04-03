DELIMITER //

-- Thêm một bản ghi vào bảng BookRating
CREATE PROCEDURE spBookRating_Create (
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_rate INT,
    IN p_comment TEXT
)
BEGIN
    INSERT INTO BookRating (enduserAccountID, bookOnStoreID, rate, comment, createdAt)
    VALUES (p_enduserAccountID, p_bookOnStoreID, p_rate, p_comment, NOW());
END //

-- Xóa một bản ghi khỏi bảng BookRating theo bookRatingID
CREATE PROCEDURE spBookRating_Delete (
    IN p_bookRatingID INT
)
BEGIN
    DELETE FROM BookRating WHERE bookRatingID = p_bookRatingID;
END //

-- Cập nhật thông tin cho bảng BookRating
CREATE PROCEDURE spBookRating_Update (
    IN p_bookRatingID INT,
    IN p_rate INT,
    IN p_comment TEXT
)
BEGIN
    UPDATE BookRating 
    SET rate = p_rate, comment = p_comment
    WHERE bookRatingID = p_bookRatingID;
END //

-- Lấy tất cả các bản ghi từ bảng BookRating
CREATE PROCEDURE spBookRating_GetAll ()
BEGIN
    SELECT * FROM BookRating;
END //

-- Lấy thông tin chi tiết của một bản ghi theo bookRatingID
CREATE PROCEDURE spBookRating_GetById (
    IN p_bookRatingID INT
)
BEGIN
    SELECT * FROM BookRating WHERE bookRatingID = p_bookRatingID;
END //

DELIMITER ;
