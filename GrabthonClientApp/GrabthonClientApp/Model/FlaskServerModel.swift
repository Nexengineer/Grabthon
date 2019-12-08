//
//  FlaskServerModel.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 08/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation

struct FileUploadResponse: Codable {
    var imagePath: String
    var imageContent: String
}

struct CarUploadResponse: Codable {
    var message: String
    var imagePath: String
    var score: String
}
