//
//  Utility.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 07/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation
import UIKit
class Utility {
    //  Settting and getting user id from user default
    class func setUserID(value: String){
        UserDefaults.setValue(value, forKey: "userid")
    }
    
    class func getUserID()-> String{
        return UserDefaults.value(forKey: "userid") as! String
    }
}

// Extension method
extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

extension Date {
    func toString(format: String = "yyyy-MM-dd mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return "\(key)" + "=" + "\(value)"
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
