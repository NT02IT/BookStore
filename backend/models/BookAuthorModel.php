<?php

class BookAuthorModel {
    private $authorID;
    private $authorName;

    // Constructor
    public function __construct($authorID = null, $authorName = null) {
        $this->authorID = $authorID;
        $this->authorName = $authorName;
    }

    // Getters and Setters
    public function getAuthorID() { return $this->authorID; }
    public function setAuthorID($authorID) { $this->authorID = $authorID; }

    public function getAuthorName() { return $this->authorName; }
    public function setAuthorName($authorName) { $this->authorName = $authorName; }

    // ToString method
    public function __toString() {
        return "BookAuthorModel { " .
            "authorID=" . $this->authorID . ", " .
            "authorName='" . $this->authorName . "' " .
            "}";
    }
}
