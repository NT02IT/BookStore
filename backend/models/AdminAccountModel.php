<?php
class AdminAccountModel {
    private $adminAccountID;
    private $roleID;
    private $username;
    private $pwd;
    private $adminProfileID;
    private $dateCreated;
    private $isDelete;

    public function __construct($adminAccountID = null, $roleID, $username, $pwd, $adminProfileID, 
                                $dateCreated = null, $isDelete = false) {
        $this->adminAccountID = $adminAccountID;
        $this->roleID = $roleID;
        $this->username = $username;
        $this->pwd = $pwd;
        $this->adminProfileID = $adminProfileID;
        $this->dateCreated = $dateCreated;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getAdminAccountID() {
        return $this->adminAccountID;
    }

    public function getRoleID() {
        return $this->roleID;
    }

    public function getUsername() {
        return $this->username;
    }

    public function getPwd() {
        return $this->pwd;
    }

    public function getAdminProfileID() {
        return $this->adminProfileID;
    }

    public function getDateCreated() {
        return $this->dateCreated;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setAdminAccountID($adminAccountID) {
        $this->adminAccountID = $adminAccountID;
    }

    public function setRoleID($roleID) {
        $this->roleID = $roleID;
    }

    public function setUsername($username) {
        $this->username = $username;
    }

    public function setPwd($pwd) {
        $this->pwd = $pwd;
    }

    public function setAdminProfileID($adminProfileID) {
        $this->adminProfileID = $adminProfileID;
    }

    public function setDateCreated($dateCreated) {
        $this->dateCreated = $dateCreated;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "AdminAccount [adminAccountID=" . $this->adminAccountID . 
               ", roleID=" . $this->roleID . 
               ", username=" . $this->username . 
               ", pwd=" . $this->pwd . 
               ", adminProfileID=" . $this->adminProfileID . 
               ", dateCreated=" . $this->dateCreated . 
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>