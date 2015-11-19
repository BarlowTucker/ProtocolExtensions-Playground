//: # Protocol Extensions
//: **Barlow Tucker** - @barlow_tucker

import Foundation
import UIKit

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

extension TheProtocol where Self: CustomStringConvertible {
    func toString() -> String {
        return self.description
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

extension Bool: TheProtocol {
    
}

let classOne = TheClass()
print(classOne.funcOne())
print(classOne.funcTwo())
print(classOne.funcThree())

let classTwo:TheProtocol = TheClass()
print(classTwo.funcOne())
print(classTwo.funcTwo())
print(classTwo.funcThree())

let foo:Bool  = false
foo.toString()

//: [Next](@next)
