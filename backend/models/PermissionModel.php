<?php
class PermissionModel {
    private $permissionID;
    private $entityID;
    private $canCreate;
    private $canRead;
    private $canUpdate;
    private $canDelete;
    private $isRestrictedToOwnData;

    public function __construct($permissionID = null, $entityID, $canCreate = false, 
                               $canRead = false, $canUpdate = false, $canDelete = false, 
                               $isRestrictedToOwnData = false) {
        $this->permissionID = $permissionID;
        $this->entityID = $entityID;
        $this->canCreate = $canCreate;
        $this->canRead = $canRead;
        $this->canUpdate = $canUpdate;
        $this->canDelete = $canDelete;
        $this->isRestrictedToOwnData = $isRestrictedToOwnData;
    }

    // Getter methods
    public function getPermissionID() {
        return $this->permissionID;
    }

    public function getEntityID() {
        return $this->entityID;
    }

    public function getCanCreate() {
        return $this->canCreate;
    }

    public function getCanRead() {
        return $this->canRead;
    }

    public function getCanUpdate() {
        return $this->canUpdate;
    }

    public function getCanDelete() {
        return $this->canDelete;
    }

    public function getIsRestrictedToOwnData() {
        return $this->isRestrictedToOwnData;
    }

    // Setter methods
    public function setPermissionID($permissionID) {
        $this->permissionID = $permissionID;
    }

    public function setEntityID($entityID) {
        $this->entityID = $entityID;
    }

    public function setCanCreate($canCreate) {
        $this->canCreate = $canCreate;
    }

    public function setCanRead($canRead) {
        $this->canRead = $canRead;
    }

    public function setCanUpdate($canUpdate) {
        $this->canUpdate = $canUpdate;
    }

    public function setCanDelete($canDelete) {
        $this->canDelete = $canDelete;
    }

    public function setIsRestrictedToOwnData($isRestrictedToOwnData) {
        $this->isRestrictedToOwnData = $isRestrictedToOwnData;
    }

    // toString method
    public function __toString() {
        return "Permission [permissionID=" . $this->permissionID .
               ", entityID=" . $this->entityID .
               ", canCreate=" . ($this->canCreate ? 'true' : 'false') .
               ", canRead=" . ($this->canRead ? 'true' : 'false') .
               ", canUpdate=" . ($this->canUpdate ? 'true' : 'false') .
               ", canDelete=" . ($this->canDelete ? 'true' : 'false') .
               ", isRestrictedToOwnData=" . ($this->isRestrictedToOwnData ? 'true' : 'false') . "]";
    }
}
?>