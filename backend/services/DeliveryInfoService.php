<?php
class DeliveryInfoService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create delivery info
    public function create($deliveryInfo) {
        $stmt = $this->db->prepare("CALL sp_InsertDeliveryInfo(?, ?, ?, ?)");
        $stmt->bindParam(1, $deliveryInfo->getEnduserAccountID());
        $stmt->bindParam(2, $deliveryInfo->getPrfName());
        $stmt->bindParam(3, $deliveryInfo->getPrfAddress());
        $stmt->bindParam(4, $deliveryInfo->getPhoneNumber());
        return $stmt->execute();
    }

    // Update delivery info
    public function update($deliveryInfo) {
        $stmt = $this->db->prepare("CALL sp_UpdateDeliveryInfo(?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $deliveryInfo->getDeliveryInfoID());
        $stmt->bindParam(2, $deliveryInfo->getEnduserAccountID());
        $stmt->bindParam(3, $deliveryInfo->getPrfName());
        $stmt->bindParam(4, $deliveryInfo->getPrfAddress());
        $stmt->bindParam(5, $deliveryInfo->getPhoneNumber());
        return $stmt->execute();
    }

    // Delete delivery info (hard delete)
    public function delete($deliveryInfoID) {
        $stmt = $this->db->prepare("CALL sp_HardDeleteDeliveryInfo(?)");
        $stmt->bindParam(1, $deliveryInfoID);
        return $stmt->execute();
    }

    // Soft delete delivery info
    public function softDelete($deliveryInfoID) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteDeliveryInfo(?)");
        $stmt->bindParam(1, $deliveryInfoID);
        return $stmt->execute();
    }

    // Get all delivery info (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllDeliveryInfo()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all delivery info including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllDeliveryInfoIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get delivery info by ID
    public function getById($deliveryInfoID) {
        $stmt = $this->db->prepare("CALL sp_GetDeliveryInfoByID(?)");
        $stmt->bindParam(1, $deliveryInfoID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Restore delivery info
    public function restore($deliveryInfoID) {
        $stmt = $this->db->prepare("CALL sp_RestoreDeliveryInfo(?)");
        $stmt->bindParam(1, $deliveryInfoID);
        return $stmt->execute();
    }
    
    // Get delivery info by user ID
    public function getByUser($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_GetDeliveryInfoByUserID(?)");
        $stmt->bindParam(1, $enduserAccountID);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>