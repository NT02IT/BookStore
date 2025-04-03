<?php

class SupplierModel {
    private $supplierID;
    private $supplierName;
    private $supplierAddress;
    private $phoneNumber;
    private $email;
    private $deletedAt;

    // Constructor
    public function __construct($supplierID = null, $supplierName = null, $supplierAddress = null, $phoneNumber = null, $email = null, $deletedAt = null) {
        $this->supplierID = $supplierID;
        $this->supplierName = $supplierName;
        $this->supplierAddress = $supplierAddress;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->deletedAt = $deletedAt;
    }

    // Getters and Setters
    public function getSupplierID() { return $this->supplierID; }
    public function setSupplierID($supplierID) { $this->supplierID = $supplierID; }

    public function getSupplierName() { return $this->supplierName; }
    public function setSupplierName($supplierName) { $this->supplierName = $supplierName; }

    public function getSupplierAddress() { return $this->supplierAddress; }
    public function setSupplierAddress($supplierAddress) { $this->supplierAddress = $supplierAddress; }

    public function getPhoneNumber() { return $this->phoneNumber; }
    public function setPhoneNumber($phoneNumber) { $this->phoneNumber = $phoneNumber; }

    public function getEmail() { return $this->email; }
    public function setEmail($email) { $this->email = $email; }

    public function getDeletedAt() { return $this->deletedAt; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // ToString method
    public function __toString() {
        return "SupplierModel { " .
            "supplierID=" . $this->supplierID . ", " .
            "supplierName='" . $this->supplierName . "', " .
            "supplierAddress='" . $this->supplierAddress . "', " .
            "phoneNumber='" . $this->phoneNumber . "', " .
            "email='" . $this->email . "', " .
            "deletedAt='" . $this->deletedAt . "' " .
            "}";
    }
}
