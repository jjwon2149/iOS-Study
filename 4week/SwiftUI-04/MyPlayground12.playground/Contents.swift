import UIKit

struct SampleStruct {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() {
        "Hello " + name
    }
}

class SampleClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() {
        "Hello " + name
    }
}


let myStruct1 = SampleStruct(name: "Mark")
var myStruct2 = myStruct1
myStruct2.name = "David"

print(myStruct1)
print(myStruct2)

let myClass1 = SampleClass(name: "Mark")
let myClass2 = myClass1
myClass2.name = "David"

print(myClass1)
print(myClass2)

enum Temperature {
    case hot
    case warm
    case cold(centigrade: Int)
}

func displayTemprature(temp: Temperature) {
    switch temp {
    case .hot:
        print("hot")
    case .warm:
        print("warm")
    case .cold(let centigrade) where centigrade <= 0:
        print("Ice Warning\(centigrade)")
    case .cold:
        print("cold")
    }
}

displayTemprature(temp: .cold(centigrade: -19))
