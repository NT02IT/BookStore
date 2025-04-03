<?php
class NotificationModel {
    private $notificationID;
    private $title;
    private $content;
    private $createdAt;

    public function __construct(
        $notificationID,
        $title,
        $content,
        $createdAt
    ) {
        $this->notificationID = $notificationID;
        $this->title = $title;
        $this->content = $content;
        $this->createdAt = $createdAt;
    }

    // Getters
    public function getNotificationID() { return $this->notificationID; }
    public function getTitle() { return $this->title; }
    public function getContent() { return $this->content; }
    public function getCreatedAt() { return $this->createdAt; }

    // Setters
    public function setTitle($title) { $this->title = $title; }
    public function setContent($content) { $this->content = $content; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }

    // toString method
    public function __toString() {
        return "Notification { " .
            "ID: " . $this->notificationID . ", " .
            "Title: " . $this->title . ", " .
            "Content: " . $this->content . ", " .
            "Created At: " . $this->createdAt->format('Y-m-d H:i:s') . 
            " }";
    }
}