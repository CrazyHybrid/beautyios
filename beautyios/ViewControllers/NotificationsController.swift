//
//  NotificationsController.swift
//  beautyios
//
//  Created by Michael on 6/23/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation


class NotificationsController: UIViewController{
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var notiTableView: UITableView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onRefresh(_ sender: Any) {   //Notification Button Action
    }
    
    
}
