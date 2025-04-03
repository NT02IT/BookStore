<?php

class WarehouseExportDetailsModel {
    private $warehouseExportID;
    private $bookInWarehouseID;
    private $quantity;

    // Constructor
    public function __construct($warehouseExportID = null, $bookInWarehouseID = null, $quantity = null) {
        $this->warehouseExportID = $warehouseExportID;
        $this->bookInWarehouseID = $bookInWarehouseID;
        $this->quantity = $quantity;
    }

    // Getters and Setters
    public function getWarehouseExportID() { return $this->warehouseExportID; }
    public function setWarehouseExportID($warehouseExportID) { $this->warehouseExportID = $warehouseExportID; }

    public function getBookInWarehouseID() { return $this->bookInWarehouseID; }
    public function setBookInWarehouseID($bookInWarehouseID) { $this->bookInWarehouseID = $bookInWarehouseID; }

    public function getQuantity() { return $this->quantity; }
    public function setQuantity($quantity) { $this->quantity = $quantity; }

    // ToString method
    public function __toString() {
        return "WarehouseExportDetailsModel { " .
            "warehouseExportID=" . $this->warehouseExportID . ", " .
            "bookInWarehouseID=" . $this->bookInWarehouseID . ", " .
            "quantity=" . $this->quantity . " }";
    }
}
