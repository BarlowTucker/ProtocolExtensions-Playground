import Foundation

public class NetworkStuff {
    public class func request(request:[String:String]) -> JSON? {
        let response:String
        
        switch (request["term"]!) {
            case "first":
                response = "{\"ID\":\"123\", \"foo\":\"foooo\", \"bar\":\"barbarb\"}"
            default:
                response = "[{\"ID\":\"456\", \"foo\":\"from array\", \"bar\":\"barb\"}, {\"ID\":\"789\", \"foo\":\"foood\", \"bar\":\"barbar\"}]"
        }
        
        let data: NSData = response.dataUsingEncoding(NSUTF8StringEncoding)!
        let request:AnyObject? = try? NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        return JSON(request!)
    }
}