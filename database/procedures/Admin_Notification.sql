-- spAdmin_Notification_Create
DELIMITER $$
CREATE PROCEDURE spAdmin_Notification_Create(
    IN p_adminAccountID INT,
    IN p_notificationID INT
)
BEGIN
    INSERT INTO Admin_Notification (adminAccountID, notificationID)
    VALUES (p_adminAccountID, p_notificationID);
END $$
DELIMITER ;

-- spAdmin_Notification_Delete
DELIMITER $$
CREATE PROCEDURE spAdmin_Notification_Delete(
    IN p_adminAccountID INT,
    IN p_notificationID INT
)
BEGIN
    DELETE FROM Admin_Notification WHERE adminAccountID = p_adminAccountID AND notificationID = p_notificationID;
END $$
DELIMITER ;

-- spAdmin_Notification_Update
DELIMITER $$
CREATE PROCEDURE spAdmin_Notification_Update(
    IN p_adminAccountID INT,
    IN p_notificationID INT,
    IN p_readAt DATETIME
)
BEGIN
    UPDATE Admin_Notification
    SET readAt = p_readAt
    WHERE adminAccountID = p_adminAccountID AND notificationID = p_notificationID;
END $$
DELIMITER ;

-- spAdmin_Notification_GetAll
DELIMITER $$
CREATE PROCEDURE spAdmin_Notification_GetAll()
BEGIN
    SELECT * FROM Admin_Notification;
END $$
DELIMITER ;

-- spAdmin_Notification_GetById
DELIMITER $$
CREATE PROCEDURE spAdmin_Notification_GetById(
    IN p_adminAccountID INT,
    IN p_notificationID INT
)
BEGIN
    SELECT * FROM Admin_Notification WHERE adminAccountID = p_adminAccountID AND notificationID = p_notificationID;
END $$
DELIMITER ;
