DELIMITER //

CREATE PROCEDURE sp_InsertBookOnStore(
    IN p_ISBN VARCHAR(13),
    IN p_sellingPrice DECIMAL(15,2),
    IN p_quantity INT
)
BEGIN
    INSERT INTO BookOnStore (ISBN, sellingPrice, quantity)
    VALUES (p_ISBN, p_sellingPrice, p_quantity);
END //

CREATE PROCEDURE sp_UpdateBookOnStore(
    IN p_bookOnStoreID INT,
    IN p_ISBN VARCHAR(13),
    IN p_sellingPrice DECIMAL(15,2),
    IN p_quantity INT
)
BEGIN
    UPDATE BookOnStore
    SET ISBN = p_ISBN,
        sellingPrice = p_sellingPrice,
        quantity = p_quantity
    WHERE bookOnStoreID = p_bookOnStoreID;
END //

CREATE PROCEDURE sp_GetAllBookOnStore()
BEGIN
    SELECT * FROM BookOnStore;
END //

-- Lấy thông tin sách trên cửa hàng theo ID
CREATE PROCEDURE sp_GetBookOnStoreByID(
    IN p_bookOnStoreID INT
)
BEGIN
    SELECT * FROM BookOnStore WHERE bookOnStoreID = p_bookOnStoreID;
END //

-- Lấy thông tin sách trên cửa hàng theo ISBN
CREATE PROCEDURE sp_GetBookOnStoreByISBN(
    IN p_ISBN VARCHAR(13)
)
BEGIN
    SELECT * FROM BookOnStore WHERE ISBN = p_ISBN;
END //

-- Cập nhật số lượng sách trên cửa hàng
CREATE PROCEDURE sp_UpdateBookOnStoreQuantity(
    IN p_bookOnStoreID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE BookOnStore 
    SET quantity = p_quantity
    WHERE bookOnStoreID = p_bookOnStoreID;
END //

DELIMITER ;
