DELIMITER //

CREATE PROCEDURE sp_InsertOnairStoreTicket(
    IN p_adminAccountID INT,
    IN p_ticketStatus INT
)
BEGIN
    INSERT INTO OnairStoreTicket (adminAccountID, ticketStatus)
    VALUES (p_adminAccountID, p_ticketStatus);
END //

CREATE PROCEDURE sp_UpdateOnairStoreTicket(
    IN p_onairStoreTicketID INT,
    IN p_adminAccountID INT,
    IN p_ticketStatus INT
)
BEGIN
    UPDATE OnairStoreTicket
    SET adminAccountID = p_adminAccountID,
        ticketStatus = p_ticketStatus
    WHERE onairStoreTicketID = p_onairStoreTicketID;
END //

CREATE PROCEDURE sp_DeleteOnairStoreTicket(
    IN p_onairStoreTicketID INT
)
BEGIN
    DELETE FROM OnairStoreTicket WHERE onairStoreTicketID = p_onairStoreTicketID;
END //

CREATE PROCEDURE sp_GetAllOnairStoreTicket()
BEGIN
    SELECT * FROM OnairStoreTicket;
END //

DELIMITER ;
