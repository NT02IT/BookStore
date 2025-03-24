<?php
class DatabaseEntityModel {
    private $entityID;
    private $entityName;
    private $isDelete;

    public function __construct($entityID = null, $entityName, $isDelete = false) {
        $this->entityID = $entityID;
        $this->entityName = $entityName;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getEntityID() {
        return $this->entityID;
    }

    public function getEntityName() {
        return $this->entityName;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setEntityID($entityID) {
        $this->entityID = $entityID;
    }

    public function setEntityName($entityName) {
        $this->entityName = $entityName;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "DatabaseEntity [entityID=" . $this->entityID . 
               ", entityName=" . $this->entityName . 
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>