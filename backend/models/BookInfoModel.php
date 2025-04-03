<?php

class BookInfoModel {
    private $bookID;
    private $ISBN;
    private $bookTitle;
    private $imageURL;
    private $ebookURL;
    private $bookDesc;
    private $createdAt;
    private $deletedAt;

    // Constructor
    public function __construct($bookID = null, $ISBN = null, $bookTitle = null, $imageURL = null, $ebookURL = null, $bookDesc = null, $createdAt = null, $deletedAt = null) {
        $this->bookID = $bookID;
        $this->ISBN = $ISBN;
        $this->bookTitle = $bookTitle;
        $this->imageURL = $imageURL;
        $this->ebookURL = $ebookURL;
        $this->bookDesc = $bookDesc;
        $this->createdAt = $createdAt;
        $this->deletedAt = $deletedAt;
    }

    // Getters and Setters
    public function getBookID() { return $this->bookID; }
    public function setBookID($bookID) { $this->bookID = $bookID; }

    public function getISBN() { return $this->ISBN; }
    public function setISBN($ISBN) { $this->ISBN = $ISBN; }

    public function getBookTitle() { return $this->bookTitle; }
    public function setBookTitle($bookTitle) { $this->bookTitle = $bookTitle; }

    public function getImageURL() { return $this->imageURL; }
    public function setImageURL($imageURL) { $this->imageURL = $imageURL; }

    public function getEbookURL() { return $this->ebookURL; }
    public function setEbookURL($ebookURL) { $this->ebookURL = $ebookURL; }

    public function getBookDesc() { return $this->bookDesc; }
    public function setBookDesc($bookDesc) { $this->bookDesc = $bookDesc; }

    public function getCreatedAt() { return $this->createdAt; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }

    public function getDeletedAt() { return $this->deletedAt; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // ToString method
    public function __toString() {
        return "BookInfoModel { " .
            "bookID=" . $this->bookID . ", " .
            "ISBN='" . $this->ISBN . "', " .
            "bookTitle='" . $this->bookTitle . "', " .
            "imageURL='" . $this->imageURL . "', " .
            "ebookURL='" . $this->ebookURL . "', " .
            "bookDesc='" . $this->bookDesc . "', " .
            "createdAt='" . $this->createdAt . "', " .
            "deletedAt='" . $this->deletedAt . "' " .
            "}";
    }
}
