<?php
class WarehouseImportModel {
    private $warehouseImportID;
    private $adminAccountID;
    private $supplierID;
    private $importDatetime;

    public function __construct(
        $warehouseImportID = null,
        $adminAccountID,
        $supplierID,
        $importDatetime = null
    ) {
        $this->warehouseImportID = $warehouseImportID;
        $this->adminAccountID = $adminAccountID;
        $this->supplierID = $supplierID;
        $this->importDatetime = $importDatetime ?? date('Y-m-d H:i:s');
    }

    // Getter methods
    public function getWarehouseImportID() {
        return $this->warehouseImportID;
    }

    public function getAdminAccountID() {
        return $this->adminAccountID;
    }

    public function getSupplierID() {
        return $this->supplierID;
    }

    public function getImportDatetime() {
        return $this->importDatetime;
    }

    // Setter methods
    public function setWarehouseImportID($warehouseImportID) {
        $this->warehouseImportID = $warehouseImportID;
    }

    public function setAdminAccountID($adminAccountID) {
        $this->adminAccountID = $adminAccountID;
    }

    public function setSupplierID($supplierID) {
        $this->supplierID = $supplierID;
    }

    public function setImportDatetime($importDatetime) {
        $this->importDatetime = $importDatetime;
    }

    // toString method
    public function __toString() {
        return "WarehouseImport [warehouseImportID=" . $this->warehouseImportID .
               ", adminAccountID=" . $this->adminAccountID .
               ", supplierID=" . $this->supplierID .
               ", importDatetime=" . $this->importDatetime . "]";
    }
}
?>