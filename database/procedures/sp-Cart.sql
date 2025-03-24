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

CREATE PROCEDURE sp_GetAllCart()
BEGIN
    SELECT * FROM Cart;
END //

DELIMITER ;
