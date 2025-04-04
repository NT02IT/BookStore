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

    // Quan hệ nhiều-nhiều
    private $categories = []; // Danh sách categoryID hoặc CategoryModel
    private $authors = [];    // Danh sách authorID hoặc AuthorModel
    private $publishers = []; // Danh sách các đối tượng BookInfoPublisherModel

    public function __construct(
        $bookID = null,
        $ISBN = null,
        $bookTitle,
        $imageURL = null,
        $ebookURL = null,
        $bookDesc = null,
        $createdAt = null,
        $deletedAt = null,
        $categories = [],
        $authors = [],
        $publishers = []
    ) {
        $this->bookID = $bookID;
        $this->ISBN = $ISBN;
        $this->bookTitle = $bookTitle;
        $this->imageURL = $imageURL;
        $this->ebookURL = $ebookURL;
        $this->bookDesc = $bookDesc;
        $this->createdAt = $createdAt;
        $this->deletedAt = $deletedAt;
        $this->categories = $categories;
        $this->authors = $authors;
        $this->publishers = $publishers;
    }

    // Getter methods
    public function getBookID() {
        return $this->bookID;
    }

    public function getISBN() {
        return $this->ISBN;
    }

    public function getBookTitle() {
        return $this->bookTitle;
    }

    public function getImageURL() {
        return $this->imageURL;
    }

    public function getEbookURL() {
        return $this->ebookURL;
    }

    public function getBookDesc() {
        return $this->bookDesc;
    }

    public function getCreatedAt() {
        return $this->createdAt;
    }

    public function getDeletedAt() {
        return $this->deletedAt;
    }

    public function getCategories() {
        return $this->categories;
    }

    public function getAuthors() {
        return $this->authors;
    }

    public function getPublishers() {
        return $this->publishers;
    }

    // Setter methods
    public function setBookID($bookID) {
        $this->bookID = $bookID;
    }

    public function setISBN($ISBN) {
        $this->ISBN = $ISBN;
    }

    public function setBookTitle($bookTitle) {
        $this->bookTitle = $bookTitle;
    }

    public function setImageURL($imageURL) {
        $this->imageURL = $imageURL;
    }

    public function setEbookURL($ebookURL) {
        $this->ebookURL = $ebookURL;
    }

    public function setBookDesc($bookDesc) {
        $this->bookDesc = $bookDesc;
    }

    public function setCreatedAt($createdAt) {
        $this->createdAt = $createdAt;
    }

    public function setDeletedAt($deletedAt) {
        $this->deletedAt = $deletedAt;
    }

    public function setCategories($categories) {
        $this->categories = $categories;
    }

    public function setAuthors($authors) {
        $this->authors = $authors;
    }

    public function setPublishers($publishers) {
        $this->publishers = $publishers;
    }

    // Helper methods
    public function addCategory($category) {
        $this->categories[] = $category;
    }

    public function addAuthor($author) {
        $this->authors[] = $author;
    }

    public function addPublisher($publisher) {
        $this->publishers[] = $publisher;
    }

    // toString method
    public function __toString() {
        $categoryStr = implode(', ', $this->categories);
        $authorStr = implode(', ', $this->authors);
        $publisherStr = implode(', ', array_map(function($p) {
            return is_object($p) ? (string)$p : json_encode($p);
        }, $this->publishers));

        return "BookInfo [bookID=" . $this->bookID .
                ", ISBN=" . $this->ISBN .
                ", bookTitle=" . $this->bookTitle .
                ", imageURL=" . $this->imageURL .
                ", ebookURL=" . $this->ebookURL .
                ", bookDesc=" . $this->bookDesc .
                ", createdAt=" . ($this->createdAt ? $this->createdAt->format('Y-m-d H:i:s') : 'null') .
                ", deletedAt=" . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
                ", categories=[" . $categoryStr . "]" .
                ", authors=[" . $authorStr . "]" .
                ", publishers=[" . $publisherStr . "]" .
                " ]";
    }
}
?>