<?php
class EnduserAccountService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create new end user account
    public function create($enduserAccount) {
        $stmt = $this->db->prepare("CALL sp_InsertEnduserAccount(?, ?, ?)");
        $stmt->bindParam(1, $enduserAccount->getEnduserProfileID());
        $stmt->bindParam(2, $enduserAccount->getUsername());
        $stmt->bindParam(3, $enduserAccount->getPwd());
        return $stmt->execute();
    }

    // Update end user account
    public function update($enduserAccount) {
        $stmt = $this->db->prepare("CALL sp_UpdateEnduserAccount(?, ?, ?, ?)");
        $stmt->bindParam(1, $enduserAccount->getEnduserAccountID());
        $stmt->bindParam(2, $enduserAccount->getEnduserProfileID());
        $stmt->bindParam(3, $enduserAccount->getUsername());
        $stmt->bindParam(4, $enduserAccount->getPwd());
        return $stmt->execute();
    }

    // Delete account (hard delete)
    public function delete($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_DeleteEnduserAccount(?)");
        $stmt->bindParam(1, $enduserAccountID);
        return $stmt->execute();
    }

    // Soft delete account
    public function softDelete($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteEnduserAccount(?)");
        $stmt->bindParam(1, $enduserAccountID);
        return $stmt->execute();
    }

    // Restore account
    public function restore($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_RestoreEnduserAccount(?)");
        $stmt->bindParam(1, $enduserAccountID);
        return $stmt->execute();
    }

    // Get all accounts (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllEnduserAccount()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all accounts including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllEnduserAccountIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get account by ID
    public function getById($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_GetEnduserAccountByID(?)");
        $stmt->bindParam(1, $enduserAccountID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Get account by username
    public function getByUsername($username) {
        $stmt = $this->db->prepare("CALL sp_GetEnduserAccountByUsername(?)");
        $stmt->bindParam(1, $username);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Check if username exists
    public function usernameExists($username) {
        $stmt = $this->db->prepare("CALL sp_CheckEnduserUsernameExists(?)");
        $stmt->bindParam(1, $username);
        $stmt->execute();
        return $stmt->fetchColumn() > 0;
    }

    // Verify login credentials
    public function verifyLogin($username, $password) {
        $stmt = $this->db->prepare("CALL sp_VerifyEnduserLogin(?, ?)");
        $stmt->bindParam(1, $username);
        $stmt->bindParam(2, $password);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>