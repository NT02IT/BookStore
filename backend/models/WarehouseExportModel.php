<?php

class WarehouseExportModel {
    private $warehouseExportID;
    private $adminExport;
    private $adminReceive;
    private $exportDatetime;

    // Constructor
    public function __construct($warehouseExportID = null, $adminExport = null, $adminReceive = null, $exportDatetime = null) {
        $this->warehouseExportID = $warehouseExportID;
        $this->adminExport = $adminExport;
        $this->adminReceive = $adminReceive;
        $this->exportDatetime = $exportDatetime;
    }

    // Getters and Setters
    public function getWarehouseExportID() { return $this->warehouseExportID; }
    public function setWarehouseExportID($warehouseExportID) { $this->warehouseExportID = $warehouseExportID; }

    public function getAdminExport() { return $this->adminExport; }
    public function setAdminExport($adminExport) { $this->adminExport = $adminExport; }

    public function getAdminReceive() { return $this->adminReceive; }
    public function setAdminReceive($adminReceive) { $this->adminReceive = $adminReceive; }

    public function getExportDatetime() { return $this->exportDatetime; }
    public function setExportDatetime($exportDatetime) { $this->exportDatetime = $exportDatetime; }

    // ToString method
    public function __toString() {
        return "WarehouseExportModel { " .
            "warehouseExportID=" . $this->warehouseExportID . ", " .
            "adminExport=" . $this->adminExport . ", " .
            "adminReceive=" . $this->adminReceive . ", " .
            "exportDatetime='" . $this->exportDatetime . "' " .
            "}";
    }
}