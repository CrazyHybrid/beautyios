//
//  ReferralViewController.swift
//  beautyios
//
//  Created by Michael on 6/24/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import Kingfisher


class ReferralViewController: ViewController{
    
    var strReferral = ""
    var imgStore = ""
    var strPhoneNumber = ""
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var recommendMessage: UITextView!
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailTextView.text = strReferral
        self.storeImage.kf.setImage(with: URL(string: self.imgStore), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
        }

    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func onClickNotification(_ sender: Any) {
        let notiVC = self.storyboard?.instantiateViewController(withIdentifier: "notifiVC") as! NotificationsController
        self.navigationController?.pushViewController(notiVC, animated: true)
    }
    @IBAction func onClickSendRecommend(_ sender: Any) {
    }
    
    @IBAction func onClickPhoneCall(_ sender: Any) {
        
        let strPhone = strPhoneNumber.replacingOccurrences(of: "-", with: "", options: String.CompareOptions.literal, range: nil)
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
