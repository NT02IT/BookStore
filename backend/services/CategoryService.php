<?php
class CategoryService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($category) {
        $stmt = $this->db->prepare("CALL sp_InsertCategory(?, ?)");
        $stmt->bindParam(1, $category->getCategoryName());
        $stmt->bindParam(2, $category->getDateCreate());
        return $stmt->execute();
    }

    // Update
    public function update($category) {
        $stmt = $this->db->prepare("CALL sp_UpdateCategory(?, ?, ?)");
        $stmt->bindParam(1, $category->getCategoryID());
        $stmt->bindParam(2, $category->getCategoryName());
        $stmt->bindParam(3, $category->getDateCreate());
        return $stmt->execute();
    }

    // Delete (hard delete)
    public function delete($categoryID) {
        $stmt = $this->db->prepare("CALL sp_DeleteCategory(?)");
        $stmt->bindParam(1, $categoryID);
        return $stmt->execute();
    }

    // Soft delete
    public function softDelete($categoryID) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteCategory(?)");
        $stmt->bindParam(1, $categoryID);
        return $stmt->execute();
    }

    // Restore
    public function restore($categoryID) {
        $stmt = $this->db->prepare("CALL sp_RestoreCategory(?)");
        $stmt->bindParam(1, $categoryID);
        return $stmt->execute();
    }

    // Get all (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllCategory()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get all including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllCategoryIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($categoryID) {
        $stmt = $this->db->prepare("CALL sp_GetCategoryByID(?)");
        $stmt->bindParam(1, $categoryID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function searchCategories($searchTerm) {
        $stmt = $this->db->prepare("CALL sp_SearchCategories(?)");
        $stmt->bindParam(1, $searchTerm);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function checkCategoryExists($categoryName) {
        $stmt = $this->db->prepare("CALL sp_CheckCategoryExists(?)");
        $stmt->bindParam(1, $categoryName);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>