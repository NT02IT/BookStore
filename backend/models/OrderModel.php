<?php
class OrderModel {
    private $orderID;
    private $deliveryInfoID;
    private $orderDatetime;
    private $paid;
    private $orderStatus;

    public function __construct(
        $orderID = null,
        $deliveryInfoID,
        $orderDatetime = null,
        $paid,
        $orderStatus = 1
    ) {
        $this->orderID = $orderID;
        $this->deliveryInfoID = $deliveryInfoID;
        $this->orderDatetime = $orderDatetime ?? date('Y-m-d H:i:s');
        $this->paid = $paid;
        $this->orderStatus = $orderStatus;
    }

    // Getter methods
    public function getOrderID() {
        return $this->orderID;
    }

    public function getDeliveryInfoID() {
        return $this->deliveryInfoID;
    }

    public function getOrderDatetime() {
        return $this->orderDatetime;
    }

    public function getPaid() {
        return $this->paid;
    }

    public function getOrderStatus() {
        return $this->orderStatus;
    }

    // Setter methods
    public function setOrderID($orderID) {
        $this->orderID = $orderID;
    }

    public function setDeliveryInfoID($deliveryInfoID) {
        $this->deliveryInfoID = $deliveryInfoID;
    }

    public function setOrderDatetime($orderDatetime) {
        $this->orderDatetime = $orderDatetime;
    }

    public function setPaid($paid) {
        $this->paid = $paid;
    }

    public function setOrderStatus($orderStatus) {
        $this->orderStatus = $orderStatus;
    }

    // toString method
    public function __toString() {
        return "Order [orderID=" . $this->orderID .
               ", deliveryInfoID=" . $this->deliveryInfoID .
               ", orderDatetime=" . $this->orderDatetime .
               ", paid=" . ($this->paid ? 'true' : 'false') .
               ", orderStatus=" . $this->orderStatus . "]";
    }
}
?>