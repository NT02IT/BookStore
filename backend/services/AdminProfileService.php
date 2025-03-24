<?php
class AdminProfileService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($adminProfile) {
        $stmt = $this->db->prepare("CALL sp_InsertAdminProfile(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $adminProfile->getPrfName());
        $stmt->bindParam(2, $adminProfile->getGender());
        $stmt->bindParam(3, $adminProfile->getDob());
        $stmt->bindParam(4, $adminProfile->getCCCD());
        $stmt->bindParam(5, $adminProfile->getPhoneNumber());
        $stmt->bindParam(6, $adminProfile->getEmail());
        $stmt->bindParam(7, $adminProfile->getAvatarURL());
        $stmt->bindParam(8, $adminProfile->getPrfAddress());
        $stmt->bindParam(9, $adminProfile->getSalary());
        return $stmt->execute();
    }

    // Update
    public function update($adminProfile) {
        $stmt = $this->db->prepare("CALL sp_UpdateAdminProfile(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $adminProfile->getAdminProfileID());
        $stmt->bindParam(2, $adminProfile->getPrfName());
        $stmt->bindParam(3, $adminProfile->getGender());
        $stmt->bindParam(4, $adminProfile->getDob());
        $stmt->bindParam(5, $adminProfile->getCCCD());
        $stmt->bindParam(6, $adminProfile->getPhoneNumber());
        $stmt->bindParam(7, $adminProfile->getEmail());
        $stmt->bindParam(8, $adminProfile->getAvatarURL());
        $stmt->bindParam(9, $adminProfile->getPrfAddress());
        $stmt->bindParam(10, $adminProfile->getSalary());
        return $stmt->execute();
    }

    // Delete (hard delete)
    public function delete($id) {
        $stmt = $this->db->prepare("CALL sp_HardDeleteAdminProfile(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }

    // Soft delete
    public function softDelete($id) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteAdminProfile(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }

    // Get all (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllAdminProfile()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllAdminProfileIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($id) {
        $stmt = $this->db->prepare("CALL sp_GetAdminProfileByID(?)");
        $stmt->bindParam(1, $id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Restore
    public function restore($id) {
        $stmt = $this->db->prepare("CALL sp_RestoreAdminProfile(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    } 
}
?>