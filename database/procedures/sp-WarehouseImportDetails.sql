DELIMITER //

CREATE PROCEDURE sp_InsertWarehouseImportDetails(
    IN p_warehouseImportID INT,
    IN p_ISBN VARCHAR(13),
    IN p_importPrice DECIMAL(15,2),
    IN p_quantity INT
)
BEGIN
    INSERT INTO WarehouseImportDetails (warehouseImportID, ISBN, importPrice, quantity)
    VALUES (p_warehouseImportID, p_ISBN, p_importPrice, p_quantity);
END //

CREATE PROCEDURE sp_UpdateWarehouseImportDetails(
    IN p_warehouseImportDetailsID INT,
    IN p_warehouseImportID INT,
    IN p_ISBN VARCHAR(13),
    IN p_importPrice DECIMAL(15,2),
    IN p_quantity INT
)
BEGIN
    UPDATE WarehouseImportDetails
    SET warehouseImportID = p_warehouseImportID,
        ISBN = p_ISBN,
        importPrice = p_importPrice,
        quantity = p_quantity
    WHERE warehouseImportDetailsID = p_warehouseImportDetailsID;
END //

CREATE PROCEDURE sp_DeleteWarehouseImportDetails(
    IN p_warehouseImportDetailsID INT
)
BEGIN
    DELETE FROM WarehouseImportDetails WHERE warehouseImportDetailsID = p_warehouseImportDetailsID;
END //

CREATE PROCEDURE sp_GetAllWarehouseImportDetails()
BEGIN
    SELECT * FROM WarehouseImportDetails;
END //

DELIMITER ;
