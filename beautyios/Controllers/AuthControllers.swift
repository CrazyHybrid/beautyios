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
    
    static func oauthToken(_ username: String, _ password: String, _success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        
        let url = getRequestUrl(oauthToken)
        let params = [USER_PARAM_USERNAME: username,
                      USER_PARAM_PASSWORD: password,
                      USER_GRANT_TYPE: "password"]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, _success, failure)
        }
    }
    
    static func login(_ onesignalid: String, _ pushtoken: String, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(logIn)
        let params = [AUTHORIZATION:pado_token,
                      ONESIGNAL_ID: onesignalid,
                      ONESIGNAL_TOKEN: pushtoken]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    static func logout(_ token: String, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(enroll)
        let params = [AUTHORIZATION: pado_token]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }

    static func accountRegister(_ realname: String, _ email: String, _ password: String, _ password_confirm: String, _ birthday: String, _ gender: Int, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(accountRegister)
        let params = [USER_PARAM_REALNAME: realname,
                      USER_PARAM_EMAIL: email,
                      USER_PARAM_PASSWORD: password,
                      USER_PARAM_PASSWORD_CONFIRM: password_confirm,
                      USER_PARAM_BIRTHDAY: birthday,
                      USER_PARAM_GENDER:gender] as [String : Any]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    static func enroll(_ storeId: Int, _ customerId: Int, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(enroll)
        let params = [STORE_ID:storeId,
                      CUSTOMER_ID: customerId] as [String : Any]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    static func forgotPassword(_ email: String, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(forgotPassword)
        let params = [USER_PARAM_EMAIL: email]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
}
