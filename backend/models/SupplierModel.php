<?php
class SupplierModel {
    private $supplierID;
    private $supplierName;
    private $supplierAddress;
    private $phoneNumber;

    public function __construct(
        $supplierID = null,
        $supplierName,
        $supplierAddress = null,
        $phoneNumber
    ) {
        $this->supplierID = $supplierID;
        $this->supplierName = $supplierName;
        $this->supplierAddress = $supplierAddress;
        $this->phoneNumber = $phoneNumber;
    }

    // Getter methods
    public function getSupplierID() {
        return $this->supplierID;
    }

    public function getSupplierName() {
        return $this->supplierName;
    }

    public function getSupplierAddress() {
        return $this->supplierAddress;
    }

    public function getPhoneNumber() {
        return $this->phoneNumber;
    }

    // Setter methods
    public function setSupplierID($supplierID) {
        $this->supplierID = $supplierID;
    }

    public function setSupplierName($supplierName) {
        $this->supplierName = $supplierName;
    }

    public function setSupplierAddress($supplierAddress) {
        $this->supplierAddress = $supplierAddress;
    }

    public function setPhoneNumber($phoneNumber) {
        $this->phoneNumber = $phoneNumber;
    }

    // toString method
    public function __toString() {
        return "Supplier [supplierID=" . $this->supplierID .
               ", supplierName=" . $this->supplierName .
               ", supplierAddress=" . $this->supplierAddress .
               ", phoneNumber=" . $this->phoneNumber . "]";
    }
}
?>