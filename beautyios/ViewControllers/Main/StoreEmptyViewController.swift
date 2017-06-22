//
//  StoreEmptyViewController.swift
//  beautyios
//
//  Created by Michael on 6/22/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import Kingfisher

class StoreEmptyViewController: ViewController {
    
    @IBOutlet weak var imageStore: UIImageView!
    
    @IBOutlet weak var badgeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
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
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNotiButton(_ sender: Any) {
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
    
    @IBAction func onClickCall(_ sender: Any) {
        
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

extension StoreEmptyViewController{
    
    func requestStoreMembership(){
        showLoading("")
        
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        let currentTimeMillis = NSDate().timeIntervalSince1970 * 1000;
        
        let timestamp: String = String(format:"%.f", currentTimeMillis)
        
        APIRequestManager.getStoreMembershipAPI(store_ID, padoToken!, timestamp,
                                                 completion: {(response, error) -> Void in
                                                    
                                                    if response != nil {
                                                        
//                                                        do{
//                                                            let storeJSON = try JSONSerialization.jsonObject(with: response as! Data, options: .allowFragments) as? [String: Any]
                                                        let title = response?.object(forKey: "title")
                                                        print( title )
                                                        let imgTitle = response?.object(forKey: "cardimage")
                                                        print( imgTitle )
                                                        
                                                        self.phoneNumber = response?.object(forKey: "phone") as! String
                                                        
                                                        self.reloadView( title as! String, imgTitle as! String )
//                                                        }catch{
//                                                            print(error)
//                                                        }
                                                        
                                                        self.hideLoading()
                                                    }else{
                                                        self.hideLoading()
                                                        
                                                    }
        })
    }
    
    func reloadView(_ title: String, _ imgTitle: String){
        
        
        titleLabel.text = title
        
        self.imageStore.kf.setImage(with: URL(string: imgTitle), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
        }

    }
}
