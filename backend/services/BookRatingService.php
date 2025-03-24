<?php
class BookRatingService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($bookRating) {
        $stmt = $this->db->prepare("CALL sp_InsertBookRating(?, ?, ?, ?)");
        $stmt->bindParam(1, $bookRating->getEnduserAccountID());
        $stmt->bindParam(2, $bookRating->getBookOnStoreID());
        $stmt->bindParam(3, $bookRating->getRate());
        $stmt->bindParam(4, $bookRating->getComment());
        return $stmt->execute();
    }

    // Update
    public function update($bookRating) {
        $stmt = $this->db->prepare("CALL sp_UpdateBookRating(?, ?, ?, ?, ?)");
        $stmt->bindParam(1, $bookRating->getBookRatingID());
        $stmt->bindParam(2, $bookRating->getEnduserAccountID());
        $stmt->bindParam(3, $bookRating->getBookOnStoreID());
        $stmt->bindParam(4, $bookRating->getRate());
        $stmt->bindParam(5, $bookRating->getComment());
        return $stmt->execute();
    }

    // Delete (hard delete)
    public function delete($id) {
        $stmt = $this->db->prepare("CALL sp_DeleteBookRating(?)");
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }

    // Get all 
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllBookRating()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($id) {
        $stmt = $this->db->prepare("CALL sp_GetBookRatingByID(?)");
        $stmt->bindParam(1, $id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>