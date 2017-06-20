//
//  AuthControllers.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON

class AuthControllers: beautyServer {
    
    static func oauthToken(_ username: String, _ password: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        
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
    
    static func login(_ onesignalid: String, _ pushtoken: String, _ padotoken: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        let url = getRequestUrl(logIn)
        
        let headerParams = [
            "Content-Type": "application/x-www-form-urlencoded",
            AUTHORIZATION: padotoken
        ]
        
        let body : Parameters = [
            ONESIGNAL_ID: onesignalid,
            ONESIGNAL_TOKEN: pushtoken
        ]

        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headerParams)
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    completion(response.result.value as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
    static func logout(_ token: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        let url = getRequestUrl(logOut)
        
        let headerParams = [
            "Content-Type": "application/x-www-form-urlencoded",
            AUTHORIZATION: token
        ]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          headers: headerParams )
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    completion(response.result.value as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }

    static func accountRegister(_ realname: String, _ email: String, _ password: String, _ password_confirm: String, _ birthday: String, _ gender: Int, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        let url = getRequestUrl(accountRegister)
        
        let headerParams = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let body : Parameters = [
            USER_PARAM_REALNAME: realname,
                      USER_PARAM_EMAIL: email,
                      USER_PARAM_PASSWORD: password,
                      USER_PARAM_PASSWORD_CONFIRM: password_confirm,
                      USER_PARAM_BIRTHDAY: birthday,
                      USER_PARAM_GENDER:gender
            ]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headerParams )
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    completion(response.result.value as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
    static func enroll(_ storeId: Int, _ customerId: Int, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        let url = getRequestUrl(enroll)
        
        let headerParams = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        
        let body : Parameters = [
            STORE_ID:storeId,
            CUSTOMER_ID: customerId
        ]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headerParams)
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    completion(response.result.value as AnyObject, nil)
                case .failure(let error):
                    completion(nil, error as NSError )
                }
        }
    }
    
    static func forgotPassword(_ email: String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        let url = getRequestUrl(forgotPassword)
        
        let headerParams = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let body : Parameters = [USER_PARAM_EMAIL: email]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: body,
                          encoding: URLEncoding.httpBody,
                          headers: headerParams)
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
