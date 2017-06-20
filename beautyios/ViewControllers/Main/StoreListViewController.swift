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
    
    @IBOutlet weak var storeImage: UIImageView!
    
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
        
        self.getStoreMembership()
    }
    
    @IBAction func OnClickNotification(_ sender: Any) {
    }
    
    @IBAction func OnClickLogoutMenu(_ sender: Any) {
    }
    
    func getStoreMembership()
    {
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        let currentTimeMillis = NSDate().timeIntervalSince1970 * 1000;
        
        let timestamp: String = String(format:"%.f", currentTimeMillis)
        
        APIRequestManager.getStoreMembershipsAPI(padoToken!, timestamp,
                                                 completion: {(response, error) -> Void in
                                                    
                                                    if response != nil {
                                                        
                                                        do{
                                                            let storeJSON = try JSONSerialization.jsonObject(with: (response?.data)!, options: .allowFragments) as? [String: Any]
                                                            
                                                            let store = storeJSON?["storeMemberships"] as? [[String: AnyObject]]
                                                            
                                                            print( store )

                                                            
                                                        }catch{
                                                            print(error)
                                                        }
                                                        
                                                        print( response )
                                                        
                                                        
                                                    }else{
                                                        
                                                    }
        })
    }
}

extension StoreListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.storeTableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreViewCell
        
        return cell
    }
}

extension StoreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.storeTableView.deselectRow(at: indexPath, animated: true)
        
    }
}
