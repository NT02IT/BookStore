DELIMITER //

CREATE PROCEDURE sp_InsertCart(
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO Cart (enduserAccountID, bookOnStoreID, quantity)
    VALUES (p_enduserAccountID, p_bookOnStoreID, p_quantity);
END //

CREATE PROCEDURE sp_UpdateCart(
    IN p_cartID INT,
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE Cart
    SET enduserAccountID = p_enduserAccountID,
        bookOnStoreID = p_bookOnStoreID,
        quantity = p_quantity
    WHERE cartID = p_cartID;
END //

CREATE PROCEDURE sp_DeleteCart(
    IN p_cartID INT
)
BEGIN
    DELETE FROM Cart WHERE cartID = p_cartID;
END //

-- Xóa toàn bộ giỏ hàng của một người dùng
CREATE PROCEDURE sp_ClearCart(
    IN p_enduserAccountID INT
)
BEGIN
    DELETE FROM Cart WHERE enduserAccountID = p_enduserAccountID;
END //

-- Lấy toàn bộ giỏ hàng của một người dùng
CREATE PROCEDURE sp_GetCartByUserID(
    IN p_enduserAccountID INT
)
BEGIN
    SELECT * FROM Cart WHERE enduserAccountID = p_enduserAccountID;
END //

-- Lấy giỏ hàng theo ID của cart
CREATE PROCEDURE sp_GetCartByID(
    IN p_cartID INT
)
BEGIN
    SELECT * FROM Cart WHERE cartID = p_cartID;
END //

-- Kiểm tra xem sản phẩm có tồn tại trong giỏ hàng của người dùng không
CREATE PROCEDURE sp_CheckCartItemExists(
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT
)
BEGIN
    SELECT COUNT(*) AS itemExists 
    FROM Cart 
    WHERE enduserAccountID = p_enduserAccountID 
    AND bookOnStoreID = p_bookOnStoreID;
END //

-- Lấy tổng số lượng sản phẩm và tổng tiền của giỏ hàng
CREATE PROCEDURE sp_GetCartSummary(
    IN p_enduserAccountID INT
)
BEGIN
    SELECT 
        SUM(quantity) AS totalItems, 
        SUM(quantity * bos.sellingPrice) AS totalPrice
    FROM Cart c
    JOIN BookOnStore bos ON c.bookOnStoreID = bos.bookOnStoreID
    WHERE c.enduserAccountID = p_enduserAccountID;
END //

DELIMITER ;
