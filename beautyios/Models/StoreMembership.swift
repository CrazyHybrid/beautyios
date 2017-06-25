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
    
    
    var id = 0
    var store_id = 0
    var customer_id = 0
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
    var credits = 0
    var creditexpiration : NSArray? = nil
    var complimentary_credits : NSArray? = nil
    var complimentary_creditexpiration : NSArray? = nil
    var stamps = ""
    var stampdesc = ""
    var photo1 = ""
    var photo2 = ""
    var photo3 = ""
    var photo4 = ""
    var photo5 = ""
    var storetype = ""
    var referraldescription = ""
    var numsurveys = 0
    var stampcards : NSArray? = nil
    var tickets : NSArray? = nil
    var promotions : NSArray? = nil
    var posts : NSArray? = nil
    var upcomingAppointments : NSArray? = nil
    var reviewableAppointments : NSArray? = nil
    
    static func getStoreMembership(_ dict: [String:Any]) -> StoreMembership? {
        let storeMembership = StoreMembership()
       
        storeMembership.id = getIntValue(ID, dict)
        storeMembership.store_id = getIntValue(STORE_ID, dict)
        storeMembership.customer_id = getIntValue(CUSTOMER_ID, dict)
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
        storeMembership.credits = getIntValue(CREDITS, dict)
        storeMembership.creditexpiration = getArrayValue(CREDIT_EXPIR, dict)! as NSArray
        storeMembership.complimentary_credits = getArrayValue(COMP_CREDITS, dict)! as NSArray
        storeMembership.complimentary_creditexpiration = getArrayValue(COMP_CREDIT_EXPIR, dict)! as NSArray
        storeMembership.stamps = getStringValue(STAMPS, dict)
        storeMembership.stampdesc = getStringValue(STAMPDESC, dict)
        storeMembership.photo1 = getStringValue(PHOTO1, dict)
        storeMembership.photo2 = getStringValue(PHOTO2, dict)
        storeMembership.photo3 = getStringValue(PHOTO3, dict)
        storeMembership.photo4 = getStringValue(PHOTO4, dict)
        storeMembership.photo5 = getStringValue(PHOTO5, dict)
        storeMembership.storetype = getStringValue(STORE_TYPE, dict)
        storeMembership.referraldescription = getStringValue(REF_DESC, dict)
        storeMembership.numsurveys = getIntValue(NUM_SURVEYS, dict)
        storeMembership.stampcards = getArrayValue(STAMP_CARD, dict)! as NSArray
        storeMembership.tickets = getArrayValue(TICKETS, dict)! as NSArray
        storeMembership.promotions = getArrayValue(PROMOTIONS, dict)! as NSArray
        storeMembership.posts = getArrayValue(POSTS, dict)! as NSArray
        storeMembership.upcomingAppointments = getArrayValue(UPCOM_APPOINTMENTS, dict)! as NSArray
        storeMembership.reviewableAppointments = getArrayValue(REVIEW_APPOINTMENTS, dict)! as NSArray

        return storeMembership
    }
    
}

class Ticket {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getTicket(_ key: String, _ dict: [String:Any]) -> Ticket? {
        let ticket = Ticket()
        ticket.id = getIntValue(ID, dict)
        ticket.title = getStringValue(TITLE, dict)
        ticket.expiredate = getStringValue(EXPIREDATE, dict)
        ticket.qty = getIntValue(QTY, dict)
        ticket.type = getIntValue(TICKETTYPE, dict)
        ticket.status = getIntValue(STATUS, dict)
        
        return ticket
    }
}

class Post {
    static let ID = "id"
    static let TITLE = "title"
    static let AUTHOR = "author"
    static let TEASER = "teaser"
    static let THUMBNAIL = "thumbnail"
    static let MEDIACONTENT = "mediaContent"
    static let POSTDATE = "postDate"
    static let POSTTYPE = "postType"
    static let STATUS = "status"
    static let CREATED = "created"
    static let MODIFIED = "modified"
    
    var id = 0
    var title = ""
    var author = ""
    var teaser = ""
    var thumbnail = ""
    var mediacontent = ""
    var postdate = ""
    var posttype = 0
    var status = 0
    var created = ""
    var modified = ""
    
