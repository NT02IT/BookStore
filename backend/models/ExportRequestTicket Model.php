<?php

class ExportRequestTicketModel {
    private $exportRequestTicketID;
    private $adminAccountID;
    private $requestDatetime;
    private $ticketStatus;

    // Constructor
    public function __construct($exportRequestTicketID = null, $adminAccountID = null, $requestDatetime = null, $ticketStatus = 1) {
        $this->exportRequestTicketID = $exportRequestTicketID;
        $this->adminAccountID = $adminAccountID;
        $this->requestDatetime = $requestDatetime;
        $this->ticketStatus = $ticketStatus;
    }

    // Getters and Setters
    public function getExportRequestTicketID() { return $this->exportRequestTicketID; }
    public function setExportRequestTicketID($exportRequestTicketID) { $this->exportRequestTicketID = $exportRequestTicketID; }

    public function getAdminAccountID() { return $this->adminAccountID; }
    public function setAdminAccountID($adminAccountID) { $this->adminAccountID = $adminAccountID; }

    public function getRequestDatetime() { return $this->requestDatetime; }
    public function setRequestDatetime($requestDatetime) { $this->requestDatetime = $requestDatetime; }

    public function getTicketStatus() { return $this->ticketStatus; }
    public function setTicketStatus($ticketStatus) { $this->ticketStatus = $ticketStatus; }

    // ToString method
    public function __toString() {
        return "ExportRequestTicketModel { " .
            "exportRequestTicketID=" . $this->exportRequestTicketID . ", " .
            "adminAccountID=" . $this->adminAccountID . ", " .
            "requestDatetime='" . $this->requestDatetime . "', " .
            "ticketStatus=" . $this->ticketStatus . " " .
            "}";
    }
}