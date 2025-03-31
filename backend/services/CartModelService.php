<?php
class CartService {
    private $db;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
    }

    // Add item to cart
    public function addToCart($cartItem) {
        $stmt = $this->db->prepare("CALL sp_InsertCart(?, ?, ?)");
        $stmt->bindParam(1, $cartItem->getEnduserAccountID());
        $stmt->bindParam(2, $cartItem->getBookOnStoreID());
        $stmt->bindParam(3, $cartItem->getQuantity());
        return $stmt->execute();
    }

    // Update cart item quantity
    public function updateCartItem($cartItem) {
        $stmt = $this->db->prepare("CALL sp_UpdateCart(?, ?, ?, ?)");
        $stmt->bindParam(1, $cartItem->getCartID());
        $stmt->bindParam(2, $cartItem->getEnduserAccountID());
        $stmt->bindParam(3, $cartItem->getBookOnStoreID());
        $stmt->bindParam(4, $cartItem->getQuantity());
        return $stmt->execute();
    }

    // Remove item from cart
    public function removeFromCart($cartID) {
        $stmt = $this->db->prepare("CALL sp_DeleteCart(?)");
        $stmt->bindParam(1, $cartID);
        return $stmt->execute();
    }

    // Clear user's cart
    public function clearCart($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_ClearCart(?)");
        $stmt->bindParam(1, $enduserAccountID);
        return $stmt->execute();
    }

    // Get user's cart items
    public function getCartItems($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_GetCartByUserID(?)");
        $stmt->bindParam(1, $enduserAccountID);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Get cart item by ID
    public function getCartItem($cartID) {
        $stmt = $this->db->prepare("CALL sp_GetCartByID(?)");
        $stmt->bindParam(1, $cartID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Check if item already exists in cart
    public function itemExistsInCart($enduserAccountID, $bookOnStoreID) {
        $stmt = $this->db->prepare("CALL sp_CheckCartItemExists(?, ?)");
        $stmt->bindParam(1, $enduserAccountID);
        $stmt->bindParam(2, $bookOnStoreID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Get cart total price and items count
    public function getCartSummary($enduserAccountID) {
        $stmt = $this->db->prepare("CALL sp_GetCartSummary(?)");
        $stmt->bindParam(1, $enduserAccountID);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>