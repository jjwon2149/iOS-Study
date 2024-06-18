import UIKit
import Foundation
import Combine

var greeting = "Hello, playground"

//MARK: - Puslisher
Just(42)
    .sink { value in
        print("Recived \(value)")
    }
["Peperoni", "Mushrooms", "Onions"].publisher
    .sink { topping in
        print("\(topping) is a favorite toiing for pizza")
    }

"Conbine".publisher
    .sink { value in
        print("Hello,\(value)")
    }

Just("Conbine")
    .sink { value in
        print("Hello,\(value)")
    }
