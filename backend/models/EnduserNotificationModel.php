<?php
class EnduserNotificationModel {
    private $enduserAccountID;
    private $notificationID;
    private $readAt;

    private $notification; // instance của NotificationModel

    public function __construct($enduserAccountID, $notificationID, $readAt = null, $notification = null) {
        $this->enduserAccountID = $enduserAccountID;
        $this->notificationID = $notificationID;
        $this->readAt = $readAt;
        $this->notification = $notification;
    }

    // Getter methods
    public function getEnduserAccountID() {
        return $this->enduserAccountID;
    }

    public function getNotificationID() {
        return $this->notificationID;
    }

    public function getReadAt() {
        return $this->readAt;
    }

    public function getNotification() {
        return $this->notification;
    }

    // Setter methods
    public function setEnduserAccountID($enduserAccountID) {
        $this->enduserAccountID = $enduserAccountID;
    }

    public function setNotificationID($notificationID) {
        $this->notificationID = $notificationID;
    }

    public function setReadAt($readAt) {
        $this->readAt = $readAt;
    }

    public function setNotification($notification) {
        $this->notification = $notification;
    }

    // toString method
    public function __toString() {
        return "EnduserNotification [enduserAccountID=" . $this->enduserAccountID .
                ", notificationID=" . $this->notificationID .
                ", readAt=" . ($this->readAt ? $this->readAt->format('Y-m-d H:i:s') : 'null') .
                ", notification=" . ($this->notification ? (string)$this->notification : 'null') .
                " ]";
    }
}
?>
