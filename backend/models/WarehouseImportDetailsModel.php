<?php
class WarehouseImportDetailsModel {
    private $warehouseImportDetailsID;
    private $warehouseImportID;
    private $ISBN;
    private $importPrice;
    private $quantity;

    public function __construct(
        $warehouseImportDetailsID = null,
        $warehouseImportID,
        $ISBN,
        $importPrice,
        $quantity
    ) {
        $this->warehouseImportDetailsID = $warehouseImportDetailsID;
        $this->warehouseImportID = $warehouseImportID;
        $this->ISBN = $ISBN;
        $this->importPrice = $importPrice;
        $this->quantity = $quantity;
    }

    // Getter methods
    public function getWarehouseImportDetailsID() {
        return $this->warehouseImportDetailsID;
    }

    public function getWarehouseImportID() {
        return $this->warehouseImportID;
    }

    public function getISBN() {
        return $this->ISBN;
    }

    public function getImportPrice() {
        return $this->importPrice;
    }

    public function getQuantity() {
        return $this->quantity;
    }

    // Setter methods
    public function setWarehouseImportDetailsID($warehouseImportDetailsID) {
        $this->warehouseImportDetailsID = $warehouseImportDetailsID;
    }

    public function setWarehouseImportID($warehouseImportID) {
        $this->warehouseImportID = $warehouseImportID;
    }

    public function setISBN($ISBN) {
        $this->ISBN = $ISBN;
    }

    public function setImportPrice($importPrice) {
        $this->importPrice = $importPrice;
    }

    public function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    // toString method
    public function __toString() {
        return "WarehouseImportDetails [warehouseImportDetailsID=" . $this->warehouseImportDetailsID .
               ", warehouseImportID=" . $this->warehouseImportID .
               ", ISBN=" . $this->ISBN .
               ", importPrice=" . number_format($this->importPrice, 2) .
               ", quantity=" . $this->quantity . "]";
    }
}
?>