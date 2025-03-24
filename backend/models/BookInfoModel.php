<?php
class BookInfoModel {
    private $ISBN;
    private $categoryID;
    private $bookTitle;
    private $bookAuthor;
    private $yearOfPublication;
    private $publisher;
    private $imagesURL;
    private $bookDesc;
    private $isDelete;

    public function __construct(
        $ISBN,
        $categoryID,
        $bookTitle,
        $bookAuthor,
        $yearOfPublication = null,
        $publisher = null,
        $imagesURL = null,
        $bookDesc = null,
        $isDelete = false
    ) {
        $this->ISBN = $ISBN;
        $this->categoryID = $categoryID;
        $this->bookTitle = $bookTitle;
        $this->bookAuthor = $bookAuthor;
        $this->yearOfPublication = $yearOfPublication;
        $this->publisher = $publisher;
        $this->imagesURL = $imagesURL;
        $this->bookDesc = $bookDesc;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getISBN() {
        return $this->ISBN;
    }

    public function getCategoryID() {
        return $this->categoryID;
    }

    public function getBookTitle() {
        return $this->bookTitle;
    }

    public function getBookAuthor() {
        return $this->bookAuthor;
    }

    public function getYearOfPublication() {
        return $this->yearOfPublication;
    }

    public function getPublisher() {
        return $this->publisher;
    }

    public function getImagesURL() {
        return $this->imagesURL;
    }

    public function getBookDesc() {
        return $this->bookDesc;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setISBN($ISBN) {
        $this->ISBN = $ISBN;
    }

    public function setCategoryID($categoryID) {
        $this->categoryID = $categoryID;
    }

    public function setBookTitle($bookTitle) {
        $this->bookTitle = $bookTitle;
    }

    public function setBookAuthor($bookAuthor) {
        $this->bookAuthor = $bookAuthor;
    }

    public function setYearOfPublication($yearOfPublication) {
        $this->yearOfPublication = $yearOfPublication;
    }

    public function setPublisher($publisher) {
        $this->publisher = $publisher;
    }

    public function setImagesURL($imagesURL) {
        $this->imagesURL = $imagesURL;
    }

    public function setBookDesc($bookDesc) {
        $this->bookDesc = $bookDesc;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "BookInfo [ISBN=" . $this->ISBN .
               ", categoryID=" . $this->categoryID .
               ", bookTitle=" . $this->bookTitle .
               ", bookAuthor=" . $this->bookAuthor .
               ", yearOfPublication=" . $this->yearOfPublication .
               ", publisher=" . $this->publisher .
               ", imagesURL=" . $this->imagesURL .
               ", bookDesc=" . substr($this->bookDesc ?? '', 0, 30) . "..." .
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>