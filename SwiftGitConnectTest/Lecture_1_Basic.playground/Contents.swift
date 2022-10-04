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


// 5. Optionals

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

// 방법 2. force unwrap -> 강제로, 무조건적으로
// 주의사항: 느낌표에 무조건 값이 있다는 전제 하에 바꾸는 것
// 값이 만일 없으면 crash남 (크리티컬)
// 값 있다는 확신 없으면 쓰면 안됨!
var d = a! + b!

// 방법 3. if statements
if a != nil {
    print(a) // Optional(10) 출력
    print(a!) // 10 출력
}

// if let
// if var
if let hasNumber = a {
    // hasNumber = hasNumber * 2
    // 에러남. let에 재할당 불가하기 때문
    print(hasNumber) // 10 출력
}

// 스코프 범위는 이 if문 내에서만인 듯?
if var hasNumber = b {
    hasNumber = hasNumber * 2
    print(hasNumber)
}

var m: Int?

// 방법 4. guard let, guard var
func testFunc () {
    // 만일 m이 값이 없으면 함수를 그대로 return한다.
    guard let hasNumber3 = m else {
        return
    }
    print(hasNumber3)
    print("end")
}

testFunc()



// 6. Operators

// 기초 연산자
// Basic Operators

// + - * / %(reminder Operator)

let a6 = 20
let b6 = 30

let c6 = a6 / b6 // Int type으로 타입추론

// 따라서 나누기를 해야할 일이 있으면 Double로 해야 함
let d6: Double = 20
let e6: Double = 30
let f6 = d6 / e6

let g6: Double = 20
let h6: Int = 30
// let i6 = g6 / h6
// 같은 타입끼리 연산하는 게 아니라면 에러가 발생
let i6 = g6 / Double(h6)
// Swift 언어의 특징: 타입 엄격, 강타입, type safe

// String 이어붙이기
let aa = "hi"
let bb = "hello"
let cc = aa + bb // hihello

// %
// 홀수 짝수
if a6 % 2 == 0 {
    // a6 자리에 Double이 들어가 있으면 % 연산 불가
    print("짝수")
} else {
    print("홀수")
}

print(7)

var aaa = 2
aaa = aaa + 2
aaa += 2


// 비교 연산자
// Comparison Operators

a6 == b6 // false
a6 != b6 // true
a6 > b6 // true

aa > bb // true (String)
// Unicode 숫자를 통해 비교
"\u{62}" // "b"
"\u{1F497}" // "💗"

// uniocde 범위 ㅣ관련

// 숫자만 입력받을 수 있어야 한다.
// 키보드 제한만으로는 위험

let inputValue = "7"

// "\u{30}" == "0"
// "\u{39}" == "9"
// inputValue가 둘 사이의 값이면 숫자

if inputValue >= "\u{30}" && inputValue <= "\u{39}" {
    print("숫자")
} else {
    print("숫자가 아니다.")
}

// String

let myName2 = "lee min kim"

for character in myName2 {
    print(character)
}

let myLongStr =
"""
hi
hello
welcome
"""

print(myLongStr)

let isOn = false
isOn.description // false, true라는 글자가 출력됨

let myNumber = 123
myNumber.description // "123"
String(myNumber) // "123"

"my number is \(myNumber)" // "my number is 123"
"my number is \(myNumber)".last // "3"

"my number is \(myNumber)".dropLast() // "my number is 12"
"my number is \(myNumber)".dropFirst() // "y number is 123"

let myNumber2 = 12.33
String(myNumber2).split(separator: ".") // ["12", "33"]

// Collection Type: Array, Set, Dictionary
// Array, Dictionary 많이 씀

// Array
// Indexes(0, 1, 2...), Values

// var mynames = Array() // 'Element' could not be inferred
// Swift는 type safe 언어이므로 초기화(메모리에 올리기)하려면 타입을 표시해줘야 함
var myNames = Array<String>()
var myAges = [Int]()
// 둘 다 가능

myNames.append("kim")
myNames.append("lee")
myNames.append("jin")

myNames
myNames[0] // "kim"
// myNames[3] // App Crush
// index out of range이면 앱 크러쉬 나기 때문에 방어코드(안전한 코딩 스타일) 필요

let index = 3

if myNames.count > index {
    myNames[index] // 3이면 실행이 되지 않음
}

myNames.append(contentsOf: ["hi", "hello"])
myNames

myNames = myNames + ["kk"]

myNames.remove(at: 3)
myNames

myNames.removeFirst()
myNames

if myNames.isEmpty {
    // myNames.count == 0
}

myNames.insert("hahaha", at: 2)

for name in myNames {
    print(name + "님")
}

for (index, name) in myNames.enumerated() {
    print(index, name)
}


// Set

// 하나의 값을 넣으면 들어가는데 Array와 달리 index, 순서의 개념이 없음

var names = Set<String>()
names.insert("kim")
names.insert("min")
names.insert("lee")
names // 순서 보장 X
names.insert("lee")
names // 같은 값을 넣으면 값이 추가가 되지 않음

var sameNames = ["lee", "lee", "kim", "lee"]
Set(sameNames)
// 다른 것만 남게 됨. 비슷한 형태들끼린 타입 캐스팅이 가능

var names2: Set = ["lee", "kim", "Min"]
// array와 선언법은 똑같은데 :Set 이라고 표기해줘야 함

var numbers1: Set = [1, 2, 3, 4, 5]
var numbers2: Set = [4, 5, 6, 7, 8]

// 교집합
numbers1.intersection(numbers2)
// 합집합
numbers1.union(numbers2)
// 합집합 - 교집합 (대칭차지밥)
numbers1.symmetricDifference(numbers2)
// 여집합
numbers1.subtracting(numbers2)


// Dictionary

// key + value

var namesOfStreet = [ String : Any ]()

namesOfStreet["302ro"] = "1st Street"
namesOfStreet["303ro"] = "2nd Street"
namesOfStreet["304ro"] = 3

namesOfStreet // ["304ro": 3, "303ro": "2nd Street", "302ro": "1st Street"]

namesOfStreet["305ro"]
namesOfStreet["302ro"] = nil

namesOfStreet // ["304ro": 3, "303ro": "2nd Street"]

var namesOfStreet2 = ["a": 1, "b": 2, "c": 3]
namesOfStreet2

for dic in namesOfStreet {
    print(dic)
}


// Control flow (호름 제어)

let name = "32341234"

for char in name {
    print(Int(String(char))) // 그냥 char은 String.Element 타입이기 때문에 String 타입으로의 타입캐스팅 필요
    // 단 Optional Int라서 Optional(3)처럼 나옴
    print((Int(String(char)) ?? 0) * 10)
}

let numberOfLegs = ["ant": 6, "dog": 4]

for dic in numberOfLegs {
    print(dic)
}

for index in 0...5 {
    print(index) // 0 1 2 3 4 5
}

for index in 0..<5 {
    print(index) // 0 1 2 3 4
}

// 웬만하면 비추
// 무한루프 -> CPU 리소스 소진

let a1 = 0

while a1 != 0 {
    // code
    // a1 == 0인 동안 계속 실행
    // MAC은 1개의 스레드가 CPU 전체를 쓰지는 못하게끔 설계되어 있음에도 굉장히 느려짐
    // iPhone은 커버 불가
}


// Switch
// 조건에 케이스 만들어서 분기

let b1 = "c"

switch b1 {
case "a", "m":
    print("a or m")
case "b":
    print("b")
default:
    print("other")
}
