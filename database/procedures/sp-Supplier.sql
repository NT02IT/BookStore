DELIMITER //

CREATE PROCEDURE sp_InsertSupplier(
    IN p_supplierName VARCHAR(255),
    IN p_supplierAddress VARCHAR(255),
    IN p_phoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO Supplier (supplierName, supplierAddress, phoneNumber)
    VALUES (p_supplierName, p_supplierAddress, p_phoneNumber);
END //

CREATE PROCEDURE sp_UpdateSupplier(
    IN p_supplierID INT,
    IN p_supplierName VARCHAR(255),
    IN p_supplierAddress VARCHAR(255),
    IN p_phoneNumber VARCHAR(15)
)
BEGIN
    UPDATE Supplier
    SET supplierName = p_supplierName,
        supplierAddress = p_supplierAddress,
        phoneNumber = p_phoneNumber
    WHERE supplierID = p_supplierID;
END //

CREATE PROCEDURE sp_DeleteSupplier(
    IN p_supplierID INT
)
BEGIN
    DELETE FROM Supplier WHERE supplierID = p_supplierID;
END //

CREATE PROCEDURE sp_GetAllSupplier()
BEGIN
    SELECT * FROM Supplier;
END //

DELIMITER ;
