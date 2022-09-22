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
// 없는 상태 -> nil

var myAge: Int = 0

/*
if myAge == nil {
    // 이건 에러 발생. 타입이 nil도 허용하도록 돼 있지 않기 때문
    // alert - 나이를 입력해주세요
}
*/

var yourAge: Int? = 0

if yourAge == nil {
    // alert - 나이를 입력해주세요
}

var myName: String? = ""

if myName == "" {
    // alert - 이름을 입력해주세요
}

if myName == nil {
    // 이름값이 없음
}

// 옵셔널은 그냥 사용할 수 없는 경우가 많음
var a: Int? = 10
var b: Int? = 20

// var c = a + b
// optional type은 반드시 unwrap 되어야 함

// unwrapped
// unwrapping

// Int? -> Int
// String? -> String
// 벗기지 않으면 더하기도 안되고... 방법

// 방법 1. coalesce
var c = (a ?? 0) + (b ?? 0)

// force unwrap -> 강제로, 무조건적으로
// 주의사항: 느낌표에 무조건 값이 있다는 전제 하에 바꾸는 것
// 값이 만일 없으면 crash남 (크리티컬)
// 값 있다는 확신 없으면 쓰면 안됨!
var d = a! + b!
