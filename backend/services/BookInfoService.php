<?php
class BookInfoService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($bookInfo) {
        $stmt = $this->db->prepare("CALL sp_InsertBookInfo(?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $bookInfo->getISBN());
        $stmt->bindParam(2, $bookInfo->getCategoryID());
        $stmt->bindParam(3, $bookInfo->getBookTitle());
        $stmt->bindParam(4, $bookInfo->getBookAuthor());
        $stmt->bindParam(5, $bookInfo->getYearOfPublication());
        $stmt->bindParam(6, $bookInfo->getPublisher());
        $stmt->bindParam(7, $bookInfo->getImagesURL());
        $stmt->bindParam(8, $bookInfo->getBookDesc());
        return $stmt->execute();
    }

    // Update
    public function update($bookInfo) {
        $stmt = $this->db->prepare("CALL sp_UpdateBookInfo(?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $bookInfo->getISBN());
        $stmt->bindParam(2, $bookInfo->getCategoryID());
        $stmt->bindParam(3, $bookInfo->getBookTitle());
        $stmt->bindParam(4, $bookInfo->getBookAuthor());
        $stmt->bindParam(5, $bookInfo->getYearOfPublication());
        $stmt->bindParam(6, $bookInfo->getPublisher());
        $stmt->bindParam(7, $bookInfo->getImagesURL());
        $stmt->bindParam(8, $bookInfo->getBookDesc());
        return $stmt->execute();
    }

    // Delete (hard delete)
    public function delete($isbn) {
        $stmt = $this->db->prepare("CALL sp_DeleteBookInfo(?)");
        $stmt->bindParam(1, $isbn);
        return $stmt->execute();
    }

    // Soft delete
    public function softDelete($isbn) {
        $stmt = $this->db->prepare("CALL sp_SoftDeleteBookInfo(?)");
        $stmt->bindParam(1, $isbn);
        return $stmt->execute();
    }

    // Get all (non-deleted only)
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllBookInfo()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Restore
    public function restore($isbn) {
        $stmt = $this->db->prepare("CALL sp_RestoreBookInfo(?)");
        $stmt->bindParam(1, $isbn);
        return $stmt->execute();
    }

    // Get all including deleted
    public function getAllIncludingDeleted() {
        $stmt = $this->db->prepare("CALL sp_GetAllBookInfoIncludingDeleted()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ISBN
    public function getByISBN($isbn) {
        $stmt = $this->db->prepare("CALL sp_GetBookInfoByISBN(?)");
        $stmt->bindParam(1, $isbn);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Search books (additional common functionality)
    public function searchBooks($keyword) {
        $stmt = $this->db->prepare("CALL sp_SearchBooks(?)");
        $stmt->bindParam(1, $keyword);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>