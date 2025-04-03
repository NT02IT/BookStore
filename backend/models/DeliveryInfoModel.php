<?php

class DeliveryInfoModel {
    private $deliveryInfoID;
    private $enduserAccountID;
    private $prfName;
    private $prfAddress;
    private $phoneNumber;
    private $createdAt;
    private $deletedAt;

    // Constructor
    public function __construct($deliveryInfoID = null, $enduserAccountID = null, $prfName = null, $prfAddress = null, $phoneNumber = null, $createdAt = null, $deletedAt = null) {
        $this->deliveryInfoID = $deliveryInfoID;
        $this->enduserAccountID = $enduserAccountID;
        $this->prfName = $prfName;
        $this->prfAddress = $prfAddress;
        $this->phoneNumber = $phoneNumber;
        $this->createdAt = $createdAt;
        $this->deletedAt = $deletedAt;
    }

    // Getters and Setters
    public function getDeliveryInfoID() { return $this->deliveryInfoID; }
    public function setDeliveryInfoID($deliveryInfoID) { $this->deliveryInfoID = $deliveryInfoID; }

    public function getEnduserAccountID() { return $this->enduserAccountID; }
    public function setEnduserAccountID($enduserAccountID) { $this->enduserAccountID = $enduserAccountID; }

    public function getPrfName() { return $this->prfName; }
    public function setPrfName($prfName) { $this->prfName = $prfName; }

    public function getPrfAddress() { return $this->prfAddress; }
    public function setPrfAddress($prfAddress) { $this->prfAddress = $prfAddress; }

    public function getPhoneNumber() { return $this->phoneNumber; }
    public function setPhoneNumber($phoneNumber) { $this->phoneNumber = $phoneNumber; }

    public function getCreatedAt() { return $this->createdAt; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }

    public function getDeletedAt() { return $this->deletedAt; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // ToString method
    public function __toString() {
        return "DeliveryInfoModel { " .
            "deliveryInfoID=" . $this->deliveryInfoID . ", " .
            "enduserAccountID=" . $this->enduserAccountID . ", " .
            "prfName='" . $this->prfName . "', " .
            "prfAddress='" . $this->prfAddress . "', " .
            "phoneNumber='" . $this->phoneNumber . "', " .
            "createdAt='" . $this->createdAt . "', " .
            "deletedAt='" . $this->deletedAt . "' " .
            "}";
    }
}