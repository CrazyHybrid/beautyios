//
//  NotificationController.swift
//  beautyios
//
//  Created by Michael on 6/23/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class NotificationController: UIViewController{
    
    @IBOutlet weak var badgeLabel: UILabel!
    
    @IBOutlet weak var notiImageView: UIImageView!
    @IBOutlet weak var notiTitle: UILabel!
    @IBOutlet weak var notiContent: UILabel!
    @IBOutlet weak var notiDate: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNotification(_ sender: Any) {
        let notifisVC = self.storyboard?.instantiateViewController(withIdentifier: "notifisVC") as! NotificationsController
        self.navigationController?.pushViewController(notifisVC, animated: true)
    }
    
    
    
}
