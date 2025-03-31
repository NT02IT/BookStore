<?php
class EnduserAccountModel {
    private $enduserAccountID;
    private $enduserProfileID;
    private $username;
    private $pwd;
    private $dateCreated;
    private $isDelete;

    public function __construct(
        $enduserAccountID = null,
        $enduserProfileID,
        $username,
        $pwd,
        $dateCreated = null,
        $isDelete = false
    ) {
        $this->enduserAccountID = $enduserAccountID;
        $this->enduserProfileID = $enduserProfileID;
        $this->username = $username;
        $this->pwd = $pwd;
        $this->dateCreated = $dateCreated ?? date('Y-m-d H:i:s');
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getEnduserAccountID() {
        return $this->enduserAccountID;
    }

    public function getEnduserProfileID() {
        return $this->enduserProfileID;
    }

    public function getUsername() {
        return $this->username;
    }

    public function getPwd() {
        return $this->pwd;
    }

    public function getDateCreated() {
        return $this->dateCreated;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setEnduserAccountID($enduserAccountID) {
        $this->enduserAccountID = $enduserAccountID;
    }

    public function setEnduserProfileID($enduserProfileID) {
        $this->enduserProfileID = $enduserProfileID;
    }

    public function setUsername($username) {
        $this->username = $username;
    }

    public function setPwd($pwd) {
        $this->pwd = $pwd;
    }

    public function setDateCreated($dateCreated) {
        $this->dateCreated = $dateCreated;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "EnduserAccount [enduserAccountID=" . $this->enduserAccountID .
               ", enduserProfileID=" . $this->enduserProfileID .
               ", username=" . $this->username .
               ", pwd=" . $this->pwd .
               ", dateCreated=" . $this->dateCreated .
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>