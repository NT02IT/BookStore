<?php
class EnduserProfileService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create new profile
    public function create($profile) {
        $stmt = $this->db->prepare("CALL sp_InsertEnduserProfile(?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $profile->getPrfName());
        $stmt->bindParam(2, $profile->getGender());
        $stmt->bindParam(3, $profile->getDob());
        $stmt->bindParam(4, $profile->getPhoneNumber());
        $stmt->bindParam(5, $profile->getEmail());
        $stmt->bindParam(6, $profile->getAvatarURL());
        $stmt->bindParam(7, $profile->getPrfAddress());
        return $stmt->execute();
    }

    // Update profile
    public function update($profile) {
        $stmt = $this->db->prepare("CALL sp_UpdateEnduserProfile(?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $profile->getEnduserProfileID());
        $stmt->bindParam(2, $profile->getPrfName());
        $stmt->bindParam(3, $profile->getGender());
        $stmt->bindParam(4, $profile->getDob());
        $stmt->bindParam(5, $profile->getPhoneNumber());
        $stmt->bindParam(6, $profile->getEmail());
        $stmt->bindParam(7, $profile->getAvatarURL());
        $stmt->bindParam(8, $profile->getPrfAddress());
        return $stmt->execute();
    }

    // Delete profile (hard delete)
    public function delete($profileID) {
        $stmt = $this->db->prepare("CALL sp_HardDeleteEnduserProfile(?)");
        $stmt->bindParam(1, $profileID);
        return $stmt->execute();
    }

    // Soft delete profile
    public function softDelete($profileID) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteEnduserProfile(?)");
        $stmt->bindParam(1, $profileID);
        return $stmt->execute();
    }

    // Get all profiles (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllEnduserProfile()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all profiles including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllEnduserProfileIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get profile by ID
    public function getById($profileID) {
        $stmt = $this->db->prepare("CALL sp_GetEnduserProfileByID(?)");
        $stmt->bindParam(1, $profileID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Restore profile
    public function restore($profileID) {
        $stmt = $this->db->prepare("CALL sp_RestoreEnduserProfile(?)");
        $stmt->bindParam(1, $profileID);
        return $stmt->execute();
    }    

    // Search profiles by name
    public function searchByName($name) {
        $stmt = $this->db->prepare("CALL sp_SearchEnduserProfileByName(?)");
        $stmt->bindParam(1, $name);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Check if email exists
    public function emailExists($email) {
        $stmt = $this->db->prepare("CALL sp_CheckEnduserEmailExists(?)");
        $stmt->bindParam(1, $email);
        $stmt->execute();
        return $stmt->fetchColumn() > 0;
    }

    // Check if phone number exists
    public function phoneNumberExists($phoneNumber) {
        $stmt = $this->db->prepare("CALL sp_CheckEnduserPhoneExists(?)");
        $stmt->bindParam(1, $phoneNumber);
        $stmt->execute();
        return $stmt->fetchColumn() > 0;
    }
}
?>