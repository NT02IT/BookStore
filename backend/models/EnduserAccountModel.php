<?php
class EnduserAccountModel {
    private $enduserAccountID;
    private $prfName;
    private $gender;
    private $dob;
    private $phoneNumber;
    private $email;
    private $avatarURL;
    private $defaultAddress;
    private $password;
    private $createdAt;
    private $deletedAt;

    public function __construct(
        $enduserAccountID,
        $prfName,
        $gender,
        $dob,
        $phoneNumber,
        $email,
        $avatarURL,
        $defaultAddress,
        $password,
        $createdAt,
        $deletedAt = null
    ) {
        $this->enduserAccountID = $enduserAccountID;
        $this->prfName = $prfName;
        $this->gender = $gender;
        $this->dob = $dob;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->avatarURL = $avatarURL;
        $this->defaultAddress = $defaultAddress;
        $this->password = $password;
        $this->createdAt = $createdAt;
        $this->deletedAt = $deletedAt;
    }

    // Getters
    public function getEnduserAccountID() { return $this->enduserAccountID; }
    public function getPrfName() { return $this->prfName; }
    public function getGender() { return $this->gender; }
    public function getDob() { return $this->dob; }
    public function getPhoneNumber() { return $this->phoneNumber; }
    public function getEmail() { return $this->email; }
    public function getAvatarURL() { return $this->avatarURL; }
    public function getDefaultAddress() { return $this->defaultAddress; }
    public function getPassword() { return $this->password; }
    public function getCreatedAt() { return $this->createdAt; }
    public function getDeletedAt() { return $this->deletedAt; }

    // Setters
    public function setPrfName($prfName) { $this->prfName = $prfName; }
    public function setGender($gender) { $this->gender = $gender; }
    public function setDob($dob) { $this->dob = $dob; }
    public function setPhoneNumber($phoneNumber) { $this->phoneNumber = $phoneNumber; }
    public function setEmail($email) { $this->email = $email; }
    public function setAvatarURL($avatarURL) { $this->avatarURL = $avatarURL; }
    public function setDefaultAddress($defaultAddress) { $this->defaultAddress = $defaultAddress; }
    public function setPassword($password) { $this->password = $password; }
    public function setCreatedAt($createdAt) { $this->createdAt = $createdAt; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // toString method
    public function __toString() {
        return "EnduserAccount { " .
            "ID: " . $this->enduserAccountID . ", " .
            "Name: " . $this->prfName . ", " .
            "Gender: " . $this->gender . ", " .
            "DOB: " . $this->dob . ", " .
            "Phone: " . $this->phoneNumber . ", " .
            "Email: " . $this->email . ", " .
            "Avatar: " . $this->avatarURL . ", " .
            "Default Address: " . $this->defaultAddress . ", " .
            "Created At: " . $this->createdAt->format('Y-m-d H:i:s') . ", " .
            "Deleted At: " . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
            " }";
    }
}