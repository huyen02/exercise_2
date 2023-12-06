// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract VariableHasValue {

    uint public accountBalance = 1000;// Cau a
    
    bool public isActivated = true;// Cau b 

    address public userAddress; //Cau c

    constructor (address _myAddress) {
        userAddress = _myAddress;
    }
    string public message = "Welcome to our restaurant!"; //Cau d

    bytes public data; //Cau Đ                        
}

contract DeterminedVariable {

    struct Person {
        string name;
        uint age;
    }                    //Cau a
    Person public alice; //The hien cua person co ten alice voi ten, tuoi cua ban
    function setPerson() public {
        alice.name = "Huyen";
        alice.age = 19;
    }
    function getPerson() public view returns (string memory, uint) {
        return (alice.name, alice.age);
    }
    enum Color{Red, Black, While} //Cau c

    Person[] public peopleList;//cau d

    function addPerson(string memory _name, uint _age) public {
        Person memory newPerson = Person(_name, _age);
        peopleList.push(newPerson);
    }
    function getPersonName(uint256 index) public view returns (string memory) {
        require(index < peopleList.length, "Error index");
        Person memory person = peopleList[index];
        return (person.name);
    }
 }

    
    



                                        



