//
//  ImageViewController.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 08/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import UIKit

protocol ImageCallBack: class {
    func sendImage(image: UIImage)
}

class ImageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    weak var imageCallback: ImageCallBack!
    let arrayData = [UIImage(named: "1.png"),
                    UIImage(named: "2.png"),
                    UIImage(named: "3.png"),
                    UIImage(named: "4.png"),
                    UIImage(named: "5.png"),
                    UIImage(named: "6.png"),
                    UIImage(named: "7.png")]
    
    @IBOutlet weak var tbleView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        (cell?.viewWithTag(1000) as! UIImageView).image = arrayData[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageCallback.sendImage(image: arrayData[indexPath.row]!)
        navigationController?.popViewController(animated: true)
    }
        

}
