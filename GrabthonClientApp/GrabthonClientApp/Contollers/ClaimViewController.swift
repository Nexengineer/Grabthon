//
//  ClaimViewController.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 08/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import UIKit

class ClaimViewController: UIViewController {

    // It will be passed from the previous View controller
    var currentUser: UserModel!
    
    @IBOutlet weak var bttnCreateHealthClaim: UIButton!
    @IBOutlet weak var bttnViewAllClaim: UIButton!
    @IBOutlet weak var bttnCreateFlightClaim: UIButton!
    @IBOutlet weak var bttnCreateVechileClaim: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView(button: bttnViewAllClaim)
        setUpView(button: bttnCreateFlightClaim)
        setUpView(button: bttnCreateVechileClaim)
        setUpView(button: bttnCreateHealthClaim)
    }
    
    func setUpView(button: UIButton){
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 21, green: 140, blue: 58, alpha: 1).cgColor

    }
    
    

    @IBAction func ViewAllClaimPressed(_ sender: Any) {
    }
    
    @IBAction func createHealthClaimPressed(_ sender: Any) {
        pushViewController(category: .healthClaim)
    }
    
    @IBAction func createVechileClaimPressed(_ sender: Any) {
        pushViewController(category: .vechileClaim)
    }
    
    @IBAction func createFlightClaimPressed(_ sender: Any) {
        print("Not implemented")
    }
    
    func pushViewController(category: ClaimCategory){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ClaimCreatorViewController") as! ClaimCreatorViewController
        // Further config
        vc.claimType = category
        vc.userID = currentUser.userID
        vc.userName = currentUser.name
        vc.userAddress = currentUser.address
        for item in currentUser.insurances {
            if item.type == vc.claimType.rawValue {
                vc.policyID = item.policyID
                break
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
