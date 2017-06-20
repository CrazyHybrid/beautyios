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
                    completion(response.result as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
    static func getStoreMembership(_ username: String, _ password: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        
        let url = getRequestUrl(oauthTokenUrl)
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let body: Parameters = [
            USER_PARAM_USERNAME: username,
            USER_PARAM_PASSWORD: password,
            USER_GRANT_TYPE: "password"
            
        ]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    completion(response.result.value as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
}
