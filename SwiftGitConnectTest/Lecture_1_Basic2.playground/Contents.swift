import UIKit

// Function (함수)

// 계산기 만들기-> Class
// + 기능 -> Function

let a = 10
let b = 20

func plus(num1: Int, num2: Int) -> Int {
    print("sum = ", num1 + num2)
    return num1 + num2
}

plus(num1: a, num2: b)

var c = 0

func plusC(num1: Int, num2: Int) {
    c = num1 + num2
}

c // 0
plusC(num1: a, num2: b)
c // 30

func plus2(num1: Int, num2: Int) -> (String, Int) {
    return ("결과값은", num1 + num2)
}

let p = plus2(num1: a, num2: b)
p

func plus3(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

func minus(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
}

func multiply(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

let p2 = plus3(a, b)
p2

// View, Present, Display

var inputButtonType = "*"

if inputButtonType == "+" {
    print("연산 결과", plus3(a, b))
} else if inputButtonType == "-" {
    print("연산 결과", minus(a, b))
} else if inputButtonType == "*" {
    print("연산 결과", multiply(a, b))
}

func displayCalc(result: (Int, Int) -> Int) {
    print("연산 결과", result(a, b))
}

if inputButtonType == "+" {
    displayCalc(result: plus3)
} else if inputButtonType == "-" {
    displayCalc(result: minus)
} else if inputButtonType == "*" {
    displayCalc(result: multiply)
}
