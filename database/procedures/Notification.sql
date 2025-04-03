-- spNotification_Create
DELIMITER $$
CREATE PROCEDURE spNotification_Create(
    IN p_title VARCHAR(255),
    IN p_content TEXT
)
BEGIN
    INSERT INTO Notification (title, content)
    VALUES (p_title, p_content);
END $$
DELIMITER ;

-- spNotification_Delete
DELIMITER $$
CREATE PROCEDURE spNotification_Delete(
    IN p_notificationID INT
)
BEGIN
    DELETE FROM Notification WHERE notificationID = p_notificationID;
END $$
DELIMITER ;

-- spNotification_Update
DELIMITER $$
CREATE PROCEDURE spNotification_Update(
    IN p_notificationID INT,
    IN p_title VARCHAR(255),
    IN p_content TEXT
)
BEGIN
    UPDATE Notification
    SET title = p_title,
        content = p_content
    WHERE notificationID = p_notificationID;
END $$
DELIMITER ;

-- spNotification_GetAll
DELIMITER $$
CREATE PROCEDURE spNotification_GetAll()
BEGIN
    SELECT * FROM Notification;
END $$
DELIMITER ;

-- spNotification_GetById
DELIMITER $$
CREATE PROCEDURE spNotification_GetById(
    IN p_notificationID INT
)
BEGIN
    SELECT * FROM Notification WHERE notificationID = p_notificationID;
END $$
DELIMITER ;
