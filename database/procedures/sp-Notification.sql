DELIMITER //

CREATE PROCEDURE sp_InsertNotification(
    IN p_adminAccountID INT,
    IN p_title VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_content TEXT CHARACTER SET utf8mb4
)
BEGIN
    INSERT INTO Notification (adminAccountID, title, content, isRead)
    VALUES (p_adminAccountID, p_title, p_content, FALSE);
END //

CREATE PROCEDURE sp_UpdateNotification(
    IN p_notificationID INT,
    IN p_title VARCHAR(255) CHARACTER SET utf8mb4,
    IN p_content TEXT CHARACTER SET utf8mb4
)
BEGIN
    UPDATE Notification
    SET title = p_title,
        content = p_content
    WHERE notificationID = p_notificationID;
END //

CREATE PROCEDURE sp_DeleteNotification(
    IN p_notificationID INT
)
BEGIN
    DELETE FROM Notification
    WHERE notificationID = p_notificationID;
END //

CREATE PROCEDURE sp_MarkNotificationAsRead(
    IN p_notificationID INT
)
BEGIN
    UPDATE Notification
    SET isRead = TRUE
    WHERE notificationID = p_notificationID;
END //

CREATE PROCEDURE sp_GetAllNotification(
    IN p_adminAccountID INT
)
BEGIN
    SELECT * FROM Notification
    WHERE adminAccountID = p_adminAccountID;
END //

CREATE PROCEDURE sp_GetUnreadNotification(
    IN p_adminAccountID INT
)
BEGIN
    SELECT * FROM Notification
    WHERE adminAccountID = p_adminAccountID AND isRead = FALSE;
END //

CREATE PROCEDURE sp_GetNotificationByID(
    IN p_notificationID INT
)
BEGIN
    SELECT * FROM Notification
    WHERE notificationID = p_notificationID;
END //

DELIMITER ;