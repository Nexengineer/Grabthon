//
//  Datahandler.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 07/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation
import UIKit

class Datahandler {
    // Method called on submission of claims
    
    /*
    "userId": "dasdasdasdsdasd",
    "claimAmount":"sdfsdffsdfsdf",
    "policyNumber":"tyutyutyuut",
    "imagePath":"qweqweqweqweqwe",
    "imageDecodedText": "fgbbberfbvf",
    "claimCategory": "dasdasdasdadsasd"
     */
    class func uploadImage(image: UIImage,url: String, isFile: Bool,sucess: @escaping ([String: String]) -> ()){
        
        Apihandler.sendImageToApi(url: url, image: image) { (response) in
            if isFile {
                if let _ = response["imageUrl"], let _ = response["imagetext"] {
                    sucess(response)
                }
            }  else {
                               sucess(response)
                           }
        }
    }
    
    // Api call for getting user data
    class func getAllUsers(sucess: @escaping (([UserModel]) -> ())){
        Apihandler().GetApiCall(url: UrlFile.getApiCallPathForUsers()) { (response:[UserModel]) in
            sucess(response)
        }
    }
    
    // Post claim
    class func postToClaims(url: String, parameter: [String: Any], sucess: @escaping(String) -> ()) {
        Apihandler().postAPICall(url: url, parameter: parameter) { (response) in
            sucess(response)
        }
    }
    
    
}
