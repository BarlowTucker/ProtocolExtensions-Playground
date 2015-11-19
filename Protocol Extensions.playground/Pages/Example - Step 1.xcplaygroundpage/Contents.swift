//: Playground - noun: a place where people can play

import UIKit

protocol Parsable {
    init(json:JSON)
}

class Foobar:Parsable {
    let ID:String!
    let foo:String!
    let bar:String!
    
    required init(json:JSON) {
        self.ID = json["ID"].string
        self.foo = json["foo"].string
        self.bar = json["bar"].string
    }
    
    class func array(json:JSON!) -> [Foobar] {
        var jsonObject:[JSON] = []
        
        if let json = json.array {
            jsonObject = json
        } else {
            jsonObject = [json]
        }
        
        var array: [Foobar] = []
        
        for json:JSON in jsonObject {
            let foobar = self.init(json:json)
            array.append(foobar)
        }

        return array
    }
    
    class func search(term:String) -> [Foobar] {
        //SEARCH API
        return Foobar.array(NetworkStuff.request(["action":"search", "term":term]))
    }
}

let foo = Foobar.search("first")

