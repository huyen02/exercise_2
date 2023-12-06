// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Arguments {

    string a;

    function noArgs(string calldata a) external returns (uint) {
        string memory test;
    }

    function testArg(string calldata b) public pure {
        
    }

    function oneArg(uint x) public view {

    }

    function twoArgs(uint x, uint y) public view {

    }

    function threeArgs(uint x, uint y, uint z) public view {

    }
}
