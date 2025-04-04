<?php
class RoleModel {
    private $roleID;
    private $roleName;
    private $deletedAt;

    // Quan hệ nhiều-nhiều với PermissionModel
    private $permissions = [];

    public function __construct($roleID = null, $roleName, $deletedAt = false, $permissions = []) {
        $this->roleID = $roleID;
        $this->roleName = $roleName;
        $this->deletedAt = $deletedAt;
        $this->permissions = $permissions;
    }

    // Getter methods
    public function getRoleID() {
        return $this->roleID;
    }

    public function getRoleName() {
        return $this->roleName;
    }

    public function getDeletedAt() {
        return $this->deletedAt;
    }

    public function getPermissions() {
        return $this->permissions;
    }

    // Setter methods
    public function setRoleID($roleID) {
        $this->roleID = $roleID;
    }

    public function setRoleName($roleName) {
        $this->roleName = $roleName;
    }

    public function setDeletedAt($deletedAt) {
        $this->deletedAt = $deletedAt;
    }

    public function setPermissions($permissions) {
        $this->permissions = $permissions;
    }

    // Add one permission
    public function addPermission($permission) {
        $this->permissions[] = $permission;
    }

    // toString method
    public function __toString() {
        $permissionStr = implode(", ", $this->permissions);
        return "Role [roleID=" . $this->roleID . 
                ", roleName=" . $this->roleName . 
                ", deletedAt=" . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') . 
                ", permissions=[" . $permissionStr . "]" . 
                " ]";
    }
}
?>