<?php
class BookOnStoreModel {
    private $bookOnStoreID;
    private $ISBN;
    private $sellingPrice;
    private $quantity;

    public function __construct(
        $bookOnStoreID = null,
        $ISBN,
        $sellingPrice,
        $quantity
    ) {
        $this->bookOnStoreID = $bookOnStoreID;
        $this->ISBN = $ISBN;
        $this->sellingPrice = $sellingPrice;
        $this->quantity = $quantity;
    }

    // Getter methods
    public function getBookOnStoreID() {
        return $this->bookOnStoreID;
    }

    public function getISBN() {
        return $this->ISBN;
    }

    public function getSellingPrice() {
        return $this->sellingPrice;
    }

    public function getQuantity() {
        return $this->quantity;
    }

    // Setter methods
    public function setBookOnStoreID($bookOnStoreID) {
        $this->bookOnStoreID = $bookOnStoreID;
    }

    public function setISBN($ISBN) {
        $this->ISBN = $ISBN;
    }

    public function setSellingPrice($sellingPrice) {
        $this->sellingPrice = $sellingPrice;
    }

    public function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    // toString method
    public function __toString() {
        return "BookOnStore [bookOnStoreID=" . $this->bookOnStoreID .
               ", ISBN=" . $this->ISBN .
               ", sellingPrice=" . number_format($this->sellingPrice, 2) .
               ", quantity=" . $this->quantity . "]";
    }
}
?>