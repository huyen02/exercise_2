// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract StudentManagerV2 {
    struct Student {
        address walletAddress;
        string name;
        uint256 age;
        string idCard;
    }

    Student[] private students;
    Student[] private studentRegistrationRequests;
    address private admin;

    constructor(address _admin) {
        admin = _admin;
    }

    function register(
        string memory _name,
        uint256 _age,
        string memory _idCard
    ) external {
        // Kiem tra xem student nay có đang nằm trong students hoặc studentRegistrationRequests không?
        require(
            studentRegistrationRequests[msg.sender].studentID == 0,
            "Student already registered"
        );
        Student memory student = Student(msg.sender, _name, _age, _idCard);
        studentRegistrationRequests.push(student);
    }

    function listRegistrationRequests()
        external
        view
        returns (Student[] memory)
    {
        // Validate chỉ admin mới được call hàm này
        require(msg.sender == admin, "Only admin can call this function");
        return studentRegistrationRequests;
    }

    function getDetailRegistrationRequest(address studentAddress) external view returns (address walletAddress, string memory name, uint256 age, string memory idCard) {

        return(
            studentRegistrationRequests[studentAddress].name,
            studentRegistrationRequests[studentAddress].walletAddress,
            studentRegistrationRequests[studentAddress].idCard,
            studentRegistrationRequests[studentAddress].age,
        );
    }

    function approveRequest(address studentAddress) external {
        require(msg.sender == admin, "Only admin can approve requests");
        return studentRegistrationRequests;
    }

    function rejectRequest(address studentAddress) external {
        require(msg.sender == admin, "Only admin can reject requests");
        return studentRegistrationRequests;
    }

    function remove(address studentAddress) external {
        require(msg.sender == admin, "Only admin can remove students");
        delete studentRegistrationRequests;
    }

    function cancel() external {
        require(
            studentRegistrationRequests[msg.sender].studentID != 0,
            "Student not registered"
        );
        delete studentRegistrationRequests[msg.sender];
    }
}
