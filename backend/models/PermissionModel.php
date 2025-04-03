<?php
class PermissionModel {
    private $permissionID;
    private $entityID;
    private $canCreate;
    private $canRead;
    private $canUpdate;
    private $canDelete;
    private $isRestrictedToOwnData;

    public function __construct(
        $permissionID,
        $entityID,
        $canCreate = false,
        $canRead = false,
        $canUpdate = false,
        $canDelete = false,
        $isRestrictedToOwnData = false
    ) {
        $this->permissionID = $permissionID;
        $this->entityID = $entityID;
        $this->canCreate = $canCreate;
        $this->canRead = $canRead;
        $this->canUpdate = $canUpdate;
        $this->canDelete = $canDelete;
        $this->isRestrictedToOwnData = $isRestrictedToOwnData;
    }

    // Getters
    public function getPermissionID() { return $this->permissionID; }
    public function getEntityID() { return $this->entityID; }
    public function canCreate() { return $this->canCreate; }
    public function canRead() { return $this->canRead; }
    public function canUpdate() { return $this->canUpdate; }
    public function canDelete() { return $this->canDelete; }
    public function isRestrictedToOwnData() { return $this->isRestrictedToOwnData; }

    // Setters
    public function setCanCreate($canCreate) { $this->canCreate = $canCreate; }
    public function setCanRead($canRead) { $this->canRead = $canRead; }
    public function setCanUpdate($canUpdate) { $this->canUpdate = $canUpdate; }
    public function setCanDelete($canDelete) { $this->canDelete = $canDelete; }
    public function setIsRestrictedToOwnData($isRestrictedToOwnData) { $this->isRestrictedToOwnData = $isRestrictedToOwnData; }

    // toString method
    public function __toString() {
        return "Permission { " .
            "ID: " . $this->permissionID . ", " .
            "Entity ID: " . $this->entityID . ", " .
            "Create: " . ($this->canCreate ? 'true' : 'false') . ", " .
            "Read: " . ($this->canRead ? 'true' : 'false') . ", " .
            "Update: " . ($this->canUpdate ? 'true' : 'false') . ", " .
            "Delete: " . ($this->canDelete ? 'true' : 'false') . ", " .
            "Restricted to Own Data: " . ($this->isRestrictedToOwnData ? 'true' : 'false') .
            " }";
    }
}