<?php
class NotificationService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Create notification
    public function create($notification) {
        $stmt = $this->db->prepare("CALL sp_InsertNotification(?, ?, ?)");
        $stmt->bindParam(1, $notification->getAdminAccountID());
        $stmt->bindParam(2, $notification->getTitle());
        $stmt->bindParam(3, $notification->getContent());
        return $stmt->execute();
    }

    // Update notification
    public function update($notification) {
        $stmt = $this->db->prepare("CALL sp_UpdateNotification(?, ?, ?)");
        $stmt->bindParam(1, $notification->getNotificationID());
        $stmt->bindParam(2, $notification->getTitle());
        $stmt->bindParam(3, $notification->getContent());
        return $stmt->execute();
    }

    // Delete notification
    public function delete($notificationID) {
        $stmt = $this->db->prepare("CALL sp_DeleteNotification(?)");
        $stmt->bindParam(1, $notificationID);
        return $stmt->execute();
    }

    // Mark as read
    public function markAsRead($notificationID) {
        $stmt = $this->db->prepare("CALL sp_MarkNotificationAsRead(?)");
        $stmt->bindParam(1, $notificationID);
        return $stmt->execute();
    }

    // Get all notifications
    public function getAll() {
        $stmt = $this->db->prepare("CALL sp_GetAllNotifications()");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get by ID
    public function getById($notificationID) {
        $stmt = $this->db->prepare("CALL sp_GetNotificationByID(?)");
        $stmt->bindParam(1, $notificationID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>