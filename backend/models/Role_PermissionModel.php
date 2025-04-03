<?php
class Role_PermissionModel {
    private $roleID;
    private $permissionID;

    public function __construct($roleID, $permissionID) {
        $this->roleID = $roleID;
        $this->permissionID = $permissionID;
    }

    // Getter methods
    public function getRoleID() {
        return $this->roleID;
    }

    public function getPermissionID() {
        return $this->permissionID;
    }

    // Setter methods
    public function setRoleID($roleID) {
        $this->roleID = $roleID;
    }

    public function setPermissionID($permissionID) {
        $this->permissionID = $permissionID;
    }

    // toString method
    public function __toString() {
        return "Role_Permission [roleID=" . $this->roleID .
               ", permissionID=" . $this->permissionID . "]";
    }
}
?>