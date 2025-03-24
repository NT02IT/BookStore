DELIMITER //

CREATE PROCEDURE sp_InsertWarehouseImport(
    IN p_adminAccountID INT,
    IN p_supplierID INT
)
BEGIN
    INSERT INTO WarehouseImport (adminAccountID, supplierID, importDatetime)
    VALUES (p_adminAccountID, p_supplierID, NOW());
END //

CREATE PROCEDURE sp_UpdateWarehouseImport(
    IN p_warehouseImportID INT,
    IN p_adminAccountID INT,
    IN p_supplierID INT
)
BEGIN
    UPDATE WarehouseImport
    SET adminAccountID = p_adminAccountID,
        supplierID = p_supplierID
    WHERE warehouseImportID = p_warehouseImportID;
END //

CREATE PROCEDURE sp_DeleteWarehouseImport(
    IN p_warehouseImportID INT
)
BEGIN
    DELETE FROM WarehouseImport WHERE warehouseImportID = p_warehouseImportID;
END //

CREATE PROCEDURE sp_GetAllWarehouseImport()
BEGIN
    SELECT * FROM WarehouseImport;
END //

DELIMITER ;
