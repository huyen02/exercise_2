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
    function isRegisteredStudent(address studentAddress) private view returns (bool) {
    for (uint256 i = 0; i < students.length; i++) {
        if (students[i].walletAddress == studentAddress) {
            return true;
        }
    }

    for (uint256 i = 0; i < studentRegistrationRequests.length; i++) {
        if (studentRegistrationRequests[i].walletAddress == studentAddress) {
            return true;
        }
    }

    return false;
}

    function register(
        string memory _name,
        uint256 _age,
        string memory _idCard
    ) external {
    
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
    require(isRegisteredStudent(studentAddress), "Student not found");
    
    for (uint256 i = 0; i < studentRegistrationRequests.length; i++) {
        if (studentRegistrationRequests[i].walletAddress == studentAddress) {
            Student memory student = studentRegistrationRequests[i];
            return (student.walletAddress, student.name, student.age, student.idCard);
        }
    }

    revert("Student not found");
}
    function approveRequest(address studentAddress) external {
   
    require(msg.sender == admin, "Only admin can call this function");

    // Kiểm tra xem sinh viên đã đăng ký hay chưa
    require(isRegisteredStudent(studentAddress), "Student not found");

    // Duyệt yêu cầu đăng ký và chuyển sinh viên từ danh sách yêu cầu đăng ký sang danh sách sinh viên đã đăng ký
    for (uint256 i = 0; i < studentRegistrationRequests.length; i++) {
        if (studentRegistrationRequests[i].walletAddress == studentAddress) {
            students.push(studentRegistrationRequests[i]);
            // Xóa sinh viên khỏi danh sách yêu cầu đăng ký
            delete studentRegistrationRequests[i];
            break;
        }
    }
}

    function rejectRequest(address studentAddress) external {
   
    require(msg.sender == admin, "Only admin can call this function");
    
    require(isRegisteredStudent(studentAddress), "Student not found");

    for (uint256 i = 0; i < studentRegistrationRequests.length; i++) {
        if (studentRegistrationRequests[i].walletAddress == studentAddress) {
           
            delete studentRegistrationRequests[i];
            break;
        }
    }
}

    function remove(address studentAddress) external {

    require(msg.sender == admin, "Only admin can call this function");

  
    require(isRegisteredStudent(studentAddress), "Student not found");

    for (uint256 i = 0; i < students.length; i++) {
        if (students[i].walletAddress == studentAddress) {
           
            delete students[i];
            break;
        }
    }
}

    function cancel() external {
        require(isRegisteredStudent(msg.sender), "Only registered students can call this function");

        for (uint256 i = 0; i < students.length; i++) {
            if (students[i].walletAddress == msg.sender) {
            
                students[i] = students[students.length - 1];
                students.pop();
                break;
            }
        }
    }
}
