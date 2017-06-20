//
//  StoreMembership.swift
//  beautyios
//
//  Created by Michael on 6/20/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class StoreMembership{
    
    static let ID = "id"
    static let STORE_ID = "store_id"
    static let CUSTOMER_ID = "customer_id"
    static let TITLE = "title"
    static let LOGO = "logo"
    static let CARDIMAGE = "cardimage"
    static let LAT = "lat"
    static let LON = "lon"
    static let HOURS = "hours"
    static let PHONE = "phone"
    static let ADDRESS = "address"
    static let ADDRESS2 = "address2"
    static let WEBSITE = "website"
    static let CREDITS = "credits"
    static let CREDIT_EXPIR = "creditexpiration"
    static let COMP_CREDITS = "complimentary_credits"
    static let COMP_CREDIT_EXPIR = "complimentary_creditexpiration"
    static let STAMPS = "stamps"
    static let STAMPDESC = "stampdesc"
    static let PHOTO1 = "photo1"
    static let PHOTO2 = "photo2"
    static let PHOTO3 = "photo3"
    static let PHOTO4 = "photo4"
    static let PHOTO5 = "photo5"
    static let STORE_TYPE = "storetype"
    static let REF_DESC = "referraldescription"
    static let NUM_SURVEYS = "numsurveys"
    static let STAMP_CARD = "stampcards"
    static let TICKETS = "tickets"
    static let PROMOTIONS = "promotions"
    static let POSTS = "posts"
    static let UPCOM_APPOINTMENTS = "upcomingAppointments"
    static let REVIEW_APPOINTMENTS = "reviewableAppointments"
    
    
    var id = ""
    var store_id = ""
    var customer_id = ""
    var title = ""
    var logo = ""
    var cardimage = ""
    var lat = ""
    var lon = ""
    var hours = ""
    var phone = ""
    var address = ""
    var address2 = ""
    var website = ""
    var credits = ""
    var creditexpiration = ""
    var complimentary_credits = ""
    var complimentary_creditexpiration = ""
    var stamps = ""
    var stampdesc = ""
    var photo1 = ""
    var photo2 = ""
    var photo3 = ""
    var photo4 = ""
    var photo5 = ""
    var storetype = ""
    var referraldescription = ""
    var numsurveys = ""
    var stampcards = ""
    var tickets = ""
    var promotions = ""
    var posts = ""
    var upcomingAppointments = ""
    var reviewableAppointments = ""
    
    static func getStoreMembership(_ dict: [String:Any]) -> StoreMembership? {
        let storeMembership = StoreMembership()
       
        storeMembership.id = getStringValue(ID, dict)
        storeMembership.store_id = getStringValue(STORE_ID, dict)
        storeMembership.customer_id = getStringValue(CUSTOMER_ID, dict)
        storeMembership.title = getStringValue(TITLE, dict)
        storeMembership.logo = getStringValue(LOGO, dict)
        storeMembership.cardimage = getStringValue(CARDIMAGE, dict)
        storeMembership.lat = getStringValue(LAT, dict)
        storeMembership.lon = getStringValue(LON, dict)
        storeMembership.hours = getStringValue(HOURS, dict)
        storeMembership.phone = getStringValue(PHONE, dict)
        storeMembership.address = getStringValue(ADDRESS, dict)
        storeMembership.address2 = getStringValue(ADDRESS2, dict)
        storeMembership.website = getStringValue(WEBSITE, dict)
        storeMembership.credits = getStringValue(CREDITS, dict)
        storeMembership.creditexpiration = getStringValue(CREDIT_EXPIR, dict)
        storeMembership.complimentary_credits = getStringValue(COMP_CREDITS, dict)
        storeMembership.complimentary_creditexpiration = getStringValue(COMP_CREDIT_EXPIR, dict)
        storeMembership.stamps = getStringValue(STAMPS, dict)
        storeMembership.stampdesc = getStringValue(STAMPDESC, dict)
        storeMembership.photo1 = getStringValue(PHOTO1, dict)
        storeMembership.photo2 = getStringValue(PHOTO2, dict)
        storeMembership.photo3 = getStringValue(PHOTO3, dict)
        storeMembership.photo4 = getStringValue(PHOTO4, dict)
        storeMembership.photo5 = getStringValue(PHOTO5, dict)
        storeMembership.storetype = getStringValue(STORE_TYPE, dict)
        storeMembership.referraldescription = getStringValue(REF_DESC, dict)
        storeMembership.numsurveys = getStringValue(NUM_SURVEYS, dict)
        storeMembership.stampcards = getStringValue(STAMP_CARD, dict)
        storeMembership.tickets = getStringValue(TICKETS, dict)
        storeMembership.promotions = getStringValue(PROMOTIONS, dict)
        storeMembership.posts = getStringValue(POSTS, dict)
        storeMembership.upcomingAppointments = getStringValue(UPCOM_APPOINTMENTS, dict)
        storeMembership.reviewableAppointments = getStringValue(REVIEW_APPOINTMENTS, dict)

        return storeMembership
    }
    
}
