// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Modifier {
    uint x;
    
    function incrementAndGetX() public pure returns (uint y) {
        // x = x + 1;
        // return x;
    }

    // function incrementAndGetX2() public view returns (uint y) {
    //     x = x + 1;
    //     return x;
    // }

    function getX() public view returns (uint) {
        return x;
    }

    function setX(uint newValue) public {
        x = newValue;
    }

    function receiveWithoutPayable() public {

    }

    function receiveEther() public payable {

    }

    fallback() external payable {
        x = x - 1;
    }

    receive() external payable { 
        x = x + 1;
    }
}