<?php

class OrderDetailsModel {
    private $orderDetailsID;
    private $orderID;
    private $bookOnStoreID;
    private $quantity;
    private $purchasePrice;

    // Constructor
    public function __construct($orderDetailsID = null, $orderID = null, $bookOnStoreID = null, $quantity = 1, $purchasePrice = null) {
        $this->orderDetailsID = $orderDetailsID;
        $this->orderID = $orderID;
        $this->bookOnStoreID = $bookOnStoreID;
        $this->quantity = $quantity;
        $this->purchasePrice = $purchasePrice;
    }

    // Getters and Setters
    public function getOrderDetailsID() { return $this->orderDetailsID; }
    public function setOrderDetailsID($orderDetailsID) { $this->orderDetailsID = $orderDetailsID; }

    public function getOrderID() { return $this->orderID; }
    public function setOrderID($orderID) { $this->orderID = $orderID; }

    public function getBookOnStoreID() { return $this->bookOnStoreID; }
    public function setBookOnStoreID($bookOnStoreID) { $this->bookOnStoreID = $bookOnStoreID; }

    public function getQuantity() { return $this->quantity; }
    public function setQuantity($quantity) { $this->quantity = $quantity; }

    public function getPurchasePrice() { return $this->purchasePrice; }
    public function setPurchasePrice($purchasePrice) { $this->purchasePrice = $purchasePrice; }

    // ToString method
    public function __toString() {
        return "OrderDetailsModel { " .
            "orderDetailsID=" . $this->orderDetailsID . ", " .
            "orderID=" . $this->orderID . ", " .
            "bookOnStoreID=" . $this->bookOnStoreID . ", " .
            "quantity=" . $this->quantity . ", " .
            "purchasePrice=" . $this->purchasePrice . " }";
    }
}
