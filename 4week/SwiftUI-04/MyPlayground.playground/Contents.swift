import UIKit

//class 클래스 이름: 부모 클래스 {
//    // 프로퍼티
//    // let, var 정의
//    // 인스턴스 메서드
//    // 타입 메서드
//}

class BankAccount {
    //프로퍼티
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    var fees: Float = 25.0
    
    var balanceLessFees: Float {
        get {
            return accountBalance - fees
        }
        set (newBalance) {
            accountBalance = newBalance - fees
        }
    }
    
    lazy var myProperty: String = {
        //오래걸리는 작업
//        var result = resourceIntensiveTask()
//        result = processData(data: result)
//        return result
        return ""
    }()
    
    init() {
        accountBalance = 0
        accountNumber = 0
    }
    
    init(number: Int, Balance: Float) {
        accountNumber = number
        accountBalance = Balance
    }
    
    deinit {
        //필요한 정리작업을 수행
    }
    
    //인스턴스 메서드
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    
    //타입 메서드 class or static
    //class 타입 메서드 -> 상속, 오버라이딩 (static 오버라이딩 안됨.)
    class func getMaxBalance() -> Float {
        
        return 100000.0
    }
}

var bankAccount = BankAccount()

bankAccount.balanceLessFees = 12123.12

print(bankAccount.accountBalance)
print(bankAccount.accountNumber)
bankAccount.displayBalance()

print(BankAccount.getMaxBalance())


class SavingAccount: BankAccount {
    var interestRate: Float = 0.0
    
    init(number: Int, Balance: Float, interestRate: Float) {
        self.interestRate = interestRate
        super.init(number: number, Balance: Balance)
    }
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    override func displayBalance() {
        super.displayBalance()
        print("Prevailing interestRate is \(interestRate)")
    }
}
print("-------------------------")
var savingAccount = SavingAccount(number: 12311, Balance: 600.00, interestRate: 0.07)
print(savingAccount.calculateInterest())
savingAccount.displayBalance()


extension Double {
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

let myValue: Double = 3.0
print(myValue.squared)
