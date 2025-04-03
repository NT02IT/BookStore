<?php

class BookOnStoreModel {
    private $bookOnStoreID;
    private $bookInWarehouseID;
    private $sellingPrice;
    private $stock;

    // Constructor
    public function __construct($bookOnStoreID = null, $bookInWarehouseID = null, $sellingPrice = null, $stock = null) {
        $this->bookOnStoreID = $bookOnStoreID;
        $this->bookInWarehouseID = $bookInWarehouseID;
        $this->sellingPrice = $sellingPrice;
        $this->stock = $stock;
    }

    // Getters and Setters
    public function getBookOnStoreID() { return $this->bookOnStoreID; }
    public function setBookOnStoreID($bookOnStoreID) { $this->bookOnStoreID = $bookOnStoreID; }

    public function getBookInWarehouseID() { return $this->bookInWarehouseID; }
    public function setBookInWarehouseID($bookInWarehouseID) { $this->bookInWarehouseID = $bookInWarehouseID; }

    public function getSellingPrice() { return $this->sellingPrice; }
    public function setSellingPrice($sellingPrice) { $this->sellingPrice = $sellingPrice; }

    public function getStock() { return $this->stock; }
    public function setStock($stock) { $this->stock = $stock; }

    // ToString method
    public function __toString() {
        return "BookOnStoreModel { " .
            "bookOnStoreID=" . $this->bookOnStoreID . ", " .
            "bookInWarehouseID=" . $this->bookInWarehouseID . ", " .
            "sellingPrice=" . $this->sellingPrice . ", " .
            "stock=" . $this->stock . " " .
            "}";
    }
}