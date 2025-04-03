<?php
class RoleModel {
    private $roleID;
    private $roleName;
    private $deletedAt;

    public function __construct($roleID = null, $roleName, $deletedAt = false) {
        $this->roleID = $roleID;
        $this->roleName = $roleName;
        $this->deletedAt = $deletedAt;
    }

    // Getter methods
    public function getRoleID() {
        return $this->roleID;
    }

    public function getRoleName() {
        return $this->roleName;
    }

    public function getdeletedAt() {
        return $this->deletedAt;
    }

    // Setter methods
    public function setRoleID($roleID) {
        $this->roleID = $roleID;
    }

    public function setRoleName($roleName) {
        $this->roleName = $roleName;
    }

    public function setdeletedAt($deletedAt) {
        $this->deletedAt = $deletedAt;
    }

    // toString method
    public function __toString() {
        return "Role [roleID=" . $this->roleID . 
                ", roleName=" . $this->roleName . 
                "Deleted At: " . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
                " }";
    }
}
?>