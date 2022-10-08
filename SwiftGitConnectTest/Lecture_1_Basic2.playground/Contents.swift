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


// Closure (클로저)

// func - 유사

// 차이: function은 이름이 있고 closure는 없음

func myScore(a: Int) -> String {
    return "\(a)점"
}
let score = myScore(a: 40)
score

// closure
let myScore2 = { (a: Int) -> String in
    return "\(a)점"
}

myScore2 // (Int) -> String
myScore2(50) // 50점

let myScore3 = {(a: Int) in // return type도 생략 가능
    "\(a)점" // 딱 1줄일 때 return 생략 가능
}
myScore3(20)

let myScore4: (Int) -> String = { a in
    "\(a)점"
}
myScore4(20)

let myScore5: (Int, Int) -> String = { (a, b) in
    "\(a + b)점"
}
myScore5(50, 20)

let myScore6: (Int) -> String = {
    "\($0)점"
}
myScore6(30)

let myScore7: (Int, Int, Int) -> String = {
    "\($0 + $1 + $2)점"
}
myScore7(30, 20, 10)


// Closure 실전

// 조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다.

var names = ["apple", "air", "brown", "red", "orage", "blue", "candy"]

func someFind(find: String) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if name.contains(find) {
            newNames.append(name)
        }
    }
    return newNames
}

someFind(find: "a")

// 조건 -> 찾는다 -> 입력한 글자로 시작하는 첫글자를 찾는다.

func startFind(find: String) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if name.starts(with: find) {
            newNames.append(name)
        }
    }
    return newNames
}

startFind(find: "a")

// 이렇게 분류하지 말고 클로저 활용

let containSomeText: (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    return false
}

let isStartSomeText: (String, String) -> Bool = { name, find in
    if name.first?.description == find {
        return true
    }
    return false
}

func find(findString: String, condition: (String, String) -> Bool) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if condition(name, findString) {
            newNames.append(name)
        }
    }
    return newNames
}

find(findString: "a", condition: containSomeText)
find(findString: "a", condition: isStartSomeText)


// sort
let sorted = names.sorted() // sort()는 리턴이 없이 그냥 자체가 정렬이 됨
// 원본이 바뀌는 sort(), 안 바뀌고 새로 리턴하는 sorted()

// 셋이 동일
names.sort(by: {(lhs, rhs) -> Bool in
           return lhs > rhs}
)
names.sort(by: { $0 < $1 })
names.sort() { $0 < $1 }
names.sort{$0 < $1}
names.sort(by: <)



// Enumeratins

// enum
// 타입 분류

// 도서관 -> 항목 -> 소설, 문제집, 패션, 만화책 ...

// 분류만 하고 싶다 + 값
enum BookType {
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
    // ....
}

var bookStyle: BookType?

var books = [BookType]()

func saveBook(book: BookType) {
    switch book {
    case .fiction:
        print("fiction")
    case .comics:
        print("comics")
    default:
        print("book")
    }
    
    books.append(book)
}

saveBook(book: .comics(title: "aaa", price: 5000, year: 2020))

func loadBook(book: BookType){
    
    for book in books {
        
        // if문
        if case let BookType.comics(title, _, _) = book {
            print("comics", title)
        }
        
        // switch문
        switch book {
        case let .comics(_, price, _):
            print(price)
        case let .fiction(_, price, _):
            print(price)
        default: break
        }
        
    }
}

// enum 기능 확장

extension BookType {
    var typeName: String {
        switch self {
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        default:
            return "book"
        }
    }
}

for book in books {
    if case let BookType.comics(title, _, _) = book {
        print("comics", title, book.typeName)
    }
}


// Class

class MyInfo {
    
    init(gender: GenderType) {
        self.genderType = gender
    }
    
    // 이 enum은 밖에다 만들어도 되긴 함
    enum GenderType {
        case male
        case female
    }
    
    // 내부에서만 쓰고 밖에선 입력 못하게 함 --> 재설정 불가
    private var genderType: GenderType
    
    // 초기값 따로 설정 안해줄거면 init()에서 설정해줘야 함
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

var myInfo = MyInfo(gender: .female)
// myInfo.genderType = .male // private이면 재설정 불가

myInfo.age = 20

// 참조에 의한 복사
var myInfo2 = myInfo
myInfo2.age = 30

var myInfo3 = myInfo
myInfo3.age = 100

myInfo.age
myInfo2.age
myInfo3.age
// 전부 200


// Class - Inheritance
// 상속

/*
class Soccer {
    var homeScore = 0
    var awayScore = 0
    func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
}

class Baseball {
    var homeScore = 0
    var awayScore = 0
    func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
}

let soccer = Soccer()
let baseball = Baseball()

soccer.presentScore()
baseball.presentScore()
*/

class GameInfo {
    var homeScore = 0
    var awayScore = 0
    func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
    final func finalScore() -> String {
        return "fianl은 수정 불가"
    }
}

// 공통은 상속, 개별은 따로 추가

class Soccer: GameInfo {
    var time = 0
}
class Baseball: GameInfo {
    var round = 0
}
class Football: GameInfo {
    override func presentScore() -> String {
        return homeScore.description + " 대 " +  awayScore.description
    }
    // finalScore은 override 불가
}

let soccer = Soccer()
soccer.awayScore = 1
soccer.homeScore = 2
soccer.presentScore()

let baseball = Baseball()
baseball.homeScore = 30
baseball.awayScore = 20
baseball.presentScore()

let football = Football()
football.homeScore = 15
football.awayScore = 10
football.presentScore()


// Properties
// 프로퍼티

class YourInfo {
    
    // stored property (저장
    var name = ""
    var age = 0
    
    // lazy stored property
    // 처음부터 호출하면서 메모리에 띄울 필요는 없으므로 천천히 로드함
    lazy var yourProfiles = [UIImage(named: "a"), UIImage(named: "b"), UIImage(named: "c"), UIImage(named: "d")]
    
    // computed property (외부에서 값 넣기 불가)
    var isAdult: Bool {
        // 엄밀하게는 get{} 안에 아래 내용이 들어가 있는 것
        // set{}은 생략 불가
        if age > 19 {
            return true
        }
        return false
    }
    
    // email -> 보안 -> 암호화된 값으로 사용 (항상)
    var _email = "" // 값을 받기 위한 임시 변수. 이름 노상관
    var email: String {
        get{
           return _email
        }
        set{
            _email = newValue.hash.description
        }
    }
    
}

let yourInfo = YourInfo()

yourInfo.age = 10
yourInfo.name = "kim"
// 이때까지 lazy var는 메모리에 올라가지 않음
// 이렇게 사용할 때 비로소 올라가게 됨
yourInfo.yourProfiles

// yourInfo.isAdult = true
// Cannot assign to property

yourInfo.email = "abc@test.com"
yourInfo.email
