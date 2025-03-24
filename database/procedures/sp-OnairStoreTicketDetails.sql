DELIMITER //

CREATE PROCEDURE sp_InsertOnairStoreTicketDetails(
    IN p_onairStoreTicketID INT,
    IN p_warehouseImportDetailsID INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO OnairStoreTicketDetails (onairStoreTicketID, warehouseImportDetailsID, quantity)
    VALUES (p_onairStoreTicketID, p_warehouseImportDetailsID, p_quantity);
END //

CREATE PROCEDURE sp_UpdateOnairStoreTicketDetails(
    IN p_onairStoreTicketDetailsID INT,
    IN p_onairStoreTicketID INT,
    IN p_warehouseImportDetailsID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE OnairStoreTicketDetails
    SET onairStoreTicketID = p_onairStoreTicketID,
        warehouseImportDetailsID = p_warehouseImportDetailsID,
        quantity = p_quantity
    WHERE onairStoreTicketDetailsID = p_onairStoreTicketDetailsID;
END //

CREATE PROCEDURE sp_DeleteOnairStoreTicketDetails(
    IN p_onairStoreTicketDetailsID INT
)
BEGIN
    DELETE FROM OnairStoreTicketDetails WHERE onairStoreTicketDetailsID = p_onairStoreTicketDetailsID;
END //

CREATE PROCEDURE sp_GetAllOnairStoreTicketDetails()
BEGIN
    SELECT * FROM OnairStoreTicketDetails;
END //

DELIMITER ;
