<?php

class WarehouseImportModel {
    private $warehouseImportID;
    private $supplierID;
    private $adminAccountID;
    private $importDatetime;

    // Constructor
    public function __construct($warehouseImportID = null, $supplierID = null, $adminAccountID = null, $importDatetime = null) {
        $this->warehouseImportID = $warehouseImportID;
        $this->supplierID = $supplierID;
        $this->adminAccountID = $adminAccountID;
        $this->importDatetime = $importDatetime;
    }

    // Getters and Setters
    public function getWarehouseImportID() { return $this->warehouseImportID; }
    public function setWarehouseImportID($warehouseImportID) { $this->warehouseImportID = $warehouseImportID; }

    public function getSupplierID() { return $this->supplierID; }
    public function setSupplierID($supplierID) { $this->supplierID = $supplierID; }

    public function getAdminAccountID() { return $this->adminAccountID; }
    public function setAdminAccountID($adminAccountID) { $this->adminAccountID = $adminAccountID; }

    public function getImportDatetime() { return $this->importDatetime; }
    public function setImportDatetime($importDatetime) { $this->importDatetime = $importDatetime; }

    // ToString method
    public function __toString() {
        return "WarehouseImportModel { " .
            "warehouseImportID=" . $this->warehouseImportID . ", " .
            "supplierID=" . $this->supplierID . ", " .
            "adminAccountID=" . $this->adminAccountID . ", " .
            "importDatetime='" . $this->importDatetime . "' " .
            "}";
    }
}
