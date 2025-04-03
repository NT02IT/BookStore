-- spEnduser_Notification_Create
DELIMITER $$
CREATE PROCEDURE spEnduser_Notification_Create(
    IN p_enduserAccountID INT,
    IN p_notificationID INT
)
BEGIN
    INSERT INTO Enduser_Notification (enduserAccountID, notificationID)
    VALUES (p_enduserAccountID, p_notificationID);
END $$
DELIMITER ;

-- spEnduser_Notification_Delete
DELIMITER $$
CREATE PROCEDURE spEnduser_Notification_Delete(
    IN p_enduserAccountID INT,
    IN p_notificationID INT
)
BEGIN
    DELETE FROM Enduser_Notification WHERE enduserAccountID = p_enduserAccountID AND notificationID = p_notificationID;
END $$
DELIMITER ;

-- spEnduser_Notification_Update
DELIMITER $$
CREATE PROCEDURE spEnduser_Notification_Update(
    IN p_enduserAccountID INT,
    IN p_notificationID INT,
    IN p_readAt DATETIME
)
BEGIN
    UPDATE Enduser_Notification
    SET readAt = p_readAt
    WHERE enduserAccountID = p_enduserAccountID AND notificationID = p_notificationID;
END $$
DELIMITER ;

-- spEnduser_Notification_GetAll
DELIMITER $$
CREATE PROCEDURE spEnduser_Notification_GetAll()
BEGIN
    SELECT * FROM Enduser_Notification;
END $$
DELIMITER ;

-- spEnduser_Notification_GetById
DELIMITER $$
CREATE PROCEDURE spEnduser_Notification_GetById(
    IN p_enduserAccountID INT,
    IN p_notificationID INT
)
BEGIN
    SELECT * FROM Enduser_Notification WHERE enduserAccountID = p_enduserAccountID AND notificationID = p_notificationID;
END $$
DELIMITER ;