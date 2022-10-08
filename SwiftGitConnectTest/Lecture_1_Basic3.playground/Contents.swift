import UIKit
import Foundation


// Initializer
// 생성자

// init

class MyInfo {
    var name: String
    var myId: String
    
    var age = 0
    var isAdult: Bool
    
    // designated initializer
    init(name: String, id: String) {
        self.name = name
        self.myId = id
        self.isAdult = (age > 19) ? true : false
    }
    
/* 파라미터를 받지 않는 init
    init() {
        self.myId = ""
        self.name = ""
        self.isAdult = (age > 19) ? true : false
    }
*/
    
/* id만 파라미터로 받는 init
    init(id: String) {
        self.myId = id
        self.name = ""
        self.isAdult = (age > 19) ? true : false
    }
*/
    
    // convenience initializer // 필수 조건 - 다른 init을 반드시 실행해야 함
    convenience init() {
        self.init(name: "", id: "")
    }
    convenience init(id: String) {
        self.init(name: "", id: id)
    }
    
}

var myInfo1 = MyInfo(name: "kim", id: "abcd")
var myInfo0 = MyInfo.init(name: "kim", id: "abcd")
// 둘은 동일하고 .init을 생략한 셈
myInfo1.myId
myInfo0.name

var myInfo2 = MyInfo()
myInfo2.name

var myInfo3 = MyInfo(id: "123")
myInfo3.myId


// Deinitialization
// 해제

var a: Int? = 10
a = nil
// 사용하지 않는다면 메모리에서 해제

class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init() {
        print("game init")
    }
    
    deinit {
        print("game deinit")
    }
}

// Round는 game이 없으면 의미가 없음
class Round {
    // var name = ""
    weak var gameInfo: Game?
    // 내가 참조하는 Game이 해지되면 나도 같이 없어지겠다.
    // weak 넣으면 상호참조 해놔도 deinit이 잘됨
    
    // weak var lastRound = Game()
    // 이렇게 바로 생성한 걸 weak으로 참조하면 nil 참조와 똑같음
    
    var lastRound = 10
    var roundTime = 20
    
    deinit {
        print("round deinit")
    }
}

var game : Game? = Game()

var newGame: Game? = game

game = nil
newGame = nil
// 둘 다 nil 해줘야 비로소 deinit됨

var game2: Game? = Game()
var round: Round? = Round()

game2?.round = round
round?.gameInfo = game2

game2 = nil
round = nil
// 상호참조를 걸면 deinit이 되지 않음
// game2, round 변수 자체는 남아있지만 메모리에는 남아있는 것
// 티가 안 난다. 그래도 분명히 메모리 해제 시킬거면 제대로 시켜야 함



// Structure
// 구조체

// value type
struct SomeStruct {
    var name = ""
    func someFunc() {
        
    }
}

class SomeInfo {
    var myAge = 0
}

var info1 = SomeInfo()
var info2 = info1
var info3 = info2

info1.myAge = 20
info1.myAge
info2.myAge
info3.myAge
// class는 원본은 1개고 전부 참조에 의한 복사

struct ImageType {
    var type = ""
}

// 참조가 아니라 값을 복제
var imageType1 = ImageType()
var imageType2 = imageType1
var imageType3 = imageType2

imageType1.type = "jpg"
imageType2.type = "png"

imageType1.type
imageType2.type
imageType3.type

// struct는 상속도 되지 않음!


// Extension
// 기능 확장
// struct, class, enum, protocol

// 숫자(Int) 짝수, 홀수
extension Int {
    var odOrEven: String {
        if self % 2 == 0 {
            return "짝수"
        }
        return "홀수"
    }
}

3.odOrEven // 홀수
4.odOrEven // 짝수

// UIColor
// mainColor2 = xxx
// subColor2 = xxx
extension UIColor {
    // class 타입으로 변수 만들어주면 인스턴스화가 필요 없어짐
    // class 대신 static 써도 가능
    class var mainColor1: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
}

var button = UIButton()

/*
button.titleLabel?.textColor = UIColor().mainColor1

// 그런데 orange는 ()가 필요 없음 --> UIColor의 인스턴스화가 필요 없다.
button.titleLabel?.textColor = UIColor.orange
button.titleLabel?.textColor = .orange
// UIColor 생략도 가능
*/

button.titleLabel?.textColor = UIColor.mainColor1
button.titleLabel?.textColor = .mainColor1



// Protocol
// 규격, 규약, 규칙, 청사진, 뼈대

