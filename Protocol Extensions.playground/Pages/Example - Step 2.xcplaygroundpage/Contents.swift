////: Playground - noun: a place where people can play
//
import UIKit

public protocol ParsableTwo {
    typealias ParsableType = Self

    init(json:JSON)
//    static func array(json:JSON) -> [ParsableType]
}

extension ParsableTwo {
    static func array(json:JSON!) -> [Self] {
        var jsonObject:[JSON] = []

        if let json = json.array {
            jsonObject = json
        } else {
            jsonObject = [json]
        }

        var array: [Self] = []

        for json:JSON in jsonObject {
            let foobar = Self.init(json:json)
            array.append(foobar)
        }

        return  array
    }
}

class Foobar:ParsableTwo {
    let ID:String?
    let foo:String?
    let bar:String?
    
    required init(json:JSON) {
        self.ID = json["ID"].string
        self.foo = json["foo"].string
        self.bar = json["bar"].string
    }
    
    class func search(term:String) -> [Foobar] {
        return Foobar.array(NetworkStuff.request(["action":"search", "term":term]))
    }
}

Foobar.search("first")
