<?php
class AdminAccountService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($adminAccount) {
        $stmt = $this->db->prepare("CALL sp_InsertAdminAccount(?, ?, ?, ?)");
        $stmt->bindParam(1, $adminAccount->getRoleID());
        $stmt->bindParam(2, $adminAccount->getUsername());
        $stmt->bindParam(3, $adminAccount->getPwd());
        $stmt->bindParam(4, $adminAccount->getAdminProfileID());
        return $stmt->execute();
    }

    // Update
    public function update($adminAccount) {
        $stmt = $this->db->prepare("CALL sp_UpdateAdminAccount(?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $adminAccount->getAdminAccountID());
        $stmt->bindParam(2, $adminAccount->getRoleID());
        $stmt->bindParam(3, $adminAccount->getUsername());
        $stmt->bindParam(4, $adminAccount->getPwd());
        $stmt->bindParam(5, $adminAccount->getAdminProfileID());
        return $stmt->execute();
    }

    // Delete (hard delete)
    public function delete($id) {
        $stmt = $this->db->prepare("CALL sp_HardDeleteAdminAccount(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }

    // Soft delete
    public function softDelete($id) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteAdminAccount(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }

    // Get all (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllAdminAccount()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllAdminAccountIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($id) {
        $stmt = $this->db->prepare("CALL sp_GetAdminAccountByID(?)");
        $stmt->bindParam(1, $id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Restore
    public function restore($id) {
        $stmt = $this->db->prepare("CALL sp_RestoreAdminAccount(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }

    // Logging function
    // Hash mật khẩu trước rồi check trùng
    
}
?>