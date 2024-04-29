import UIKit

protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        return "Hello" + name
    }
    
}

//some 키워드는 computed property인 body안에 불투명한 타입이 있음을 나타냅니다.
func doubleFun1 (value: Int) -> some Equatable {
    return value * 2
}

func doubleFun2 (value: String) -> some Equatable {
    return value + value
}

let itOne = doubleFun1(value: 10)
print("\(itOne)")


let stringOne = doubleFun2(value: "Hello")
print("\(stringOne)")

//if (itOne == stringOne) {
//    
//}

class SavingAccount: BankAccount {
    
}
