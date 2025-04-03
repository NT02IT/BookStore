DELIMITER //

-- Thêm một bản ghi vào bảng ExportRequestTicket
CREATE PROCEDURE spExportRequestTicket_Create (
    IN p_adminAccountID INT,
    IN p_ticketStatus INT
)
BEGIN
    INSERT INTO ExportRequestTicket (adminAccountID, requestDatetime, ticketStatus)
    VALUES (p_adminAccountID, NOW(), p_ticketStatus);
END //

-- Xóa một bản ghi khỏi bảng ExportRequestTicket theo ID
CREATE PROCEDURE spExportRequestTicket_Delete (
    IN p_exportRequestTicketID INT
)
BEGIN
    DELETE FROM ExportRequestTicket WHERE exportRequestTicketID = p_exportRequestTicketID;
END //

-- Cập nhật thông tin trạng thái vé yêu cầu xuất kho
CREATE PROCEDURE spExportRequestTicket_Update (
    IN p_exportRequestTicketID INT,
    IN p_ticketStatus INT
)
BEGIN
    UPDATE ExportRequestTicket 
    SET ticketStatus = p_ticketStatus
    WHERE exportRequestTicketID = p_exportRequestTicketID;
END //

-- Lấy tất cả các bản ghi từ bảng ExportRequestTicket
CREATE PROCEDURE spExportRequestTicket_GetAll ()
BEGIN
    SELECT * FROM ExportRequestTicket;
END //

-- Lấy thông tin vé yêu cầu xuất kho theo exportRequestTicketID
CREATE PROCEDURE spExportRequestTicket_GetById (
    IN p_exportRequestTicketID INT
)
BEGIN
    SELECT * FROM ExportRequestTicket WHERE exportRequestTicketID = p_exportRequestTicketID;
END //

DELIMITER ;
