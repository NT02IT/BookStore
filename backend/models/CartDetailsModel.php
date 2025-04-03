<?php

class CartDetailsModel {
    private $enduserAccountID;
    private $bookOnStoreID;
    private $quantity;
    private $dateAdd;

    // Constructor
    public function __construct($enduserAccountID = null, $bookOnStoreID = null, $quantity = 1, $dateAdd = null) {
        $this->enduserAccountID = $enduserAccountID;
        $this->bookOnStoreID = $bookOnStoreID;
        $this->quantity = $quantity;
        $this->dateAdd = $dateAdd;
    }

    // Getters and Setters
    public function getEnduserAccountID() { return $this->enduserAccountID; }
    public function setEnduserAccountID($enduserAccountID) { $this->enduserAccountID = $enduserAccountID; }

    public function getBookOnStoreID() { return $this->bookOnStoreID; }
    public function setBookOnStoreID($bookOnStoreID) { $this->bookOnStoreID = $bookOnStoreID; }

    public function getQuantity() { return $this->quantity; }
    public function setQuantity($quantity) { $this->quantity = $quantity; }

    public function getDateAdd() { return $this->dateAdd; }
    public function setDateAdd($dateAdd) { $this->dateAdd = $dateAdd; }

    // ToString method
    public function __toString() {
        return "CartDetailsModel { " .
            "enduserAccountID=" . $this->enduserAccountID . ", " .
            "bookOnStoreID=" . $this->bookOnStoreID . ", " .
            "quantity=" . $this->quantity . ", " .
            "dateAdd='" . $this->dateAdd . "' }";
    }
}
