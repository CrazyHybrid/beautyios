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



class StoreNewViewController: ViewController {
    
    @IBOutlet weak var badgeLabel: UILabel!
 
    @IBOutlet weak var storeTitle: UILabel!

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var store_ID : Int = -1
    var store_Title : String = ""
    var store_Type : Int = -1
    var single_Store : Bool = false
    
    var phoneNumber : String = ""
    
    var myStoreList = [[String:Any]]()
    var myTicketList = [[String:Any]]()
    var myPostList = [[String:Any]]()
    var myStampCardList = [[String:Any]]()
    var myPromotionList = [[String:Any]]()
    var myUpcomingAppointList = [[String:Any]]()
    var myReviewableAppointList = [[String:Any]]()
    var myCompCreditDate : NSDate? = nil
    
    var myStrReferral = ""
    var myStoreImageURL = ""
    var myStoreTitle = ""
    var myNewsurveyNum = 0
    var myCredits = 0
    var storePhone = ""
    var StampDesc = ""
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reloadView()
//        requestStoreMembership()
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
        
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as! ProfileSurveyController
        profileVC.strPhoneNumber = storePhone
        self.navigationController?.pushViewController(profileVC, animated: true)

    }

    @IBAction func onClickRecommend(_ sender: Any) {
        
        let referVC = self.storyboard?.instantiateViewController(withIdentifier: "referVC") as! ReferralViewController
        referVC.strReferral = myStrReferral
        referVC.imgStore = myStoreImageURL
        referVC.strPhoneNumber = storePhone
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

extension StoreNewViewController{

    func requestStoreMembership(){
        showLoading("")
        
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        let currentTimeMillis = NSDate().timeIntervalSince1970 * 1000;
        
        let timestamp = String(format:"%.f", currentTimeMillis)
        
        APIRequestManager.getStoreMembershipAPI( store_ID, padoToken!, timestamp,
                                                 completion: {(response, error) -> Void in
                                                    
                                                    if response != nil {
                                                        
                                                        do{
                                                            let storeJSON = try JSONSerialization.jsonObject(with: response as! Data, options: .allowFragments) as? [String: Any]
                                                            
                                                            self.myStampCardList = (storeJSON?["stampcards"] as? [[String: AnyObject]])!
                                                            self.myTicketList = (storeJSON?["tickets"] as? [[String: AnyObject]])!
                                                            self.myPromotionList = (storeJSON?["promotions"] as? [[String: AnyObject]])!
                                                            self.myPostList = (storeJSON?["posts"] as? [[String: AnyObject]])!
                                                            self.myUpcomingAppointList = (storeJSON?["upcomingAppointments"] as? [[String: AnyObject]])!
                                                            self.myReviewableAppointList = (storeJSON?["reviewableAppointments"] as? [[String: AnyObject]])!
                                                            self.myCompCreditDate = storeJSON?["complimentary_credits"] as? NSDate
                                                            
                                                            self.myNewsurveyNum = storeJSON?["numsurveys"] as! Int
                                                            self.myStrReferral = storeJSON?["referraldescription"] as! String
                                                            
                                                            
                                                            self.myCredits = storeJSON?["credits"] as! Int
                                                            self.myStoreTitle = storeJSON?["title"] as! String
                                                            self.myStoreImageURL = storeJSON?["cardimage"] as! String
                                                            self.storePhone = storeJSON?["phone"] as! String
                                                            self.StampDesc = storeJSON?["stampdesc"] as! String
                                                            
                                                            self.reloadView()
                                                            
                                                        }catch{
                                                            print(error)
                                                        }
                                                        self.hideLoading()
                                                    }else{
                                                        self.hideLoading()
                                                        
                                                    }
        })
    }
}

var containerView = UIView()

extension StoreNewViewController{
    
    func reloadView(){
        

        self.storeTitle.text = self.myStoreTitle
        
    let categoryVC = storyboard?.instantiateViewController(withIdentifier: "cateVC") as! CategoryViewController
    let storeInfoVC = storyboard?.instantiateViewController(withIdentifier: "storeinfoVC") as! StoreInfoViewController
        
        categoryVC.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 72)
        storeInfoVC.view.frame = CGRect(x: 0.0, y: 72.0, width: self.view.frame.size.width, height: 200)

        
        self.mainScrollView.addSubview(categoryVC.view)
//        self.mainScrollView.addSubview(storeInfoVC.view)
        
        self.mainScrollView.backgroundColor = UIColor.gray
        self.mainScrollView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 1650)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
}

extension StoreNewViewController: UITableViewDataSource {
    
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

extension StoreNewViewController: UITableViewDelegate {
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


