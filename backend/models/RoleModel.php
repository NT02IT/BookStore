<?php
class RoleModel {
    private $roleID;
    private $roleName;
    private $isDelete;

    public function __construct($roleID = null, $roleName, $isDelete = false) {
        $this->roleID = $roleID;
        $this->roleName = $roleName;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getRoleID() {
        return $this->roleID;
    }

    public function getRoleName() {
        return $this->roleName;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setRoleID($roleID) {
        $this->roleID = $roleID;
    }

    public function setRoleName($roleName) {
        $this->roleName = $roleName;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "Role [roleID=" . $this->roleID . 
               ", roleName=" . $this->roleName . 
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>