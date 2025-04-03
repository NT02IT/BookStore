<?php

class WarehouseImportDetailsModel {
    private $warehouseImportID;
    private $bookID;
    private $quantity;
    private $importPrice;

    // Constructor
    public function __construct($warehouseImportID = null, $bookID = null, $quantity = null, $importPrice = null) {
        $this->warehouseImportID = $warehouseImportID;
        $this->bookID = $bookID;
        $this->quantity = $quantity;
        $this->importPrice = $importPrice;
    }

    // Getters and Setters
    public function getWarehouseImportID() { return $this->warehouseImportID; }
    public function setWarehouseImportID($warehouseImportID) { $this->warehouseImportID = $warehouseImportID; }

    public function getBookID() { return $this->bookID; }
    public function setBookID($bookID) { $this->bookID = $bookID; }

    public function getQuantity() { return $this->quantity; }
    public function setQuantity($quantity) { $this->quantity = $quantity; }

    public function getImportPrice() { return $this->importPrice; }
    public function setImportPrice($importPrice) { $this->importPrice = $importPrice; }

    // ToString method
    public function __toString() {
        return "WarehouseImportDetailsModel { " .
            "warehouseImportID=" . $this->warehouseImportID . ", " .
            "bookID=" . $this->bookID . ", " .
            "quantity=" . $this->quantity . ", " .
            "importPrice=" . $this->importPrice . " " .
            "}";
    }
}
