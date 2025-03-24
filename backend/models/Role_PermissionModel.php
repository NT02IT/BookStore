<?php
class Role_PermissionModel {
    private $rolePermissionID;
    private $roleID;
    private $permissionID;

    public function __construct($rolePermissionID = null, $roleID, $permissionID) {
        $this->rolePermissionID = $rolePermissionID;
        $this->roleID = $roleID;
        $this->permissionID = $permissionID;
    }

    // Getter methods
    public function getRolePermissionID() {
        return $this->rolePermissionID;
    }

    public function getRoleID() {
        return $this->roleID;
    }

    public function getPermissionID() {
        return $this->permissionID;
    }

    // Setter methods
    public function setRolePermissionID($rolePermissionID) {
        $this->rolePermissionID = $rolePermissionID;
    }

    public function setRoleID($roleID) {
        $this->roleID = $roleID;
    }

    public function setPermissionID($permissionID) {
        $this->permissionID = $permissionID;
    }

    // toString method
    public function __toString() {
        return "Role_Permission [rolePermissionID=" . $this->rolePermissionID .
               ", roleID=" . $this->roleID .
               ", permissionID=" . $this->permissionID . "]";
    }
}
?>