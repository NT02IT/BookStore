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

CREATE PROCEDURE sp_DeleteBookOnStore(
    IN p_bookOnStoreID INT
)
BEGIN
    DELETE FROM BookOnStore WHERE bookOnStoreID = p_bookOnStoreID;
END //

CREATE PROCEDURE sp_GetAllBookOnStore()
BEGIN
    SELECT * FROM BookOnStore;
END //

DELIMITER ;
