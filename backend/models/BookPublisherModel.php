<?php

class BookPublisherModel {
    private $publisherID;
    private $publisherName;

    // Constructor
    public function __construct($publisherID = null, $publisherName = null) {
        $this->publisherID = $publisherID;
        $this->publisherName = $publisherName;
    }

    // Getters and Setters
    public function getPublisherID() { return $this->publisherID; }
    public function setPublisherID($publisherID) { $this->publisherID = $publisherID; }

    public function getPublisherName() { return $this->publisherName; }
    public function setPublisherName($publisherName) { $this->publisherName = $publisherName; }

    // ToString method
    public function __toString() {
        return "BookPublisherModel { " .
            "publisherID=" . $this->publisherID . ", " .
            "publisherName='" . $this->publisherName . "' " .
            "}";
    }
}
