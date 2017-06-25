//
//  ProfileSurveyController.swift
//  beautyios
//
//  Created by Michael on 6/24/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation


class ProfileSurveyController: UIViewController{
    
    @IBOutlet weak var badgeLabel: UILabel!
    
    var strPhoneNumber = ""
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func onClickNotiButton(_ sender: Any) {
        
        let NotiVC = self.storyboard?.instantiateViewController(withIdentifier: "notifiVC") as! NotificationsController
        self.navigationController?.pushViewController(NotiVC, animated: true)
        
    }
    
    @IBAction func onClickPhoneCall(_ sender: Any) {
        
        let strPhone = self.strPhoneNumber.replacingOccurrences(of: "-", with: "", options: String.CompareOptions.literal, range: nil)
        let phone = "tel://" + strPhone
        
        if let url = URL(string: phone){
            if #available(iOS 10, *){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            else{
                UIApplication.shared.openURL(url)
            }
        }
    }
    


}
