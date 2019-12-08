//
//  ClaimModel.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 07/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation

class ClaimModel{
    var userID: String
    var claimAmount: String
    var policyNumber: String
    var imagePath: String
    var imageDecodedText: String
    var claimCategory: String
    
    init(imagePath: String, imageDecodedText: String) {
        self.userID = Utility.getUserID()
        self.claimAmount = ""
        self.policyNumber = ""
        self.imagePath = imagePath
        self.imageDecodedText = imageDecodedText
        self.claimCategory = ""
    }
}
