//
//  ChatMessage.swift
//  beautyios
//
//  Created by Michael on 6/23/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation


class ChatMessage{
    
    
    static let ID = "id"
    static let MOBILEUSERID = "MobileUserId"
    static let STOREID = "StoreId"
    static let INPUTTERNAME = "inputter_name"
    static let MESSAGE = "message"
    static let MESSAGETYPE = "messagetype"
    static let SEND_OR_RECEIVE = "send_or_receive"
    static let ISREAD = "is_read"
    static let CREATED = "created"
    static let MODIFIED = "modified"
    static let STATUS = "status"
    
    var id = 0
    var MobileUserId = 0
    var StoreId = 0
    var inputter_name = ""
    var message = ""
    var messagetype = 0
    var send_or_receive = false
    var is_read = false
    var created = ""
    var modified = ""
    var status = 0
    
    static func getChatMessage(_ dict: [String:Any]) -> ChatMessage? {
        let chatMessage = ChatMessage()
     
        chatMessage.id = getIntValue(ID, dict)
        chatMessage.MobileUserId = getIntValue(MOBILEUSERID, dict)
        chatMessage.StoreId = getIntValue(STOREID, dict)
        chatMessage.inputter_name = getStringValue(INPUTTERNAME, dict)
        chatMessage.message = getStringValue(MESSAGE, dict)
        chatMessage.messagetype = getIntValue(MESSAGETYPE, dict)
        chatMessage.send_or_receive = getBoolValue(SEND_OR_RECEIVE, dict)
        chatMessage.is_read = getBoolValue(ISREAD, dict)
        chatMessage.created = getStringValue(CREATED, dict)
        chatMessage.modified = getStringValue(MODIFIED, dict)
        chatMessage.status = getIntValue(STATUS, dict)
        
        return chatMessage
    }
    
}
