<?php
class SupplierModel {
    private $supplierID;
    private $supplierName;
    private $supplierAddress;
    private $phoneNumber;
    private $email;
    private $deletedAt;

    // Quan hệ nhiều-nhiều với sách
    private $books = []; // danh sách BookInfoModel

    public function __construct(
        $supplierID = null,
        $supplierName,
        $supplierAddress = null,
        $phoneNumber,
        $email = null,
        $deletedAt = null,
        $books = []
    ) {
        $this->supplierID = $supplierID;
        $this->supplierName = $supplierName;
        $this->supplierAddress = $supplierAddress;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->deletedAt = $deletedAt;
        $this->books = $books;
    }

    // Getter methods
    public function getSupplierID() {
        return $this->supplierID;
    }

    public function getSupplierName() {
        return $this->supplierName;
    }

    public function getSupplierAddress() {
        return $this->supplierAddress;
    }

    public function getPhoneNumber() {
        return $this->phoneNumber;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getDeletedAt() {
        return $this->deletedAt;
    }

    public function getBooks() {
        return $this->books;
    }

    // Setter methods
    public function setSupplierID($supplierID) {
        $this->supplierID = $supplierID;
    }

    public function setSupplierName($supplierName) {
        $this->supplierName = $supplierName;
    }

    public function setSupplierAddress($supplierAddress) {
        $this->supplierAddress = $supplierAddress;
    }

    public function setPhoneNumber($phoneNumber) {
        $this->phoneNumber = $phoneNumber;
    }

    public function setEmail($email) {
        $this->email = $email;
    }

    public function setDeletedAt($deletedAt) {
        $this->deletedAt = $deletedAt;
    }

    public function setBooks($books) {
        $this->books = $books;
    }

    public function addBook($book) {
        $this->books[] = $book;
    }

    // toString method
    public function __toString() {
        $bookStr = implode(', ', array_map(function($b) {
            return is_object($b) ? (string)$b : $b;
        }, $this->books));

        return "Supplier [supplierID=" . $this->supplierID .
                ", supplierName=" . $this->supplierName .
                ", supplierAddress=" . $this->supplierAddress .
                ", phoneNumber=" . $this->phoneNumber .
                ", email=" . $this->email .
                ", deletedAt=" . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
                ", books=[" . $bookStr . "]" .
                " ]";
    }
}
?>