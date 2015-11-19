//: # Protocol Extensions
//: **Barlow Tucker** - @barlow_tucker

import Foundation


//
protocol TheProtocol {
    var theVariable:String {get}
    
    func funcOne() -> String
    func funcTwo() -> String
}

extension TheProtocol {
    func funcOne() -> String {
        return "funcOne was called from TheProtocol extension"
    }
    
    func funcTwo() -> String {
        return "funcTwo was called from TheProtocol extension"
    }
    
    func funcThree() -> String {
        return "funcThree was called from TheProtocol extension"
    }
    
    var theVariable:String {
        get {
            return "TheVariable"
        }
    }
}

class TheClass: TheProtocol {
    func funcOne() -> String {
        return "funcOne was called from TheClass"
    }
    
    func funcThree() -> String {
        return "funcThree was called from TheClass"
    }
}

struct TheStruct: TheProtocol {

}

let classOne = TheClass()
print(classOne.funcOne())
print(classOne.funcTwo())
print(classOne.funcThree())

let classTwo:TheProtocol = TheClass()
print(classTwo.funcOne())
print(classTwo.funcTwo())
print(classTwo.funcThree())

//: [Next](@next)
