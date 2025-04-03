<?php

class BookCategoryModel {
    private $categoryID;
    private $categoryName;
    private $createdAt;
    private $deletedAt;

    // Constructor
    public function __construct($categoryID = null, $categoryName = null, $createdAt = null, $deletedAt = null) {
        $this->categoryID = $categoryID;
        $this->categoryName = $categoryName;
        $this->createdAt = $createdAt;
        $this->deletedAt = $deletedAt;
    }

    // Getters and Setters
    public function getCategoryID() { return $this->categoryID; }
    public function setCategoryID($categoryID) { $this->categoryID = $categoryID; }

    public function getCategoryName() { return $this->categoryName; }
    public function setCategoryName($categoryName) { $this->categoryName = $categoryName; }

    public function getCreatedAt() { return $this->createdAt; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }

    public function getDeletedAt() { return $this->deletedAt; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // ToString method
    public function __toString() {
        return "BookCategoryModel { " .
            "categoryID=" . $this->categoryID . ", " .
            "categoryName='" . $this->categoryName . "', " .
            "createdAt='" . $this->createdAt . "', " .
            "deletedAt='" . $this->deletedAt . "' " .
            "}";
    }
}
