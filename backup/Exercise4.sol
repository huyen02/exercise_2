// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract ExerciseFunction {
    function getAddress() public view returns (address){
        return address(this);
    }
    function assessLearningOutcomes(uint8 toan, uint8 van, uint8 anh) public pure returns (uint8, string memory){
        //Đổi điểm
        toan = toan * 10;
        van = van * 10;
        anh = anh * 10;
        //Tính điểm trung bình
        uint8 mediumScore = (toan * 2 + van * 2 + anh) / 5;
        //Đánh giá học lực
        string memory xepLoai;
        if(mediumScore >= 80) {
            xepLoai = "HSG";
        }else if(mediumScore >= 60){
            xepLoai = "HSK";
        }else if(mediumScore >= 40){
            xepLoai = "HSTB";
        }else{
            xepLoai = "Luu Ban";
        }
        return(mediumScore, xepLoai);
    }
}
contract MyContract {
    uint private x;
    function returnFunction() public view returns (uint){
        return x;
    }
}
contract Donate {
    function receiveMoney() public payable returns (string memory) {
        if(msg.value > 10000 wei){
            return "Rat cam on ban";
        }else{
            return "Cam on ban";
        }

    } 
}





















































































































































