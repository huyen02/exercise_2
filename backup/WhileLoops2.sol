// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract WhileLoops {
    
    // Nhập vào 1 số nguyên dương, tính tổng các chữ số trong số đó
    // 123456 => 6 + 5 + 4 + 3 + 2 + 1 =  
    // 346984 => 4 + 8 + 9 + 6 + 4 + 3 = 
    // 12 
    // Bước thực hiện: 
    // Khởi tạo giá trị tổng = 0
    // chia lấy phần dư số đó cho 10 để lấy được chữ số cuối cùng
    // Cộng chữ số cuối cùng vào tổng
    // Chia lấy phần nguyên cho 10 để dịch sang chữ số tiếp theo
    // Lặp lại các bước cho đến khi số đó = 0 => Chừng nào số đó còn != 0 thì thực hiện tiếp
    // 12 % 10 = 2
    // 12 / 10 = 1
    // 1 % 10 = 1
    // 1 / 10 = 0
    // 0 % 10 = 0
    // 0 / 10 = 0
    function sumOfDigits(uint number) public pure returns (uint, uint) {
        uint sum = 0;
        uint count = 0;

        while (number != 0) {
            uint digit = number % 10;
            sum = sum + digit;
            count = count + 1;
            number = number / 10;
        }

        return (sum, count);
    }

    function sumOfDigits2(uint number) public pure returns (uint, uint) {
        uint sum = 0;
        uint count = 0;

        do {
            uint digit = number % 10;
            sum = sum + digit;
            count = count + 1;
            number = number / 10;
        } while (number != 0);

        return (sum, count);
    }

    // Tìm chữ số chẵn đầu tiên từ phía cuối trong số nguyên nhập vào 
    // 74776777 => 6
    // 45723 => 2
    // 77777777777 => -1
    // Bước thực hiện: 
    // chia lấy phần dư số đó cho 10 để lấy được chữ số cuối cùng
    // Kiểm tra xem số đó có phải số chẵn hay ko?
    // Nếu có => dừng lại và trả kết quả
    // Nếu ko => tiếp tục
    // Chia lấy phần nguyên cho 10 để dịch sang chữ số tiếp theo
    // Lặp lại các bước cho đến khi số đó = 0 => Chừng nào số đó còn != 0 thì thực hiện tiếp
    function firstEvenDigit(int number) public pure returns (int) {
        int digit = -1;

        while (number != 0) {
            int newDigit = number % 10;

            if (newDigit % 2 == 0) {
                digit = newDigit;
                break;
            }

            number = number / 10;
        }

        return digit;
    }

    // Tổng các chữ số chẵn trong số nguyên dương đã nhập
    // 123456 = 2 + 4 + 6 = 12
    // 148 = 4 + 8 = 12
    // Bước thực hiện:
    // Đặt tổng = 0
    // chia lấy phần dư số đó cho 10 để lấy được chữ số cuối cùng
    // Kiểm tra xem số đó có phải số chẵn hay ko? 
    // Nếu sai => Chia lấy phần nguyên cho 10 để dịch sang chữ số tiếp theo và tiếp tục
    // Nếu có => cộng vào tổng, Chia lấy phần nguyên cho 10 
    // Lặp lại các bước cho đến khi số đó = 0 => Chừng nào số đó còn != 0 thì thực hiện tiếp
    function sumOfEvenDigits2(uint number) public pure returns (uint) {
        uint sum = 0;

        while(number != 0) {
            uint digit = number % 10;

            if (digit % 2 != 0) {
                number = number / 10;
                continue;
            }

            sum += digit;
            number = number / 10;
        }

        return (sum);
    }
}
