<?php
require_once "../config/db.php";

class BookInfoController {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    public function getAllBookInfo() {
        $query = "CALL sp_GetAllRole()";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $allBookInfo = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($allBookInfo);
    }
}

$bookController = new BookInfoController();
$bookController->getAllBookInfo();
?>
