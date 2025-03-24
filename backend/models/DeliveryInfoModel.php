<?php
class DeliveryInfoModel {
    private $deliveryInfoID;
    private $enduserAccountID;
    private $prfName;
    private $prfAddress;
    private $phoneNumber;
    private $isDelete;

    public function __construct(
        $deliveryInfoID = null,
        $enduserAccountID,
        $prfName,
        $prfAddress,
        $phoneNumber,
        $isDelete = false
    ) {
        $this->deliveryInfoID = $deliveryInfoID;
        $this->enduserAccountID = $enduserAccountID;
        $this->prfName = $prfName;
        $this->prfAddress = $prfAddress;
        $this->phoneNumber = $phoneNumber;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getDeliveryInfoID() {
        return $this->deliveryInfoID;
    }

    public function getEnduserAccountID() {
        return $this->enduserAccountID;
    }

    public function getPrfName() {
        return $this->prfName;
    }

    public function getPrfAddress() {
        return $this->prfAddress;
    }

    public function getPhoneNumber() {
        return $this->phoneNumber;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setDeliveryInfoID($deliveryInfoID) {
        $this->deliveryInfoID = $deliveryInfoID;
    }

    public function setEnduserAccountID($enduserAccountID) {
        $this->enduserAccountID = $enduserAccountID;
    }

    public function setPrfName($prfName) {
        $this->prfName = $prfName;
    }

    public function setPrfAddress($prfAddress) {
        $this->prfAddress = $prfAddress;
    }

    public function setPhoneNumber($phoneNumber) {
        $this->phoneNumber = $phoneNumber;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "DeliveryInfo [deliveryInfoID=" . $this->deliveryInfoID .
               ", enduserAccountID=" . $this->enduserAccountID .
               ", prfName=" . $this->prfName .
               ", prfAddress=" . $this->prfAddress .
               ", phoneNumber=" . $this->phoneNumber .
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>