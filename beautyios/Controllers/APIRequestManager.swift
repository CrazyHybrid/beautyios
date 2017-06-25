//
//  APIRequestManager.swift
//  beautyios
//
//  Created by Michael on 6/20/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequestManager: beautyServer {
    

    static func getStoreMembershipsAPI(_ token: String, _ timestamp: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        
        let url = getRequestUrl(getStoreMemberships)
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            AUTHORIZATION: "Bearer " + token
        ]
        
        let body: Parameters = [
            TIMESTAMP: timestamp
        ]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    completion(response.data as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
    static func getStoreMembershipAPI(_ storeId: Int, _ token: String, _ timestamp: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        
        let url = getRequestUrl(getStoreMembership) + String(storeId)
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            AUTHORIZATION: "Bearer " + token
        ]
        
        let body: Parameters = [
            TIMESTAMP: timestamp
        ]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    completion(response.data as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
}
