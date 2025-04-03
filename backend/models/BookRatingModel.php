<?php

class BookRatingModel {
    private $bookRatingID;
    private $enduserAccountID;
    private $bookOnStoreID;
    private $rate;
    private $comment;
    private $createdAt;

    // Constructor
    public function __construct($bookRatingID = null, $enduserAccountID = null, $bookOnStoreID = null, $rate = null, $comment = null, $createdAt = null) {
        $this->bookRatingID = $bookRatingID;
        $this->enduserAccountID = $enduserAccountID;
        $this->bookOnStoreID = $bookOnStoreID;
        $this->rate = $rate;
        $this->comment = $comment;
        $this->createdAt = $createdAt;
    }

    // Getters and Setters
    public function getBookRatingID() { return $this->bookRatingID; }
    public function setBookRatingID($bookRatingID) { $this->bookRatingID = $bookRatingID; }

    public function getEnduserAccountID() { return $this->enduserAccountID; }
    public function setEnduserAccountID($enduserAccountID) { $this->enduserAccountID = $enduserAccountID; }

    public function getBookOnStoreID() { return $this->bookOnStoreID; }
    public function setBookOnStoreID($bookOnStoreID) { $this->bookOnStoreID = $bookOnStoreID; }

    public function getRate() { return $this->rate; }
    public function setRate($rate) { $this->rate = $rate; }

    public function getComment() { return $this->comment; }
    public function setComment($comment) { $this->comment = $comment; }

    public function getCreatedAt() { return $this->createdAt; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }

    // ToString method
    public function __toString() {
        return "BookRatingModel { " .
            "bookRatingID=" . $this->bookRatingID . ", " .
            "enduserAccountID=" . $this->enduserAccountID . ", " .
            "bookOnStoreID=" . $this->bookOnStoreID . ", " .
            "rate=" . $this->rate . ", " .
            "comment='" . $this->comment . "', " .
            "createdAt='" . $this->createdAt . "' }";
    }
}
