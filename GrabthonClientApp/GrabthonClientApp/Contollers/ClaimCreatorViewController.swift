//
//  ClaimCreatorViewController.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 08/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import UIKit

class ClaimCreatorViewController: UIViewController {

    var claimType: ClaimCategory!
    var userID: String!
    var policyID: String!
    var userName: String!
    var userAddress: String!    
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var bttnInc: UIButton!
    @IBOutlet weak var bttnDesc: UIButton!
    @IBOutlet weak var bttnSubmitClaim: UIButton!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var toggleIsStolen: UISwitch!
    @IBOutlet weak var lblIsStolen: UILabel!
    @IBOutlet weak var stolenViewHeight: NSLayoutConstraint!
    @IBOutlet weak var uploadImageheight: NSLayoutConstraint!
    @IBOutlet weak var bttnUploadImage: UIButton!
    @IBOutlet weak var imageViewUploadImage: UIImageView!
    @IBOutlet weak var lblUploadImage: UILabel!
    
    @IBOutlet weak var viewStolen: UIView!
    @IBOutlet weak var viewUploadImage: UIView!

    var currentPrice = 0
    var heightOfImageView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bttnInc.layer.cornerRadius = 30
        bttnDesc.layer.cornerRadius = 30
        bttnSubmitClaim.layer.cornerRadius = 10
        viewCard.layer.borderColor = UIColor.black.cgColor
        viewCard.layer.borderWidth = 0.5
        viewCard.layer.cornerRadius = 10
        lblPrice.text = "$ \(currentPrice)"
        
        setUpView()
    }
    
    func setUpView(){
        if claimType == ClaimCategory.healthClaim {
            stolenViewHeight.constant = 0
            toggleIsStolen.isHidden = true
            lblIsStolen.isHidden = true
            viewStolen.isHidden = true
        }
        
    }
       
    @IBAction func bttnChangePrice(_ sender: UIButton) {
        if sender.tag == 1 {
            currentPrice = currentPrice == 0 ? currentPrice : currentPrice - 1
        } else {
            currentPrice =  currentPrice + 1
        }
        
        lblPrice.text = "₹ \(currentPrice)"
    }
    
    @IBAction func toggleValueChanged(_ sender: Any) {}
    
    @IBAction func bttnUploadImage(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ImageViewController") as! ImageViewController
        vc.imageCallback = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bttnSubmitClaim(_ sender: UIButton) {
        var stringUrl: String!
        if claimType == ClaimCategory.healthClaim {
            stringUrl = UrlFile.getApiForUploadingMedicalRecords()
        } else if claimType == ClaimCategory.vechileClaim {
            if toggleIsStolen.isOn {
                stringUrl = UrlFile.getApiForUploadingMedicalRecords()
            } else {
                stringUrl = UrlFile.getApiForUploadingCar()
            }
        }
        
        let image = imageViewUploadImage.image!
        
        Datahandler.uploadImage(image: image, url: stringUrl, isFile: toggleIsStolen.isOn) { (response) in
            if self.claimType == ClaimCategory.healthClaim {
                self.doesHaveFileContent(imageUrl: response["imageUrl"]!, imageText: response["imagetext"]!)
            } else if self.claimType == ClaimCategory.vechileClaim {
                if self.toggleIsStolen.isOn {
                    self.doesHaveFileContent(imageUrl: response["imageUrl"]!, imageText: response["imagetext"]!)
                } else {
                    self.doesNotHaveFileContent(imageUrl: response["imagePath"]!, message: response["message"]!, score: response["score"]!)
                }
            }
        }
    }
    
}

extension ClaimCreatorViewController: ImageCallBack {
    func sendImage(image: UIImage) {
        self.imageViewUploadImage.image = image
    }
}

// Api call for sending all data
extension ClaimCreatorViewController {
    func doesHaveFileContent(imageUrl: String, imageText: String) {
        DispatchQueue.main.async {
            var counter = 0
            if imageText.contains(self.userName!) {
                counter = counter + 1
            }
            if imageText.contains(self.userAddress!) {
                counter = counter + 1
            }
            let status = counter > 0 ? "APPROVED" : "DECLINE"
            var urlString = ""
            var parameter: [String: Any]!
            if self.claimType == ClaimCategory.healthClaim {
                 parameter = [
                    "userID": self.userID!,
                    "policyID": self.policyID!,
                    "imagePath": imageUrl,
                    "imageDecodedTest": imageText,
                    "claimCategory": self.claimType.rawValue,
                    "amountClaimed": self.currentPrice,
                    "status": status
                ] as [String : Any]
                urlString = UrlFile.postApiForClaimshealth()
            } else {
                parameter = [
                    "userID": self.userID!,
                    "policyID": self.policyID!,
                    "proofImagePath": imageUrl,
                    "ProofImageText": imageText,
                    "claimCategory": self.claimType.rawValue,
                    "amountClaimed": self.currentPrice,
                    "status": status,
                    "isTheft": self.toggleIsStolen.isOn
                ] as [String : Any]
                urlString = UrlFile.postApiForClaimsVechile()
            }
            
            Datahandler.postToClaims(url: urlString, parameter: parameter) { (response) in
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
        }
    }
    
    func doesNotHaveFileContent(imageUrl: String, message: String, score: String) {
        DispatchQueue.main.async {
            
            var status = ""
            if message == "NO DAMAGE" {
                status = "DECLINE"
            } else if message == "LOW DAMAGE" && self.currentPrice < 10 {
                status = "APPROVED"
            } else if message == "LOW DAMAGE" && self.currentPrice > 10 {
                status = "NEED_HUMAN"
            } else if message == "HIGH DAMAGE" && self.currentPrice < 500 {
                status = "APPROVED"
            } else if message == "HIGH DAMAGE" && self.currentPrice > 500 {
                status = "NEED_HUMAN"
            } else if message == "NOT CAR" {
                let alert = UIAlertController(title: "Alert", message: "Stop playing !!!!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Sure", style: .cancel))
                self.present(alert, animated: true)
                return
            }
            
            let parameter = [
                "userID": self.userID!,
                "policyID": self.policyID!,
                "proofImagePath": imageUrl,
                "ProofImageText": message,
                "claimCategory": self.claimType.rawValue,
                "amountClaimed": self.currentPrice,
                "status": status,
                "isTheft": self.toggleIsStolen.isOn
            ] as [String : Any]
             let urlString = UrlFile.postApiForClaimsVechile()
            
            Datahandler.postToClaims(url: urlString, parameter: parameter) { (response) in
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
