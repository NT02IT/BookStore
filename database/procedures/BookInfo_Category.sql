DELIMITER //

-- Thêm một bản ghi vào bảng BookInfo_Category
CREATE PROCEDURE spBookInfo_Category_Create (
    IN p_bookID INT,
    IN p_categoryID INT
)
BEGIN
    INSERT INTO BookInfo_Category (bookID, categoryID)
    VALUES (p_bookID, p_categoryID);
END //

-- Xóa một bản ghi khỏi bảng BookInfo_Category
CREATE PROCEDURE spBookInfo_Category_Delete (
    IN p_bookID INT,
    IN p_categoryID INT
)
BEGIN
    DELETE FROM BookInfo_Category 
    WHERE bookID = p_bookID AND categoryID = p_categoryID;
END //

-- Cập nhật category của một book (Cần xóa và thêm lại do bảng này chỉ có khóa chính)
CREATE PROCEDURE spBookInfo_Category_Update (
    IN p_oldBookID INT,
    IN p_oldCategoryID INT,
    IN p_newBookID INT,
    IN p_newCategoryID INT
)
BEGIN
    DELETE FROM BookInfo_Category 
    WHERE bookID = p_oldBookID AND categoryID = p_oldCategoryID;
    
    INSERT INTO BookInfo_Category (bookID, categoryID)
    VALUES (p_newBookID, p_newCategoryID);
END //

-- Lấy tất cả các bản ghi từ bảng BookInfo_Category
CREATE PROCEDURE spBookInfo_Category_GetAll ()
BEGIN
    SELECT * FROM BookInfo_Category;
END //

-- Lấy danh mục của một sách theo bookID
CREATE PROCEDURE spBookInfo_Category_GetById (
    IN p_bookID INT
)
BEGIN
    SELECT c.categoryID, c.categoryName
    FROM BookInfo_Category bc
    JOIN BookCategory c ON bc.categoryID = c.categoryID
    WHERE bc.bookID = p_bookID;
END //

DELIMITER ;
