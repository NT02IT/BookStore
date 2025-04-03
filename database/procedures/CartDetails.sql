DELIMITER //

-- Thêm một bản ghi vào bảng CartDetails
CREATE PROCEDURE spCartDetails_Create (
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO CartDetails (enduserAccountID, bookOnStoreID, quantity, dateAdd)
    VALUES (p_enduserAccountID, p_bookOnStoreID, p_quantity, NOW());
END //

-- Xóa một bản ghi khỏi bảng CartDetails theo enduserAccountID và bookOnStoreID
CREATE PROCEDURE spCartDetails_Delete (
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT
)
BEGIN
    DELETE FROM CartDetails WHERE enduserAccountID = p_enduserAccountID AND bookOnStoreID = p_bookOnStoreID;
END //

-- Cập nhật số lượng của sản phẩm trong giỏ hàng
CREATE PROCEDURE spCartDetails_Update (
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT,
    IN p_quantity INT
)
BEGIN
    UPDATE CartDetails 
    SET quantity = p_quantity
    WHERE enduserAccountID = p_enduserAccountID AND bookOnStoreID = p_bookOnStoreID;
END //

-- Lấy tất cả các bản ghi từ bảng CartDetails
CREATE PROCEDURE spCartDetails_GetAll ()
BEGIN
    SELECT * FROM CartDetails;
END //

-- Lấy thông tin chi tiết của một bản ghi theo enduserAccountID và bookOnStoreID
CREATE PROCEDURE spCartDetails_GetById (
    IN p_enduserAccountID INT,
    IN p_bookOnStoreID INT
)
BEGIN
    SELECT * FROM CartDetails WHERE enduserAccountID = p_enduserAccountID AND bookOnStoreID = p_bookOnStoreID;
END //

DELIMITER ;
