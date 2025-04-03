<?php
class AdminAccountModel {
    private $adminAccountID;
    private $adminProfileID;
    private $roleID;
    private $username;
    private $password;
    private $createdAt;
    private $deletedAt;

    public function __construct(
        $adminAccountID,
        $adminProfileID,
        $roleID,
        $username,
        $password,
        $createdAt,
        $deletedAt = null
    ) {
        $this->adminAccountID = $adminAccountID;
        $this->adminProfileID = $adminProfileID;
        $this->roleID = $roleID;
        $this->username = $username;
        $this->password = $password;
        $this->createdAt = $createdAt;
        $this->deletedAt = $deletedAt;
    }

    // Getters
    public function getAdminAccountID() { return $this->adminAccountID; }
    public function getAdminProfileID() { return $this->adminProfileID; }
    public function getRoleID() { return $this->roleID; }
    public function getUsername() { return $this->username; }
    public function getPassword() { return $this->password; }
    public function getCreatedAt() { return $this->createdAt; }
    public function getDeletedAt() { return $this->deletedAt; }

    // Setters
    public function setAdminProfileID($adminProfileID) { $this->adminProfileID = $adminProfileID; }
    public function setRoleID($roleID) { $this->roleID = $roleID; }
    public function setUsername($username) { $this->username = $username; }
    public function setPassword($password) { $this->password = $password; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // toString method
    public function __toString() {
        return "AdminAccount { " .
            "ID: " . $this->adminAccountID . ", " .
            "Profile ID: " . $this->adminProfileID . ", " .
            "Role ID: " . $this->roleID . ", " .
            "Username: " . $this->username . ", " .
            "Created At: " . $this->createdAt->format('Y-m-d H:i:s') . ", " .
            "Deleted At: " . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
            " }";
    }
}
