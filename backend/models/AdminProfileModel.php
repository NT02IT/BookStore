<?php
class AdminProfileModel {
    private $adminProfileID;
    private $prfName;
    private $gender;
    private $dob;
    private $CCCD;
    private $phoneNumber;
    private $email;
    private $avatarURL;
    private $prfAddress;
    private $salary;
    private $isDelete;

    public function __construct(
        $adminProfileID = null,
        $prfName,
        $gender = null,
        $dob = null,
        $CCCD,
        $phoneNumber,
        $email,
        $avatarURL = null,
        $prfAddress = null,
        $salary,
        $isDelete = false
    ) {
        $this->adminProfileID = $adminProfileID;
        $this->prfName = $prfName;
        $this->gender = $gender;
        $this->dob = $dob;
        $this->CCCD = $CCCD;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->avatarURL = $avatarURL;
        $this->prfAddress = $prfAddress;
        $this->salary = $salary;
        $this->isDelete = $isDelete;
    }

    // Getter methods
    public function getAdminProfileID() {
        return $this->adminProfileID;
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

    public function getCCCD() {
        return $this->CCCD;
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

    public function getSalary() {
        return $this->salary;
    }

    public function getIsDelete() {
        return $this->isDelete;
    }

    // Setter methods
    public function setAdminProfileID($adminProfileID) {
        $this->adminProfileID = $adminProfileID;
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

    public function setCCCD($CCCD) {
        $this->CCCD = $CCCD;
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

    public function setSalary($salary) {
        $this->salary = $salary;
    }

    public function setIsDelete($isDelete) {
        $this->isDelete = $isDelete;
    }

    // toString method
    public function __toString() {
        return "AdminProfile [adminProfileID=" . $this->adminProfileID .
               ", prfName=" . $this->prfName .
               ", gender=" . $this->gender .
               ", dob=" . $this->dob .
               ", CCCD=" . $this->CCCD .
               ", phoneNumber=" . $this->phoneNumber .
               ", email=" . $this->email .
               ", avatarURL=" . $this->avatarURL .
               ", prfAddress=" . $this->prfAddress .
               ", salary=" . $this->salary .
               ", isDelete=" . ($this->isDelete ? 'true' : 'false') . "]";
    }
}
?>