//
//  Apihandler.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 07/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation
import UIKit

class Apihandler {
    
    // Sending the claim Image to the Server
    class func sendImageToApi(url: String, image: UIImage, sucess: @escaping(([String: String])->())){
        let url = URL(string: url)
        let boundary = UUID().uuidString
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        var data = Data()
        let nameOfImage = Date().toString() + "MyImage.jpg"
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(nameOfImage)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    if let receivedData = json["data"] {
                        sucess(receivedData as! [String : String])
                    } else {
                        sucess(json as! [String : String])
                    }
                }
            }
        }).resume()
    }
    
    
    // Post API call
    func postAPICall(url: String, parameter: [String: Any], sucess: @escaping (String) -> ()) {
        let url = URL(string:url)!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameter)
//            parameter.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                sucess("sucess")
            }
        }
        
        task.resume()
    }
    
    // GET API call
    func GetApiCall<T: Codable>(url: String, sucess: @escaping ([T]) -> ()) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                do {
                    let responseData = try JSONDecoder().decode([T].self, from: data!)
                    sucess(responseData)
                }catch{
                    
                }
            }
        }
        
        task.resume()
    }
}
