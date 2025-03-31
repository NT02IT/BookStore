<?php
class DatabaseEntityService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($databaseEntity) {
        $stmt = $this->db->prepare("CALL sp_InsertDatabaseEntity(?)");
        $stmt->bindParam(1, $databaseEntity->getEntityName());
        return $stmt->execute();
    }

    // Update
    public function update($databaseEntity) {
        $stmt = $this->db->prepare("CALL sp_UpdateDatabaseEntity(?, ?)");
        $stmt->bindParam(1, $databaseEntity->getEntityID());
        $stmt->bindParam(2, $databaseEntity->getEntityName());
        return $stmt->execute();
    }

    // Delete (hard delete)
    public function delete($entityID) {
        $stmt = $this->db->prepare("CALL sp_HardDeleteDatabaseEntity(?)");
        $stmt->bindParam(1, $entityID);
        return $stmt->execute();
    }

    // Soft delete
    public function softDelete($entityID) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteDatabaseEntity(?)");
        $stmt->bindParam(1, $entityID);
        return $stmt->execute();
    }

    // Get all (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllDatabaseEntity()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllDatabaseEntityIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($entityID) {
        $stmt = $this->db->prepare("CALL sp_GetDatabaseEntityByID(?)");
        $stmt->bindParam(1, $entityID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Restore
    public function restore($entityID) {
        $stmt = $this->db->prepare("CALL sp_RestoreDatabaseEntity(?)");
        $stmt->bindParam(1, $entityID);
        return $stmt->execute();
    }
}
?>