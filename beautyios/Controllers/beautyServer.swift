//
//  beautyServer.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ZiggeoSwiftFramework

class beautyServer {
    static let RESPONSE_SUCCESS = "ok"
    static let RESPONSE_FAILURE = "error"
    static let RESPONSE_INVALID = "Invalid Response"
    
    static let serverUrl = "http://pastelapitest.mypado.com"
    
    static let pado_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1laWQiOiI3MjgiLCJ1bmlxdWVfbmFtZSI6InBhcmtldWdAeWFob28uY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS9hY2Nlc3Njb250cm9sc2VydmljZS8yMDEwLzA3L2NsYWltcy9pZGVudGl0eXByb3ZpZGVyIjoiQVNQLk5FVCBJZGVudGl0eSIsIkFzcE5ldC5JZGVudGl0eS5TZWN1cml0eVN0YW1wIjoiNDc3MzcwYTEtNGUzOC00MTg0LTliYTYtMjhhZDljMGY3YWU1Iiwicm9sZSI6IlVzZXIiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjU5ODIyIiwiYXVkIjoiNDE0ZTE5MjdhMzg4NGY2OGFiYzc5ZjcyODM4MzdmZDEiLCJleHAiOjE0OTg5OTk2NDEsIm5iZiI6MTQ5NjQwNzY0MX0.AyLqDkPN_rKxy97vDSj06X4gBI4uwXrbFvPC19jWMdo"
    
    
    //Auth
    static let enroll = "/api/accounts/enroll"
    static let accountRegister = "/api/accounts/register_user"
    static let forgotPassword = "/api/accounts/forgotpassword"
    static let oauthTokenUrl = "/oauth/token"
    static let logIn = "/api/accounts/log_in"
    static let logOut = "/api/accounts/log_out"
    
    //Store
    static let getStoreMemberships = "/api/store/getstorememberships"
    static let getStoreMembership = "/api/store/getstoremembership/"
    static let getStoreServices = "/api/appointment/getstoreservices"
    static let getStoreSchedules = "/api/appointment/getstoreschedules"
    
    //AppointMent
    static let getPastAppointments = "/api/appointment/getpastappointments"
    static let getCanceledAppointments = "/api/appointment/getcanceledappointments"
    static let createStoreAppointment = "/api/appointment/createappointment"
    static let cancelAppointment = "/api/appointment/cancelappointment"
    static let editAppointment = "/api/appointment/editappointment"
    
    //Diary
    static let getDiaryAlertSetting = "/api/store/getdiaryalertsetting"
    static let setDiaryAlertSetting = "/api/store/setdiaryalertsetting"
    static let getDiaryEntries = "/api/diary/getdiaryentries"
    static let createDiaryEntry = "/api/diary/creatediaryentry"
    static let editDiaryEntry = "/api/diary/editdiaryentry"
    static let deleteDiaryEntry = "/api/diary/deletediaryentry"
    
    //Message
    static let getChatMessages = "/api/chat/getchatmessages"
    static let sendChatMessage = "/api/chat/sendchatmessage"
    
    //Other
    static let submitReview = "/api/appointment/reviewappointment"
    static let getCreditLog = "/api/store/getcreditlogrequest"
    static let getFreeCreditLog = "/api/store/getcreditlogrequest"
    static let getTicketLog = "/api/store/getticketlogrequest"
    static let createReferee = "/api/customers/createreferee"
    
    //Survey
    static let getCustomerSurveys = "/api/customersurvey/getcustomersurveys"
    static let answerCustomerSurvey = "/api/customersurvey/answercustomersurvey"
    
    
    
    
    static let requestFBConnect = "user/fb_connect"
    static let requestGetUserInfo = "userplus/get_userinfo"
    static let requestRetrievePassword = "userplus/retrieve_password"
    
    static let requestActivities = "userplus/following_activities"
    static let requestPostVideo = "userplus/activities_post_update"
    static let requestAddPost = "add_post"
    
    static let RES_KEY_STATUS = "status"
    static let RES_KEY_ERROR = "error"
    
    static let USER_PARAM_KEY = "key"
    
    static let USER_PARAM_USERNAME = "username"
    static let USER_PARAM_PASSWORD = "password"
    static let USER_GRANT_TYPE = "grant_type"
    
    static let AUTHORIZATION = "Authorization"
    static let ONESIGNAL_ID = "OneSignalId"
    static let ONESIGNAL_TOKEN = "PushToken"
    
    static let STORE_ID = "store_id"
    static let CUSTOMER_ID = "customer_id"
    
    static let PADO_USERNAME = "pado-username"
    static let PADO_PASSWORD = "pado-password"
    
    static let USER_PARAM_REALNAME = "RealName"
    static let USER_PARAM_EMAIL = "email"
    static let USER_PARAM_PASSWORD_CONFIRM = "confirmpassword"
    static let USER_PARAM_BIRTHDAY = "Birthday"
    static let USER_PARAM_GENDER = "Gender"
    
    static let TIMESTAMP = "timestamp"
    
    static let PARAM_TYPE = "type"
    static let PARAM_COMMENTS = "comments"
    static let PARAM_LIMIT = "limit"
    static let PARAM_FOLLOWING = "following"
    static let PARAM_SCOPE = "scope"
    static let PARAM_PAGE = "page"
    static let PARAM_FIELD = "field"
    static let PARAM_ACTIVITY_ID = "activity_id"
    
    static let PARAM_SORT = "sort"
    static let PARAM_PRIMARY_ID = "primary_id"
    static let PARAM_SECONDARY_ID = "secondary_id"
    
    
    static let kLimitNumber = 15
    static let kTrendType = "activity_update,Member_review"
    static let kScope = "just-me,mentions"
    static let kUserDetailsField = "Bio,Website,Address,interest"
    
    static let kCommentsType = "activity_comment"
    
    // Ziggeo
    static let ZIGGEO_APP_TOKEN = "ddd4366d3fc0baef95c333fa575c53f9"
    
    
    static func getRequestUrl(_ request: String) -> String {
        return "\(serverUrl)\(request)"
    }
    
    static func completion(_ response: DataResponse<Any>, _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        switch response.result {
        case .success(let value):
            //            print(value)
            guard let dict = value as? Dictionary<String, Any>,
                let status = dict[RES_KEY_STATUS] as? String else {
                    failure(RESPONSE_INVALID)
                    return
            }
            
            if status == RESPONSE_SUCCESS {
                success(dict)
            }
            else if let error = dict[RES_KEY_ERROR] as? String {
                print(error)
                failure(error)
            }
            else {
                failure(RESPONSE_INVALID)
            }
            break
        case .failure(let error):
            print(error)
            failure(error.localizedDescription)
        }
    }
    
    static func post(_ request: String, _ params: [String: Any],  _ success: @escaping ([String:Any]) -> Void, _ failure: @escaping(String) -> Void) {
        Alamofire.request(URL(string:getRequestUrl(request))!,
                          method: .post,
                          parameters: params)
            .responseJSON { (response) in
                completion(response, success, failure)
        }
    }
    
    fileprivate static var ziggeo: Ziggeo! = nil
    static func getZiggeo() -> Ziggeo {
        if ziggeo == nil {
            ziggeo = Ziggeo(token: ZIGGEO_APP_TOKEN)
        }
        return ziggeo
    }
}
