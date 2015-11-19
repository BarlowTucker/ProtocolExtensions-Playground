////: Playground - noun: a place where people can play
//
import UIKit

//MARK: - Protocols
protocol ParsableTwo {
    init(json:JSON)
}

protocol Searchable {
    static func search(term:String) -> [Self]
}

//MARK: - Extensions
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

extension Searchable where Self: ParsableTwo {
    static func search(term:String) -> [Self] {
        return Self.array(NetworkStuff.request(["action":"search", "term":term]))
    }
}

final class Foobar:ParsableTwo, Searchable {
    let ID:String?
    let foo:String?
    let bar:String?
    
    required init(json:JSON) {
        self.ID = json["ID"].string
        self.foo = json["foo"].string
        self.bar = json["bar"].string
    }
}

Foobar.search("first")
