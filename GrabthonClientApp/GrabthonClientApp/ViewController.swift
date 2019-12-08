//
//  ViewController.swift
//  GrabthonClientApp
//
//  Created by Neeraj.Mishra on 07/12/19.
//  Copyright © 2019 Neeraj.Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbleView: UITableView!
    var tbleViewDataSource:[UserModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Datahandler.getAllUsers { (response) in
            DispatchQueue.main.async {
                self.tbleViewDataSource = response
                self.tbleView.dataSource = self
                self.tbleView.reloadData()
            }
        }
    }

    
    
}

// MARK:: Delegate and Datasource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tbleViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let label = (cell?.viewWithTag(100)) as! UILabel
        
        label.text = "User " + "\(indexPath.row + 1)"
        (cell?.viewWithTag(1001))!.layer.borderWidth = 0.5
        (cell?.viewWithTag(1001))!.layer.cornerRadius = 5
        (cell?.viewWithTag(1001))!.layer.borderColor = UIColor.green.cgColor
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ClaimViewController") as! ClaimViewController
        vc.currentUser = tbleViewDataSource[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

