<?php
class AdminProfileModel {
    private $adminProfileID;
    private $prfName;
    private $gender;
    private $dob;
    private $cccd;
    private $phoneNumber;
    private $email;
    private $avatarURL;
    private $prfAddress;
    private $salary;
    private $deletedAt;

    public function __construct(
        $adminProfileID,
        $prfName,
        $gender,
        $dob,
        $cccd,
        $phoneNumber,
        $email,
        $avatarURL,
        $prfAddress,
        $salary,
        $deletedAt = null
    ) {
        $this->adminProfileID = $adminProfileID;
        $this->prfName = $prfName;
        $this->gender = $gender;
        $this->dob = $dob;
        $this->cccd = $cccd;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->avatarURL = $avatarURL;
        $this->prfAddress = $prfAddress;
        $this->salary = $salary;
        $this->deletedAt = $deletedAt;
    }

    // Getters
    public function getAdminProfileID() { return $this->adminProfileID; }
    public function getPrfName() { return $this->prfName; }
    public function getGender() { return $this->gender; }
    public function getDob() { return $this->dob; }
    public function getCccd() { return $this->cccd; }
    public function getPhoneNumber() { return $this->phoneNumber; }
    public function getEmail() { return $this->email; }
    public function getAvatarURL() { return $this->avatarURL; }
    public function getPrfAddress() { return $this->prfAddress; }
    public function getSalary() { return $this->salary; }
    public function getDeletedAt() { return $this->deletedAt; }

    // Setters
    public function setPrfName($prfName) { $this->prfName = $prfName; }
    public function setGender($gender) { $this->gender = $gender; }
    public function setDob($dob) { $this->dob = $dob; }
    public function setCccd($cccd) { $this->cccd = $cccd; }
    public function setPhoneNumber($phoneNumber) { $this->phoneNumber = $phoneNumber; }
    public function setEmail($email) { $this->email = $email; }
    public function setAvatarURL($avatarURL) { $this->avatarURL = $avatarURL; }
    public function setPrfAddress($prfAddress) { $this->prfAddress = $prfAddress; }
    public function setSalary($salary) { $this->salary = $salary; }
    public function setDeletedAt($deletedAt) { $this->deletedAt = $deletedAt; }

    // toString method
    public function __toString() {
        return "AdminProfile { " .
            "ID: " . $this->adminProfileID . ", " .
            "Name: " . $this->prfName . ", " .
            "Gender: " . $this->gender . ", " .
            "DOB: " . $this->dob . ", " .
            "CCCD: " . $this->cccd . ", " .
            "Phone: " . $this->phoneNumber . ", " .
            "Email: " . $this->email . ", " .
            "Avatar: " . $this->avatarURL . ", " .
            "Address: " . $this->prfAddress . ", " .
            "Salary: " . $this->salary . ", " .
            "Deleted At: " . ($this->deletedAt ? $this->deletedAt->format('Y-m-d H:i:s') : 'null') .
            " }";
    }
}