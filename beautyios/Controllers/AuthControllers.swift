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
    static func login(_ user: String, _ password: String, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(requestGenerateAuthCookie)
        let params = [USER_PARAM_KEY:szzwhoKey,
                      USER_PARAM_USERNAME: user,
                      USER_PARAM_PASSWORD: password]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    static func loginWithFacebook(_ accessToekn: String, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(requestFBConnect)
        let params = [USER_PARAM_KEY:szzwhoKey,
                      USER_PARAM_FB_ACCESS_TOAKEN: accessToekn,
                      USER_PARAM_INSECURE: "cool"]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    static func getUserInfo(_ userId: Int, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(requestGetUserInfo)
        let params = [USER_PARAM_KEY:szzwhoKey,
                      USER_PARAM_USERID: userId] as [String : Any]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    static func forgotPassword(_ user: String, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        let url = getRequestUrl(requestRetrievePassword)
        let params = [USER_PARAM_KEY:szzwhoKey,
                      USER_PARAM_USER_LOGIN: user]
        
        Alamofire.request(URL(string:url)!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
}
