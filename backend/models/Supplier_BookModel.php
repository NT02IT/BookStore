<?php
class Supplier_BookModel {
    private $supplierBookID;
    private $supplierID;
    private $ISBN;

    public function __construct(
        $supplierBookID = null,
        $supplierID,
        $ISBN
    ) {
        $this->supplierBookID = $supplierBookID;
        $this->supplierID = $supplierID;
        $this->ISBN = $ISBN;
    }

    // Getter methods
    public function getSupplierBookID() {
        return $this->supplierBookID;
    }

    public function getSupplierID() {
        return $this->supplierID;
    }

    public function getISBN() {
        return $this->ISBN;
    }

    // Setter methods
    public function setSupplierBookID($supplierBookID) {
        $this->supplierBookID = $supplierBookID;
    }

    public function setSupplierID($supplierID) {
        $this->supplierID = $supplierID;
    }

    public function setISBN($ISBN) {
        $this->ISBN = $ISBN;
    }

    // toString method
    public function __toString() {
        return "Supplier_Book [supplierBookID=" . $this->supplierBookID .
               ", supplierID=" . $this->supplierID .
               ", ISBN=" . $this->ISBN . "]";
    }
}
?>