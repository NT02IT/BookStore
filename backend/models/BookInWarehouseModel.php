<?php

class BookInWarehouseModel {
    private $bookInWarehouseID;
    private $bookID;
    private $warehouseImportID;
    private $stock;

    // Constructor
    public function __construct($bookInWarehouseID = null, $bookID = null, $warehouseImportID = null, $stock = 0) {
        $this->bookInWarehouseID = $bookInWarehouseID;
        $this->bookID = $bookID;
        $this->warehouseImportID = $warehouseImportID;
        $this->stock = $stock;
    }

    // Getters and Setters
    public function getBookInWarehouseID() { return $this->bookInWarehouseID; }
    public function setBookInWarehouseID($bookInWarehouseID) { $this->bookInWarehouseID = $bookInWarehouseID; }

    public function getBookID() { return $this->bookID; }
    public function setBookID($bookID) { $this->bookID = $bookID; }

    public function getWarehouseImportID() { return $this->warehouseImportID; }
    public function setWarehouseImportID($warehouseImportID) { $this->warehouseImportID = $warehouseImportID; }

    public function getStock() { return $this->stock; }
    public function setStock($stock) { $this->stock = $stock; }

    // ToString method
    public function __toString() {
        return "BookInWarehouseModel { " .
            "bookInWarehouseID=" . $this->bookInWarehouseID . ", " .
            "bookID=" . $this->bookID . ", " .
            "warehouseImportID=" . $this->warehouseImportID . ", " .
            "stock=" . $this->stock . " " .
            "}";
    }
}
