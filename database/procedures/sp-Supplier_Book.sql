DELIMITER //

CREATE PROCEDURE sp_InsertSupplierBook(
    IN p_supplierID INT,
    IN p_ISBN VARCHAR(13)
)
BEGIN
    INSERT INTO Supplier_Book (supplierID, ISBN)
    VALUES (p_supplierID, p_ISBN);
END //

CREATE PROCEDURE sp_UpdateSupplierBook(
    IN p_supplierBookID INT,
    IN p_supplierID INT,
    IN p_ISBN VARCHAR(13)
)
BEGIN
    UPDATE Supplier_Book
    SET supplierID = p_supplierID,
        ISBN = p_ISBN
    WHERE supplierBookID = p_supplierBookID;
END //

CREATE PROCEDURE sp_DeleteSupplierBook(
    IN p_supplierBookID INT
)
BEGIN
    DELETE FROM Supplier_Book WHERE supplierBookID = p_supplierBookID;
END //

CREATE PROCEDURE sp_GetAllSupplierBook()
BEGIN
    SELECT * FROM Supplier_Book;
END //

DELIMITER ;
