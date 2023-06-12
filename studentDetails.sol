// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Student {
    string public fname;
    string public lname;
    string public regNo;
    string public course;
    uint32 public cohort;

    struct Grades {
        uint256 maths;
        uint256 english;
        uint256 kiswahili;
        uint256 computer;
    }

    Grades public grades;

    constructor(
        string memory _fname,
        string memory _lname,
        string memory _course,
        string memory _regNo,
        uint32 _cohort,
        uint256 _maths,
        uint256 _english,
        uint256 _kiswahi,
        uint256 _computer
    ) {
        fname = _fname;
        lname = _lname;
        course = _course;
        regNo = _regNo;
        cohort = _cohort;
        grades.maths = _maths; // Corrected assignment operator from `-` to `=`
        grades.english = _english;
        grades.kiswahili = _kiswahi;
        grades.computer = _computer;
    }

    function setDetails(
        string memory _fname,
        string memory _lname,
        string memory _course,
        string memory _regNo,
        uint32 _cohort,
        uint256 _maths,
        uint256 _english,
        uint256 _kiswahi,
        uint256 _computer
    ) public {
        fname = _fname;
        lname = _lname;
        course = _course;
        regNo = _regNo;
        cohort = _cohort;
        grades.maths = _maths;
        grades.english = _english;
        grades.kiswahili = _kiswahi;
        grades.computer = _computer;
    }

    function marks() public view returns (string memory) {
        uint256 mark = (grades.maths + grades.english + grades.kiswahili + grades.computer) / 4;

        if (mark <= 30) {
            return string(abi.encodePacked(mark, " F"));
        } else if (mark > 30 && mark < 40) {
            return string(abi.encodePacked(mark, " E"));
        } else if (mark >= 40 && mark < 50) {
            return string(abi.encodePacked(mark, " D"));
        } else if (mark >= 50 && mark < 60) {
            return string(abi.encodePacked(mark, " C"));
        } else if (mark >= 60 && mark < 70) {
            return string(abi.encodePacked(mark, " B"));
        } else if (mark >= 70) {
            return string(abi.encodePacked(mark, " A"));
        } else {
            return "Invalid";
        }
    }

    function getDetails() public view returns (string memory, string memory, string memory) {
        return (fname, lname, marks());
    }
}
