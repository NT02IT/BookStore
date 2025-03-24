<?php
class OnairStoreTicketDetailsModel {
    private $onairStoreTicketDetailsID;
    private $onairStoreTicketID;
    private $warehouseImportDetailsID;
    private $quantity;

    public function __construct(
        $onairStoreTicketDetailsID = null,
        $onairStoreTicketID,
        $warehouseImportDetailsID,
        $quantity
    ) {
        $this->onairStoreTicketDetailsID = $onairStoreTicketDetailsID;
        $this->onairStoreTicketID = $onairStoreTicketID;
        $this->warehouseImportDetailsID = $warehouseImportDetailsID;
        $this->quantity = $quantity;
    }

    // Getter methods
    public function getOnairStoreTicketDetailsID() {
        return $this->onairStoreTicketDetailsID;
    }

    public function getOnairStoreTicketID() {
        return $this->onairStoreTicketID;
    }

    public function getWarehouseImportDetailsID() {
        return $this->warehouseImportDetailsID;
    }

    public function getQuantity() {
        return $this->quantity;
    }

    // Setter methods
    public function setOnairStoreTicketDetailsID($onairStoreTicketDetailsID) {
        $this->onairStoreTicketDetailsID = $onairStoreTicketDetailsID;
    }

    public function setOnairStoreTicketID($onairStoreTicketID) {
        $this->onairStoreTicketID = $onairStoreTicketID;
    }

    public function setWarehouseImportDetailsID($warehouseImportDetailsID) {
        $this->warehouseImportDetailsID = $warehouseImportDetailsID;
    }

    public function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    // toString method
    public function __toString() {
        return "OnairStoreTicketDetails [onairStoreTicketDetailsID=" . $this->onairStoreTicketDetailsID .
               ", onairStoreTicketID=" . $this->onairStoreTicketID .
               ", warehouseImportDetailsID=" . $this->warehouseImportDetailsID .
               ", quantity=" . $this->quantity . "]";
    }
}
?>