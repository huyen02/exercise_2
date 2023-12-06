// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CallData {
    string name;
    string name2;

    function incrementCounter1(string calldata x) external returns (string memory y) {
        // name = ""
        // x = "a"
        // string.concat(name, x)
        // KQ = "a"
        name = string.concat(name, x);

        return name;
    } 

    function incrementCounter2(string memory x) external returns (string memory y) {
        name2 = string.concat(name2, x);

        return name2;
    } 

    function getName() external view returns (string memory y) {
        return name;
    }

    function getName2() external view returns (string memory y) {
        return name2;
    }
}