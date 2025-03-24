<?php
class NotificationModel {
    private $notificationID;
    private $adminAccountID;
    private $title;
    private $content;
    private $isRead;

    public function __construct(
        $notificationID = null,
        $adminAccountID,
        $title,
        $content,
        $isRead = false
    ) {
        $this->notificationID = $notificationID;
        $this->adminAccountID = $adminAccountID;
        $this->title = $title;
        $this->content = $content;
        $this->isRead = $isRead;
    }

    // Getter methods
    public function getNotificationID() {
        return $this->notificationID;
    }

    public function getAdminAccountID() {
        return $this->adminAccountID;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getContent() {
        return $this->content;
    }

    public function getIsRead() {
        return $this->isRead;
    }

    // Setter methods
    public function setNotificationID($notificationID) {
        $this->notificationID = $notificationID;
    }

    public function setAdminAccountID($adminAccountID) {
        $this->adminAccountID = $adminAccountID;
    }

    public function setTitle($title) {
        $this->title = $title;
    }

    public function setContent($content) {
        $this->content = $content;
    }

    public function setIsRead($isRead) {
        $this->isRead = $isRead;
    }

    // toString method
    public function __toString() {
        return "Notification [notificationID=" . $this->notificationID .
               ", adminAccountID=" . $this->adminAccountID .
               ", title=" . $this->title .
               ", content=" . substr($this->content, 0, 50) . "..." .
               ", isRead=" . ($this->isRead ? 'true' : 'false') . "]";
    }
}
?>