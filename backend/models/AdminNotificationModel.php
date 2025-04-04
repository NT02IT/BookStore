<?php
class AdminNotificationModel {
    private $adminAccountID;
    private $notificationID;
    private $readAt;

    private $notification; // instance của NotificationModel

    public function __construct($adminAccountID, $notificationID, $readAt = null, $notification = null) {
        $this->adminAccountID = $adminAccountID;
        $this->notificationID = $notificationID;
        $this->readAt = $readAt;
        $this->notification = $notification;
    }

    // Getter methods
    public function getAdminAccountID() {
        return $this->adminAccountID;
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
    public function setAdminAccountID($adminAccountID) {
        $this->adminAccountID = $adminAccountID;
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
        return "AdminNotification [adminAccountID=" . $this->adminAccountID .
                ", notificationID=" . $this->notificationID .
                ", readAt=" . ($this->readAt ? $this->readAt->format('Y-m-d H:i:s') : 'null') .
                ", notification=" . ($this->notification ? (string)$this->notification : 'null') .
                " ]";
    }
}
?>
