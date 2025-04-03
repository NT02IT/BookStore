-- spAdminAccount_Create
DELIMITER $$
CREATE PROCEDURE spAdminAccount_Create(
    IN p_adminProfileID INT,
    IN p_roleID INT,
    IN p_username VARCHAR(255),
    IN p_password BINARY(60)
)
BEGIN
    INSERT INTO AdminAccount (adminProfileID, roleID, username, password)
    VALUES (p_adminProfileID, p_roleID, p_username, p_password);
END $$
DELIMITER ;

-- spAdminAccount_Delete
DELIMITER $$
CREATE PROCEDURE spAdminAccount_Delete(
    IN p_adminAccountID INT
)
BEGIN
    DELETE FROM AdminAccount WHERE adminAccountID = p_adminAccountID;
END $$
DELIMITER ;

-- spAdminAccount_SoftDelete
DELIMITER $$
CREATE PROCEDURE spAdminAccount_SoftDelete(
    IN p_adminAccountID INT
)
BEGIN
    UPDATE AdminAccount SET deletedAt = NOW() WHERE adminAccountID = p_adminAccountID;
END $$
DELIMITER ;

-- spAdminAccount_Restore
DELIMITER $$
CREATE PROCEDURE spAdminAccount_Restore(
    IN p_adminAccountID INT
)
BEGIN
    UPDATE AdminAccount SET deletedAt = NULL WHERE adminAccountID = p_adminAccountID;
END $$
DELIMITER ;

-- spAdminAccount_Update
DELIMITER $$
CREATE PROCEDURE spAdminAccount_Update(
    IN p_adminAccountID INT,
    IN p_adminProfileID INT,
    IN p_roleID INT,
    IN p_username VARCHAR(255),
    IN p_password BINARY(60)
)
BEGIN
    UPDATE AdminAccount 
    SET adminProfileID = p_adminProfileID,
        roleID = p_roleID,
        username = p_username,
        password = p_password
    WHERE adminAccountID = p_adminAccountID;
END $$
DELIMITER ;

-- spAdminAccount_GetAll
DELIMITER $$
CREATE PROCEDURE spAdminAccount_GetAll()
BEGIN
    SELECT * FROM AdminAccount;
END $$
DELIMITER ;

-- spAdminAccount_GetAllIncludeDeleted
DELIMITER $$
CREATE PROCEDURE spAdminAccount_GetAllIncludeDeleted()
BEGIN
    SELECT * FROM AdminAccount;
END $$
DELIMITER ;

-- spAdminAccount_GetAllNotification
DELIMITER $$
CREATE PROCEDURE spAdminAccount_GetAllNotification(
    IN p_adminAccountID INT
)
BEGIN
    SELECT AN.adminAccountID, AN.notificationID, N.title, N.content, AN.readAt
    FROM Admin_Notification AN
    JOIN Notification N ON AN.notificationID = N.notificationID
    WHERE AN.adminAccountID = p_adminAccountID;
END $$
DELIMITER ;

-- spAdminAccount_GetById
DELIMITER $$
CREATE PROCEDURE spAdminAccount_GetById(
    IN p_adminAccountID INT
)
BEGIN
    SELECT * FROM AdminAccount WHERE adminAccountID = p_adminAccountID;
END $$
DELIMITER ;

-- spAdminAccount_GetByName
DELIMITER $$
CREATE PROCEDURE spAdminAccount_GetByName(
    IN p_username VARCHAR(255)
)
BEGIN
    SELECT * FROM AdminAccount WHERE username = p_username;
END $$
DELIMITER ;

-- spAdminAccount_Search
DELIMITER $$
CREATE PROCEDURE spAdminAccount_Search(
    IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * 
    FROM AdminAccount
    WHERE username LIKE CONCAT('%', p_keyword, '%');
END $$
DELIMITER ;
