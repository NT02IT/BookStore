DELIMITER //

-- Thêm một bản ghi vào bảng ExportRequestTicketDetails
CREATE PROCEDURE spExportRequestTicketDetails_Create (
    IN p_exportRequestTicketID INT,
    IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO ExportRequestTicketDetails (exportRequestTicketID, bookID, quantity)
    VALUES (p_exportRequestTicketID, p_bookID, p_quantity);
END //

-- Xóa một bản ghi khỏi bảng ExportRequestTicketDetails theo exportRequestTicketID và bookID
CREATE PROCEDURE spExportRequestTicketDetails_Delete (
    IN p_exportRequestTicketID INT,
    IN p_bookID INT
)
BEGIN
    DELETE FROM ExportRequestTicketDetails 
    WHERE exportRequestTicketID = p_exportRequestTicketID AND bookID = p_bookID;
END //

-- Cập nhật thông tin chi tiết vé yêu cầu xuất kho
CREATE PROCEDURE spExportRequestTicketDetails_Update (
    IN p_exportRequestTicketID INT,
    IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE ExportRequestTicketDetails 
    SET quantity = p_quantity
    WHERE exportRequestTicketID = p_exportRequestTicketID AND bookID = p_bookID;
END //

-- Lấy tất cả các bản ghi từ bảng ExportRequestTicketDetails
CREATE PROCEDURE spExportRequestTicketDetails_GetAll ()
BEGIN
    SELECT * FROM ExportRequestTicketDetails;
END //

-- Lấy thông tin chi tiết vé yêu cầu xuất kho theo exportRequestTicketID
CREATE PROCEDURE spExportRequestTicketDetails_GetById (
    IN p_exportRequestTicketID INT
)
BEGIN
    SELECT * FROM ExportRequestTicketDetails WHERE exportRequestTicketID = p_exportRequestTicketID;
END //

DELIMITER ;
