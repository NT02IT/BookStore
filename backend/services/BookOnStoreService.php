<?php
class BookOnStoreService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create
    public function create($bookOnStore) {
        $stmt = $this->db->prepare("CALL sp_InsertBookOnStore(?, ?, ?)");
        $stmt->bindParam(1, $bookOnStore->getISBN());
        $stmt->bindParam(2, $bookOnStore->getSellingPrice());
        $stmt->bindParam(3, $bookOnStore->getQuantity());
        return $stmt->execute();
    }

    // Update
    public function update($bookOnStore) {
        $stmt = $this->db->prepare("CALL sp_UpdateBookOnStore(?, ?, ?, ?)");
        $stmt->bindParam(1, $bookOnStore->getBookOnStoreID());
        $stmt->bindParam(2, $bookOnStore->getISBN());
        $stmt->bindParam(3, $bookOnStore->getSellingPrice());
        $stmt->bindParam(4, $bookOnStore->getQuantity());
        return $stmt->execute();
    }

    // Get all
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllBookOnStore()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($bookOnStoreID) {
        $stmt = $this->db->prepare("CALL sp_GetBookOnStoreByID(?)");
        $stmt->bindParam(1, $bookOnStoreID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Get by ISBN
    public function getByISBN($isbn) {
        $stmt = $this->db->prepare("CALL sp_GetBookOnStoreByISBN(?)");
        $stmt->bindParam(1, $isbn);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Update quantity
    public function updateQuantity($bookOnStoreID, $quantity) {
        $stmt = $this->db->prepare("CALL sp_UpdateBookOnStoreQuantity(?, ?)");
        $stmt->bindParam(1, $bookOnStoreID);
        $stmt->bindParam(2, $quantity);
        return $stmt->execute();
    }
}
?>