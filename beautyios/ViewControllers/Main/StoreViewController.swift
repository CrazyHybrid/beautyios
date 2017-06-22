//
//  StoreViewController.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit




class StoreViewController: ViewController {
    
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var storeTitle: UILabel!
    
    @IBOutlet weak var stamplabel1: UILabel!
    
    @IBOutlet weak var stamplabel2: UILabel!
    
    @IBOutlet weak var stamplabel3: UILabel!
    
    @IBOutlet weak var stamplabel4: UILabel!
    
    @IBOutlet weak var stamplabel5: UILabel!
    
    @IBOutlet weak var stamplabel6: UILabel!
    
    @IBOutlet weak var stamplabel7: UILabel!
    
    @IBOutlet weak var stamplabel8: UILabel!
    
    @IBOutlet weak var stamplabel9: UILabel!
    
    @IBOutlet weak var stamplabel10: UILabel!
    
    @IBOutlet weak var stampDate: UILabel!
    @IBOutlet weak var imgTitle: UIImageView!
    
    @IBOutlet weak var badgeProLabel: UILabel!
    
    @IBOutlet weak var mainScrol: UIScrollView!
    
    @IBOutlet weak var comingAppointView: UIView!
    
    @IBOutlet weak var comingAppointTableView: UITableView!
    
    @IBOutlet weak var myMembershipView: UIView!
    
    @IBOutlet weak var myMembershipTableView: UITableView!
    
    @IBOutlet weak var stampView: UIView!
    
    @IBOutlet weak var eventView: UIView!
    
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @IBAction func onClickNotifButton(_ sender: Any) {
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
    }
    
    @IBAction func onClickAppointment(_ sender: Any) {
    }
    
    @IBAction func onClickDiary(_ sender: Any) {
    }
    
    @IBAction func onClickMessage(_ sender: Any) {
    }
    
    @IBAction func onClickProfile(_ sender: Any) {
    }

    @IBOutlet weak var onClickRecommend: UIButton!
    
    
    @IBOutlet weak var onClickStampInfo: UIButton!
    
    
}

extension StoreViewController{
    
    
    
    
}


