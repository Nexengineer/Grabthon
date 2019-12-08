//
//  UrlFile.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 07/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation

// Categorizing the api call for both backend
enum BaseUrl: String {
    case baseUrlFlaskServer = "http://127.0.0.1:5000"
    case baseUrlJavaServer = "http://127.0.0.1:8080/api/v1/insurance"
    case baseUrlForClaims = "http://127.0.0.1:8080/api/v1/claim"
}

class UrlFile {
    class func getApiForUploadingMedicalRecords() -> String {
        return BaseUrl.baseUrlFlaskServer.rawValue + "/upload"
    }
    
    class func getApiCallPathForUsers() -> String {
        return BaseUrl.baseUrlJavaServer.rawValue + "/users"
    }
    
    class func getApiForUploadingCar() -> String {
        return BaseUrl.baseUrlFlaskServer.rawValue + "/uploadcar"
    }
    
    class func postApiForClaimshealth() -> String {
        return BaseUrl.baseUrlForClaims.rawValue + "/health"
    }
    
    class func postApiForClaimsVechile() -> String {
        return BaseUrl.baseUrlForClaims.rawValue + "/vechile"
    }
    class func getClaimUserbased(userID: String) -> String {
        return BaseUrl.baseUrlForClaims.rawValue + "/" + userID
    }
}
