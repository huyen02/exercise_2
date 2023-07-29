// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract StudentManagerV2 {

    struct Student {
        address walletAddress;
        string name;
        uint age;
        string idCard;
    }

    Student[] private students;
    Student[] private studentRegistrationRequests;
    address private admin;


    constructor(address _admin) {
        admin = _admin;
    }     

    function register(string memory _name, uint _age, string memory _idCard) external {
        // Kiem tra xem student nay có đang nằm trong students hoặc studentRegistrationRequests không?
        Student memory student = Student(msg.sender, _name, _age, _idCard);
        studentRegistrationRequests.push(student);
    }

    function listRegistrationRequests() external view returns(Student[] memory) {
        // Validate chỉ admin mới được call hàm này
        require(msg.sender == admin, 'Only admin can call this function');
        return studentRegistrationRequests;
    }
}
