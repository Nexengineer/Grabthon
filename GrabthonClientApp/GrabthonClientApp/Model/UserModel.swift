//
//  UserModel.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 08/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
struct UserModel: Codable {
    let userID, name, lastName: String
    let insurances: [Insurance]
    let address: String
}

// MARK: - Insurance
struct Insurance: Codable {
    let policyID, userID, type: String
    let coveredField: [CoveredField]
}

// MARK: - CoveredField
struct CoveredField: Codable {
    let name: String
}
