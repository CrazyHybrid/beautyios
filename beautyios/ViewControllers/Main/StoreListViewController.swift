//
//  StoreListViewController.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class StoreViewCell: UITableViewCell {
    
    @IBOutlet weak var storeImage: UIImageView!
    
}

class StoreListViewController: ViewController {
    
    
    @IBOutlet weak var viewMembership: UIView!
    @IBOutlet weak var storeTableView: UITableView!
    
    @IBOutlet weak var viewNoMembership: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    
    var myStoreList = [[String:Any]]()
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewNoMembership.isHidden = true
        
        self.getStoreMembership()
    }
    
    @IBAction func OnClickNotification(_ sender: Any) {
        
        let notifisVC = self.storyboard?.instantiateViewController(withIdentifier: "notifisVC") as! NotificationsController
        self.navigationController?.pushViewController(notifisVC, animated: true)
    }
    
    @IBAction func OnClickLogoutMenu(_ sender: Any) {
        
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
    
    func getStoreMembership()
    {
        
        showLoading("")
        
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        let currentTimeMillis = NSDate().timeIntervalSince1970 * 1000;
        
        let timestamp: String = String(format:"%.f", currentTimeMillis)
        
        APIRequestManager.getStoreMembershipsAPI(padoToken!, timestamp,
                                                 completion: {(response, error) -> Void in
                                                    
                                                    if response != nil {
                                                        
                                                        do{
                                                            let storeJSON = try JSONSerialization.jsonObject(with: response as! Data, options: .allowFragments) as? [String: Any]
                                                            
                                                            let store = storeJSON?["storeMemberships"] as? [[String: AnyObject]]
                                                            
                                                            
                                                            self.myStoreList = store!
                                                            print( store )

                                                            
                                                        }catch{
                                                            print(error)
                                                        }
                                                        
                                                        self.hideLoading()
                                                        self.storeTableView.reloadData()
                                                        self.viewMembership.isHidden = false
                                                    }else{
                                                        self.hideLoading()
                                                        self.viewNoMembership.isHidden = false
                                                        
                                                    }
        })
    }
}

extension StoreListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myStoreList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreViewCell
        
        let storeDic = self.myStoreList[indexPath.row]
        let url = storeDic["cardimage"] as! String
        
        cell.storeImage.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
        }
        
        return cell
    }
}

extension StoreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.storeTableView.deselectRow(at: indexPath, animated: true)
        
        let storeDic = self.myStoreList[indexPath.row]
        let store_Type = storeDic["storetype"] as! Int
        
        if store_Type == 100 {
            let storeVC = self.storyboard?.instantiateViewController(withIdentifier: "storeVC") as! StoreViewController
            storeVC.store_ID = storeDic["store_id"] as! Int
            storeVC.store_Title = storeDic["title"] as! String
            storeVC.single_Store = false
            self.navigationController?.pushViewController(storeVC, animated: true)
        }
        else
        {
            let storeEmpVC = self.storyboard?.instantiateViewController(withIdentifier: "storeEmpVC") as! StoreEmptyViewController
            let storeid =  storeDic["store_id"] as! Int
            storeEmpVC.store_ID = storeid
            let title = storeDic["title"] as! String
            storeEmpVC.store_Title = title
            storeEmpVC.single_Store = false
            self.navigationController?.pushViewController(storeEmpVC, animated: true)
            
        }

        
    }
}
