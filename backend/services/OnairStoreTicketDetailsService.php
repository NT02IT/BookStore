<?php
class OnairStoreTicketDetailsService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Add item to ticket
    public function add($ticketItem) {
        $stmt = $this->db->prepare("CALL sp_InsertOnairStoreTicketDetails(?, ?, ?)");
        $stmt->bindParam(1, $ticketItem->getOnairStoreTicketID());
        $stmt->bindParam(2, $ticketItem->getWarehouseImportDetailsID());
        $stmt->bindParam(3, $ticketItem->getQuantity());
        return $stmt->execute();
    }

    // Update ticket item
    public function update($ticketItem) {
        $stmt = $this->db->prepare("CALL sp_UpdateOnairStoreTicketDetails(?, ?, ?, ?)");
        $stmt->bindParam(1, $ticketItem->getOnairStoreTicketDetailsID());
        $stmt->bindParam(2, $ticketItem->getOnairStoreTicketID());
        $stmt->bindParam(3, $ticketItem->getWarehouseImportDetailsID());
        $stmt->bindParam(4, $ticketItem->getQuantity());
        return $stmt->execute();
    }

    // Remove item from ticket
    public function delete($ticketDetailsID) {
        $stmt = $this->db->prepare("CALL sp_DeleteOnairStoreTicketDetails(?)");
        $stmt->bindParam(1, $ticketDetailsID);
        return $stmt->execute();
    }

    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllOnairStoreTicketDetails()");
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>