// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ReturnValue {
    string name;
    uint x;

    function withTwoReturningArgs(uint value1, uint value2) public pure returns (uint z, uint t) {
        return (value1, value2);
    }

    function withTwoReturningArgsChangePos(uint value1, uint value2) public pure returns (uint z, uint t) {
        return (value2, value1);
    }

    function withTwoReturningArgsWithoutName(uint value1, uint value2) public pure returns (uint, uint) {
        return (value2, value1);
    }

    function returnName() public view returns (string memory, uint) {
        return (name, 2);
    }

    function returnContractAddress() public view returns (address) {
        return address(this);
    }
}