<?php

class OrderModel {
    private $orderID;
    private $deliveryinfoID;
    private $orderDatetime;
    private $paid;
    private $orderStatus;

    // Constructor
    public function __construct($orderID = null, $deliveryinfoID = null, $orderDatetime = null, $paid = null, $orderStatus = 1) {
        $this->orderID = $orderID;
        $this->deliveryinfoID = $deliveryinfoID;
        $this->orderDatetime = $orderDatetime;
        $this->paid = $paid;
        $this->orderStatus = $orderStatus;
    }

    // Getters and Setters
    public function getOrderID() { return $this->orderID; }
    public function setOrderID($orderID) { $this->orderID = $orderID; }

    public function getDeliveryinfoID() { return $this->deliveryinfoID; }
    public function setDeliveryinfoID($deliveryinfoID) { $this->deliveryinfoID = $deliveryinfoID; }

    public function getOrderDatetime() { return $this->orderDatetime; }
    public function setOrderDatetime($orderDatetime) { $this->orderDatetime = $orderDatetime; }

    public function getPaid() { return $this->paid; }
    public function setPaid($paid) { $this->paid = $paid; }

    public function getOrderStatus() { return $this->orderStatus; }
    public function setOrderStatus($orderStatus) { $this->orderStatus = $orderStatus; }

    // ToString method
    public function __toString() {
        return "OrderModel { " .
            "orderID=" . $this->orderID . ", " .
            "deliveryinfoID=" . $this->deliveryinfoID . ", " .
            "orderDatetime='" . $this->orderDatetime . "', " .
            "paid=" . $this->paid . ", " .
            "orderStatus=" . $this->orderStatus . " }";
    }
}