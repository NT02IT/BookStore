<?php
class BookRatingModel {
    private $bookRatingID;
    private $enduserAccountID;
    private $bookOnStoreID;
    private $rate;
    private $comment;

    public function __construct(
        $bookRatingID = null,
        $enduserAccountID,
        $bookOnStoreID,
        $rate,
        $comment = null
    ) {
        $this->bookRatingID = $bookRatingID;
        $this->enduserAccountID = $enduserAccountID;
        $this->bookOnStoreID = $bookOnStoreID;
        $this->rate = $rate;
        $this->comment = $comment;
    }

    // Getter methods
    public function getBookRatingID() {
        return $this->bookRatingID;
    }

    public function getEnduserAccountID() {
        return $this->enduserAccountID;
    }

    public function getBookOnStoreID() {
        return $this->bookOnStoreID;
    }

    public function getRate() {
        return $this->rate;
    }

    public function getComment() {
        return $this->comment;
    }

    // Setter methods
    public function setBookRatingID($bookRatingID) {
        $this->bookRatingID = $bookRatingID;
    }

    public function setEnduserAccountID($enduserAccountID) {
        $this->enduserAccountID = $enduserAccountID;
    }

    public function setBookOnStoreID($bookOnStoreID) {
        $this->bookOnStoreID = $bookOnStoreID;
    }

    public function setRate($rate) {
        $this->rate = $rate;
    }

    public function setComment($comment) {
        $this->comment = $comment;
    }

    // toString method
    public function __toString() {
        return "BookRating [bookRatingID=" . $this->bookRatingID .
               ", enduserAccountID=" . $this->enduserAccountID .
               ", bookOnStoreID=" . $this->bookOnStoreID .
               ", rate=" . $this->rate .
               ", comment=" . ($this->comment ? substr($this->comment, 0, 50) . "..." : 'null') . "]";
    }
}
?>