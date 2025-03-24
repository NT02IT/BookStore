<?php
class EnduserProfileModel {
    private $enduserProfileID;
    private $prfName;
    private $gender;
    private $dob;
    private $phoneNumber;
    private $email;
    private $avatarURL;
    private $prfAddress;
    private $isDelete;

    public function __construct(
        $enduserProfileID = null,
        $prfName,
        $gender = null,
        $dob = null,
        $phoneNumber,
        $email = null,
        $avatarURL = null,
        $prfAddress = null,
        $isDelete = false
    ) {
        $this->enduserProfileID = $enduserProfileID;
        $this->prfName = $prfName;
        $this->gender = $gender;
        $this->dob = $dob;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->avatarURL = $avatarURL;
        $this->prfAddress = $prfAddress;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getEnduserProfileID() {
        return $this->enduserProfileID;
    }

    public function getPrfName() {
        return $this->prfName;
    }

    public function getGender() {
        return $this->gender;
    }

    public function getDob() {
        return $this->dob;
    }

    public function getPhoneNumber() {
        return $this->phoneNumber;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getAvatarURL() {
        return $this->avatarURL;
    }

    public function getPrfAddress() {
        return $this->prfAddress;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setEnduserProfileID($enduserProfileID) {
        $this->enduserProfileID = $enduserProfileID;
    }

    public function setPrfName($prfName) {
        $this->prfName = $prfName;
    }

    public function setGender($gender) {
        $this->gender = $gender;
    }

    public function setDob($dob) {
        $this->dob = $dob;
    }

    public function setPhoneNumber($phoneNumber) {
        $this->phoneNumber = $phoneNumber;
    }

    public function setEmail($email) {
        $this->email = $email;
    }

    public function setAvatarURL($avatarURL) {
        $this->avatarURL = $avatarURL;
    }

    public function setPrfAddress($prfAddress) {
        $this->prfAddress = $prfAddress;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "EnduserProfile [enduserProfileID=" . $this->enduserProfileID .
               ", prfName=" . $this->prfName .
               ", gender=" . $this->gender .
               ", dob=" . $this->dob .
               ", phoneNumber=" . $this->phoneNumber .
               ", email=" . $this->email .
               ", avatarURL=" . $this->avatarURL .
               ", prfAddress=" . $this->prfAddress .
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>