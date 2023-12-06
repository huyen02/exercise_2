// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
//Bai 1: Mang dong
contract DynamicArray {
    uint[] public dynamicArray;
   function addToDynamicArray(uint _value) public {
    dynamicArray.push(_value);
   }
   function getDynamicArrayLength() public view returns (uint) {
    return dynamicArray.length;
   }
}
//Bai 2: Mang tinh
contract StaticArray {
    uint[5] public staticArray;
    constructor() {
        staticArray = [1, 2, 3, 4, 5];
    }
    function getFixedArrayElement(uint _index) public view returns (uint) {
        require(_index >= 0 && _index < staticArray.length, "Error index");
        return staticArray[_index];
    }
}
// Bai 3 : Mang bytes
contract BytesArray {
    bytes public byteArray;
    function setByteArray(bytes memory _data) public {
        byteArray = _data;
    }
    function getByteArrayLength() public view returns (uint) {
        return byteArray.length;
    }
}
// Bai 4: Thao tác với chuỗi
contract StringManipulation {
    string public stringManipulation;
    function setString(string memory _value) public {
        stringManipulation = _value;
    }
    function getStringLength() public view returns (uint) {
        

    }
}
