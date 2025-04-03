<?php

class ExportRequestTicketDetailsModel {
    private $exportRequestTicketID;
    private $bookID;
    private $quantity;

    // Constructor
    public function __construct($exportRequestTicketID = null, $bookID = null, $quantity = null) {
        $this->exportRequestTicketID = $exportRequestTicketID;
        $this->bookID = $bookID;
        $this->quantity = $quantity;
    }

    // Getters and Setters
    public function getExportRequestTicketID() { return $this->exportRequestTicketID; }
    public function setExportRequestTicketID($exportRequestTicketID) { $this->exportRequestTicketID = $exportRequestTicketID; }

    public function getBookID() { return $this->bookID; }
    public function setBookID($bookID) { $this->bookID = $bookID; }

    public function getQuantity() { return $this->quantity; }
    public function setQuantity($quantity) { $this->quantity = $quantity; }

    // ToString method
    public function __toString() {
        return "ExportRequestTicketDetailsModel { " .
            "exportRequestTicketID=" . $this->exportRequestTicketID . ", " .
            "bookID=" . $this->bookID . ", " .
            "quantity=" . $this->quantity . " }";
    }
}
