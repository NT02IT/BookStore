<?php
class CartModel {
    private $cartID;
    private $enduserAccountID;
    private $bookOnStoreID;
    private $quantity;

    public function __construct(
        $cartID = null,
        $enduserAccountID,
        $bookOnStoreID,
        $quantity
    ) {
        $this->cartID = $cartID;
        $this->enduserAccountID = $enduserAccountID;
        $this->bookOnStoreID = $bookOnStoreID;
        $this->quantity = $quantity;
    }

    // Getter methods
    public function getCartID() {
        return $this->cartID;
    }

    public function getEnduserAccountID() {
        return $this->enduserAccountID;
    }

    public function getBookOnStoreID() {
        return $this->bookOnStoreID;
    }

    public function getQuantity() {
        return $this->quantity;
    }

    // Setter methods
    public function setCartID($cartID) {
        $this->cartID = $cartID;
    }

    public function setEnduserAccountID($enduserAccountID) {
        $this->enduserAccountID = $enduserAccountID;
    }

    public function setBookOnStoreID($bookOnStoreID) {
        $this->bookOnStoreID = $bookOnStoreID;
    }

    public function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    // toString method
    public function __toString() {
        return "Cart [cartID=" . $this->cartID .
               ", enduserAccountID=" . $this->enduserAccountID .
               ", bookOnStoreID=" . $this->bookOnStoreID .
               ", quantity=" . $this->quantity . "]";
    }
}
?>