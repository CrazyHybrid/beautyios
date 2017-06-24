//
//  StoreViewController.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher



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
    
    
    var store_ID : Int = -1
    var store_Title : String = ""
    var store_Type : Int = -1
    var single_Store : Bool = false
    
    var phoneNumber : String = ""
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestStoreMembership()
    }
    
    
    @IBAction func onClickNotifButton(_ sender: Any) {
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
        let menuArray = [KxMenuItem.init(" 로그아웃   ", image: UIImage(named: "Touch"), target: self, action: #selector(StoreListViewController.Logout(_:)))]
        
        
        KxMenu.setTitleFont(UIFont(name: "HelveticaNeue", size: 17))
        
        //config
        let options = OptionalConfiguration(arrowSize: 0,  //Indicates the arrow size
            marginXSpacing: 7,
            marginYSpacing: 7,
            intervalSpacing: 25,
            menuCornerRadius: 6,
            maskToBackground: true,
            shadowOfMenu: false,
            hasSeperatorLine: true,
            seperatorLineHasInsets: false,
            textColor: Colour(R: 0, G: 0, B: 0),
            menuBackgroundColor: Colour(R: 1, G: 1, B: 1)
        )
        
        
        KxMenu.show(in: self.view, from: (sender as AnyObject).frame, menuItems: menuArray, withOptions: options)
        
    }
    
    func Logout(_ sender: AnyObject) {
        
        print(sender)
        
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        
        AuthControllers.logout(padoToken!, completion: {(response, error) -> Void in
            
            User.setUser("", "", "", success: { (user) in
                let preferences = UserDefaults.standard
                preferences.set("", forKey: User.PADO_TOKEN)
                
                _ = preferences.synchronize();
                
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
                self.navigationController?.pushViewController(loginVC, animated: true)
                
                
            }, failure: { (errorString) in
            })
        })
    }
    
    @IBAction func onClickAppointment(_ sender: Any) {
        
        let appointVC = self.storyboard?.instantiateViewController(withIdentifier: "appointVC") as! AppointmentsController
        self.navigationController?.pushViewController(appointVC, animated: true)

    }
    
    @IBAction func onClickDiary(_ sender: Any) {
        let diaryVC = self.storyboard?.instantiateViewController(withIdentifier: "diaryVC") as! DiaryViewController
        self.navigationController?.pushViewController(diaryVC, animated: true)
        
    }
    
    @IBAction func onClickMessage(_ sender: Any) {
        let ChatVC = self.storyboard?.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
        self.navigationController?.pushViewController(ChatVC, animated: true)
        
    }
    
    @IBAction func onClickProfile(_ sender: Any) {
        
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as! AppointmentsController
        self.navigationController?.pushViewController(profileVC, animated: true)

    }

    @IBAction func onClickRecommend(_ sender: Any) {
        
        let referVC = self.storyboard?.instantiateViewController(withIdentifier: "referVC") as! AppointmentsController
        self.navigationController?.pushViewController(referVC, animated: true)

    }
    
    @IBAction func onClickStampInfo(_ sender: Any) {
    }
    
    @IBAction func onClickPhoneCall(_ sender: Any) {
        
        let strPhone = self.phoneNumber.replacingOccurrences(of: "-", with: "", options: String.CompareOptions.literal, range: nil)
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

extension StoreViewController{

    func requestStoreMembership(){
        showLoading("")
        
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        let currentTimeMillis = NSDate().timeIntervalSince1970 * 1000;
        
        let timestamp: String = String(format:"%.f", currentTimeMillis)
        
        APIRequestManager.getStoreMembershipAPI( store_ID, padoToken!, timestamp,
                                                 completion: {(response, error) -> Void in
                                                    
                                                    if response != nil {
                                                        
                                                        let title = response?.object(forKey: "title")
                                                        print( title )
                                                        let imgTitle = response?.object(forKey: "cardimage") as! String
                                                        print( imgTitle )

                                                        self.storeTitle.text = title as! String
                                                        
                                                        
                                                        self.imgTitle.kf.setImage(with: URL(string: imgTitle), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
                                                        }
                                                        
                                                        self.hideLoading()
                                                    }else{
                                                        self.hideLoading()
                                                        
                                                    }
        })
    }
}

extension StoreViewController{
    
    func reloadView(){
        
        
        
    }
    
    
}

extension StoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.myStoreList.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreViewCell
        
//        let storeDic = self.myStoreList[indexPath.row]
//        let url = storeDic["cardimage"] as! String
//        
//        cell.storeImage.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
//        }
        
        return cell
    }
}

extension StoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.storeTableView.deselectRow(at: indexPath, animated: true)
//        
//        let storeDic = self.myStoreList[indexPath.row]
//        
//        let storeVC = self.storyboard?.instantiateViewController(withIdentifier: "storeVC") as! StoreViewController
//        storeVC.store_ID = storeDic["store_id"] as! Int
//        storeVC.store_Title = storeDic["title"] as! String
//        storeVC.store_Type = storeDic["storetype"] as! Int
//        storeVC.single_Store = false
//        self.navigationController?.pushViewController(storeVC, animated: true)
        
        
    }
}


