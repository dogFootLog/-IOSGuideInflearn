import UIKit

// 1. 변수와 상수

var str = "Hello, playground"

var age = 10

age = 20
age = 30
age = 55

str = "hi"
// 변수는 값 변경 가능
// 프로그램은 순차적으로 실행

// Swift 언어 특징
// Safe type 타입 안전한, 강타입, 타입이 엄격
// 변수명에 커서 올리고 esc 누르면 타입 확인 가능

// age = "hi"
// str = 111
// Int 타입에 string 할당 불가

let guestName = "john"

// guestName = "kim"
// let은 초기값이 절대 변하지 않는다.


// 2. Type Annotations

var str2: String = "Hello"
var screenHeight: Float = 560

// var sum = age + screenHeight
// Int + Float이기 때문에 에러 발생
var sum = age + Int(screenHeight)


// 3. Bool

var isOpen = false

if !isOpen {
    
} else {
    
}


// 4. Tuples (n짝, n쌍)

var topTitle = ("메인화면", "mainIcon.png")
// 타입: (String, String)

topTitle.0
topTitle.1

topTitle = ("보조화면", "subIcon.png")

// http status code (dictionary 형태)
var httpError = (statusCode: 404, description: "not found")

httpError.statusCode
httpError.description


// 5. Optionals_1

// 개념: 값이 있을 수도 있고, 없을 수도 있다.
