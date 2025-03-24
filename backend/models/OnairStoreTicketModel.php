<?php
class OnairStoreTicketModel {
    private $onairStoreTicketID;
    private $adminAccountID;
    private $ticketStatus;

    public function __construct(
        $onairStoreTicketID = null,
        $adminAccountID,
        $ticketStatus = 1
    ) {
        $this->onairStoreTicketID = $onairStoreTicketID;
        $this->adminAccountID = $adminAccountID;
        $this->ticketStatus = $ticketStatus;
    }

    // Getter methods
    public function getOnairStoreTicketID() {
        return $this->onairStoreTicketID;
    }

    public function getAdminAccountID() {
        return $this->adminAccountID;
    }

    public function getTicketStatus() {
        return $this->ticketStatus;
    }

    // Setter methods
    public function setOnairStoreTicketID($onairStoreTicketID) {
        $this->onairStoreTicketID = $onairStoreTicketID;
    }

    public function setAdminAccountID($adminAccountID) {
        $this->adminAccountID = $adminAccountID;
    }

    public function setTicketStatus($ticketStatus) {
        $this->ticketStatus = $ticketStatus;
    }

    // toString method
    public function __toString() {
        return "OnairStoreTicket [onairStoreTicketID=" . $this->onairStoreTicketID .
               ", adminAccountID=" . $this->adminAccountID .
               ", ticketStatus=" . $this->ticketStatus . "]";
    }
}
?>