protocol UserInfo {
    var name: String { get set }
    // set이 없으면 set이 있을 수도 없을 수도
    var age: Int { get }
    // 구체적인 값을 선언해서는 안됨
    func isAdult() -> Bool
}

// 그런데 isAdult는 다 똑같으니깐 Class로 만들어서 상속을 하거나
// 혹은 extension으로!!
extension UserInfo {
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

protocol UserScore {
    var score: Int { get set }
}

protocol UserDetailInfo: UserInfo, UserScore {
    // 프로토콜 합성도 가능
}

// 여러 프로토콜 상속도 가능
class Guest: UserInfo, UserScore {
    var name = "kim"
    let age = 20
    // age에서 set을 지우면 let으로 해도 괜찮음
    var score = 30
}
class Member: UserInfo {
    var name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
class VIPMember: UserInfo {    
    var name = "lee"
    var age = 30
}

class UserInfoPresenter {
    func present() {
        
        let guest = Guest()
        let member = Member(name: "jane", age: 25)
        // member.age = 100 // let이니깐 재할당 불가
        let vip = VIPMember()
        
        // let members = [guest, member, vip] as [Any]
        // 타입이 다 달라서 에러 발생
        
        let members: [UserInfo] = [guest, member, vip]
        // 이렇게 protocol로도 하나의 array로 묶는 게 가능
        
        // print(guest.name)
        // print(member.name)
        // print(vip.name)
        
        for element in members {
            print(element.age)
        }
        
    }
}

let presenter = UserInfoPresenter()
presenter.present()


// Inheritance
// 상속 - Class에서만 가능

// enum, structure, protocol에서는 불가

// protocol

class NewInfo {
    var name = "super"
    var age = 0
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

class Guest1: NewInfo {
    // 슈퍼클래스에서 구현을 일부 하므로 아무것도 추가구현하지 않아도 되긴 함
    override func isAdult() -> Bool {
        return true
    }
    
    func present() {
        name = "kim"
        print(name)
        print(super.name) // 둘 다 kim이 나옴. override 없으면 super걸 그대로 사용
        print(isAdult())
        print(super.isAdult()) // 오버라이드된 건 super class와 별도
    }
}

let guest1 = Guest1()
guest1.present()



// Generic <Type 내가 정한 임의의 타입>
// 로직 반복, 타입 여러가지

// stack
struct IntStack {
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
        // structure 내부에서는 변경할 때 mutating 키워드 필수
    }
    
    mutating func pop() -> Int? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
}

var myStack = IntStack()

myStack.push(item: 4)
myStack.push(item: 5)
myStack.push(item: 6)

myStack.pop()
myStack.pop()
myStack.pop()
myStack.pop()
myStack

// 이걸 Int만이 아니라 다양한 타입으로 쓰고 싶다면!

// structure NewStack<MyType> where MyType: Equatable
// dictionary 타입은 안됨
// 이런 식으로 where MyType: 식으로 씀.
struct NewStack<MyType> {
    
    var items = [MyType]()
    
    mutating func push(item: MyType) {
        items.append(item)
        // structure 내부에서는 변경할 때 mutating 키워드 필수
    }
    
    mutating func pop() -> MyType? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
}

var myStack2 = NewStack<String>()

myStack2.push(item: "4")
myStack2.push(item: "5")
myStack2.push(item: "6")

myStack2.pop()
myStack2.pop()
myStack2.pop()
myStack2.pop()
myStack2



// higher order functions
// 고차함수

let names = ["kim", "lee", "min", "john"]

// map ->
let names2 = names.map { $0 + "님" }
names2

let names3 = names.map { name in
    name.count
}

let names4 = names.map { name in
    name.count > 3
}

// filter -> 거른다
let filterNames = names.filter { name in
    name.count > 3
}
filterNames

// reduce 하나로 뭉친다, 통합, 합친다...
names.reduce("") { (first, second)  in
    return first + second
}

let sumName = names.reduce("aaa") {
    $0 + $1
}
sumName

let numberArr = [1, 2, 3, 4, 5, nil, 6, nil, 8]
let sumNum = numberArr.reduce(0) { $0 + ($1 ?? 0) }
sumNum

// compactMap
// nil 자동처리를 원하는 경우
let numbers = numberArr.compactMap { (num) in
    return num
}
numbers

// flatmap
let numbers2 = [[1, 2, 3], [4, 5, 6]]

let flatNum = numbers2.flatMap{ $0 }
flatNum
