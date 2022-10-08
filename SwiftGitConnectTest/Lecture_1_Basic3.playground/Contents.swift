import UIKit


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

class NewInfo {
    var myAge = 0
}

var info1 = NewInfo()
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
