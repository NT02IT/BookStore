DELIMITER //

CREATE PROCEDURE sp_InsertOrderDetails(
    IN p_orderID INT,
    IN p_bookOnStoreID INT,
    IN p_purchasePrice INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO OrderDetails (orderID, bookOnStoreID, purchasePrice, quantity)
    VALUES (p_orderID, p_bookOnStoreID, p_purchasePrice, p_quantity);
END //

CREATE PROCEDURE sp_UpdateOrderDetails(
    IN p_orderDetailsID INT,
    IN p_orderID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE OrderDetails
    SET orderID = p_orderID,
        bookOnStoreID = p_bookOnStoreID,
        quantity = p_quantity
    WHERE orderDetailsID = p_orderDetailsID;
END //

CREATE PROCEDURE sp_DeleteOrderDetails(
    IN p_orderDetailsID INT
)
BEGIN
    DELETE FROM OrderDetails WHERE orderDetailsID = p_orderDetailsID;
END //

CREATE PROCEDURE sp_GetAllOrderDetails()
BEGIN
    SELECT * FROM OrderDetails;
END //

DELIMITER ;
