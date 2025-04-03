<?php
class DatabaseEntityModel {
    private $entityID;
    private $entityName;
    private $deletedAt;

    public function __construct(
        $entityID,
        $entityName,
        $deletedAt = null
    ) {
        $this->entityID = $entityID;
        $this->entityName = $entityName;
        $this->deletedAt = $deletedAt;
    }

    // Getters
    public function getEntityID() { return $this->entityID; }
    public function getEntityName() { return $this->entityName; }
    public function getDeletedAt() { return $this->deletedAt; }

    // Setters
    public function setEntityName($entityName) { $this->entityName = $entityName; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // toString method
    public function __toString() {
        return "DatabaseEntity { " .
            "ID: " . $this->entityID . ", " .
            "Name: " . $this->entityName . ", " .
            "Deleted At: " . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
            " }";
    }
}