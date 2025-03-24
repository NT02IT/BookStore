<?php
class CategoryModel {
    private $categoryID;
    private $categoryName;
    private $dateCreate;
    private $isDelete;

    public function __construct(
        $categoryID = null,
        $categoryName,
        $dateCreate = null,
        $isDelete = false
    ) {
        $this->categoryID = $categoryID;
        $this->categoryName = $categoryName;
        $this->dateCreate = $dateCreate ?? date('Y-m-d H:i:s');
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getCategoryID() {
        return $this->categoryID;
    }

    public function getCategoryName() {
        return $this->categoryName;
    }

    public function getDateCreate() {
        return $this->dateCreate;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setCategoryID($categoryID) {
        $this->categoryID = $categoryID;
    }

    public function setCategoryName($categoryName) {
        $this->categoryName = $categoryName;
    }

    public function setDateCreate($dateCreate) {
        $this->dateCreate = $dateCreate;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "Category [categoryID=" . $this->categoryID .
               ", categoryName=" . $this->categoryName .
               ", dateCreate=" . $this->dateCreate .
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>