    static func getPost( _ key: String, _ dict: [String:Any]) -> Post? {
        let post = Post()
        post.id = getIntValue(ID, dict)
        post.title = getStringValue(TITLE, dict)
        post.author = getStringValue(AUTHOR, dict)
        post.teaser = getStringValue(TEASER, dict)
        post.thumbnail = getStringValue(THUMBNAIL, dict)
        post.mediacontent = getStringValue(MEDIACONTENT, dict)
        post.postdate = getStringValue(POSTDATE, dict)
        post.posttype = getIntValue(POSTTYPE, dict)
        post.status = getIntValue(STATUS, dict)
        post.created = getStringValue(CREATED, dict)
        post.modified = getStringValue(MODIFIED, dict)
        
        return post
    }
}

class Promotion {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getPromotion(_ key: String, _ dict: [String:Any]) -> Promotion? {
        let promotion = Promotion()
        promotion.id = getIntValue(ID, dict)
        promotion.title = getStringValue(TITLE, dict)
        promotion.expiredate = getStringValue(EXPIREDATE, dict)
        promotion.qty = getIntValue(QTY, dict)
        promotion.type = getIntValue(TICKETTYPE, dict)
        promotion.status = getIntValue(STATUS, dict)
        
        return promotion
    }
}

class StampCard {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getStampCard(_ key: String, _ dict: [String:Any]) -> StampCard? {
        let stampcard = StampCard()
        stampcard.id = getIntValue(ID, dict)
        stampcard.title = getStringValue(TITLE, dict)
        stampcard.expiredate = getStringValue(EXPIREDATE, dict)
        stampcard.qty = getIntValue(QTY, dict)
        stampcard.type = getIntValue(TICKETTYPE, dict)
        stampcard.status = getIntValue(STATUS, dict)
        
        return stampcard
    }
}

class CreditExpire {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getCreditExpire(_ key: String, _ dict: [String:Any]) -> CreditExpire? {
        let ticket = CreditExpire()
        ticket.id = getIntValue(ID, dict)
        ticket.title = getStringValue(TITLE, dict)
        ticket.expiredate = getStringValue(EXPIREDATE, dict)
        ticket.qty = getIntValue(QTY, dict)
        ticket.type = getIntValue(TICKETTYPE, dict)
        ticket.status = getIntValue(STATUS, dict)
        
        return ticket
    }
}

class CompCredit {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getCompCredit(_ key: String, _ dict: [String:Any]) -> CompCredit? {
        let ticket = CompCredit()
        ticket.id = getIntValue(ID, dict)
        ticket.title = getStringValue(TITLE, dict)
        ticket.expiredate = getStringValue(EXPIREDATE, dict)
        ticket.qty = getIntValue(QTY, dict)
        ticket.type = getIntValue(TICKETTYPE, dict)
        ticket.status = getIntValue(STATUS, dict)
        
        return ticket
    }
}

class CompCreditExpire {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getCompCreditExpire(_ key: String, _ dict: [String:Any]) -> CompCreditExpire? {
        let ticket = CompCreditExpire()
        ticket.id = getIntValue(ID, dict)
        ticket.title = getStringValue(TITLE, dict)
        ticket.expiredate = getStringValue(EXPIREDATE, dict)
        ticket.qty = getIntValue(QTY, dict)
        ticket.type = getIntValue(TICKETTYPE, dict)
        ticket.status = getIntValue(STATUS, dict)
        
        return ticket
    }
}

class UpcomAppointment {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getUpcomAppointment(_ key: String, _ dict: [String:Any]) -> UpcomAppointment? {
        let ticket = UpcomAppointment()
        ticket.id = getIntValue(ID, dict)
        ticket.title = getStringValue(TITLE, dict)
        ticket.expiredate = getStringValue(EXPIREDATE, dict)
        ticket.qty = getIntValue(QTY, dict)
        ticket.type = getIntValue(TICKETTYPE, dict)
        ticket.status = getIntValue(STATUS, dict)
        
        return ticket
    }
}

class ReviewAppointment {
    static let ID = "id"
    static let TITLE = "title"
    static let EXPIREDATE = "expiredate"
    static let QTY = "qty"
    static let TICKETTYPE = "tickettype"
    static let STATUS = "status"
    
    var id = 0
    var title = ""
    var expiredate = ""
    var qty = 0
    var type = 0
    var status = 0
    
    static func getReviewAppointment(_ key: String, _ dict: [String:Any]) -> ReviewAppointment? {
        let ticket = ReviewAppointment()
        ticket.id = getIntValue(ID, dict)
        ticket.title = getStringValue(TITLE, dict)
        ticket.expiredate = getStringValue(EXPIREDATE, dict)
        ticket.qty = getIntValue(QTY, dict)
        ticket.type = getIntValue(TICKETTYPE, dict)
        ticket.status = getIntValue(STATUS, dict)
        
        return ticket
    }
}
