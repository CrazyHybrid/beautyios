//
//  DBHelper.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit
import SQLite

typealias Notification = (
    id: Int64?,
    notificationid: Int64?,
    title: String?,
    description: String?,
    thumbnail: String?,
    url: String?,
    notificationtype: String?,
    notificationdate: String?,
    notificationtimestamp: Int64?
)

class DBHelper {
    
    static let notificationsTbl = Table("notification")
    static let idField = Expression<Int64>("id")
    static let notificationidField = Expression<Int64?>("notificationid")
    static let titleField = Expression<String>("title")
    static let descriptionField = Expression<String>("description")
    static let thumbnailField = Expression<String>("thumbnail")
    static let urlField = Expression<String>("url")
    static let notificationtypeField = Expression<String>("notificationtype")
    static let notificationdateField = Expression<String>("notificationdate")
    static let notificationtimestampField = Expression<Int64>("notificationtimestamp")
    
    typealias T = Notification
    
    static func createTable() throws {
        let db = try Connection("mielnotifications.sqlite3")
        
        try db.run(notificationsTbl.create { t in
            t.column(idField, primaryKey: true)
            t.column(notificationidField)
            t.column(titleField)
            t.column(descriptionField)
            t.column(thumbnailField)
            t.column(urlField)
            t.column(notificationtypeField)
            t.column(notificationdateField)
            t.column(notificationtimestampField)
        })
        
        
    }
    
    static func insertNotification(notificationid: Int64, title: String, description: String, thumbnail: String, url: String, notificationtype: String, notificationdate: String, notificationtimestamp: Int64) throws -> Int64 {
        
        let db = try Connection("mielnotifications.sqlite3")
        
        let insert = notificationsTbl.insert(notificationidField <- notificationid, titleField <- title, descriptionField <- description, thumbnailField <- thumbnail, urlField <- url, notificationtypeField <- notificationtype, notificationdateField <- notificationdate, notificationtimestampField <- notificationtimestamp)
        let rowId = try db.run(insert)
        return rowId
    }
    
    static func find(id: Int64) throws -> T? {
        let db = try Connection("mielnotifications.sqlite3")
        
        let query = notificationsTbl.filter(idField == id)
        let items = try db.prepare(query)
        for item in  items {
            return Notification(id: item[idField], notificationid: item[notificationidField], title: item[titleField], description: item[descriptionField], thumbnail: item[thumbnailField], url: item[urlField], notificationtype: item[notificationtypeField], notificationdate: item[notificationdateField], notificationtimestamp: item[notificationtimestampField])
        }
        
        return nil
        
    }
    
    static func findAll() throws -> [T]? {
        let db = try Connection("mielnotifications.sqlite3")
        let items = try db.prepare(notificationsTbl)
        for item in items {
            // retArray.append(Team(teamId: item[teamId], city: item[city], nickName: item[nickName], abbreviation: item[abbreviation]))
        }
        
        // return retArray
        return nil
    }
    
    static func findNumUnread() throws -> Int {
        let db = try Connection("mielnotifications.sqlite3")
        
        // return db.scalar(notificationsTbl.count)
        return 0
    }
}
