<?php
class OrderDetailsModel {
    private $orderDetailsID;
    private $orderID;
    private $bookOnStoreID;
    private $quantity;

    public function __construct(
        $orderDetailsID = null,
        $orderID,
        $bookOnStoreID,
        $quantity
    ) {
        $this->orderDetailsID = $orderDetailsID;
        $this->orderID = $orderID;
        $this->bookOnStoreID = $bookOnStoreID;
        $this->quantity = $quantity;
    }

    // Getter methods
    public function getOrderDetailsID() {
        return $this->orderDetailsID;
    }

    public function getOrderID() {
        return $this->orderID;
    }

    public function getBookOnStoreID() {
        return $this->bookOnStoreID;
    }

    public function getQuantity() {
        return $this->quantity;
    }

    // Setter methods
    public function setOrderDetailsID($orderDetailsID) {
        $this->orderDetailsID = $orderDetailsID;
    }

    public function setOrderID($orderID) {
        $this->orderID = $orderID;
    }

    public function setBookOnStoreID($bookOnStoreID) {
        $this->bookOnStoreID = $bookOnStoreID;
    }

    public function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    // toString method
    public function __toString() {
        return "OrderDetails [orderDetailsID=" . $this->orderDetailsID .
               ", orderID=" . $this->orderID .
               ", bookOnStoreID=" . $this->bookOnStoreID .
               ", quantity=" . $this->quantity . "]";
    }
}
?>