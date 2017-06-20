//
//  StoreListViewController.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit


class StoreViewCell: UITableViewCell {
    
}

class StoreListViewController: UIViewController {
    
    
    @IBOutlet weak var viewMembership: UIView!
    @IBOutlet weak var storeTableView: UITableView!
    
    @IBOutlet weak var viewNoMembership: UIView!
    
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewNoMembership.isHidden = true
    }
    
    @IBAction func OnClickNotification(_ sender: Any) {
    }
    
    @IBAction func OnClickLogoutMenu(_ sender: Any) {
    }
}

extension StoreListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.storeTableView.dequeueReusableCell(withIdentifier: "StoreViewCell", for: indexPath) as! StoreViewCell
        
        return cell
    }
}

extension StoreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.storeTableView.deselectRow(at: indexPath, animated: true)
        
    }
}
