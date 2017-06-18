//
//  beautyObject.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class beautyObject {
    static func hasMoreItems(_ dict: Dictionary<String, Any>) -> Bool {
        if let value = dict["has_more_items"] as? Bool {
            return value
        }
        else {
            print(getNoKeyString("has_more_items"))
        }
        return false
    }
}

func getNoKeyString(_ key: String) -> String {
    return "There is no key \(key)."
}

func getStringValue(_ key: String, _ dict: Dictionary<String, Any>) -> String {
    if let value = dict[key] as? String {
        return value
    }
    else {
        print(getNoKeyString(key))
    }
    return ""
}

func getIntValue(_ key: String, _ dict: Dictionary<String, Any>) -> Int {
    if let value = dict[key] as? Int {
        return value
    }
    else {
        print(getNoKeyString(key))
    }
    return -1
}

func getBoolValue(_ key: String, _ dict: Dictionary<String, Any>) -> Bool {
    if let value = dict[key] as? Bool {
        return value
    }
    else {
        print(getNoKeyString(key))
    }
    return false
}

func getDateValue(_ key: String, _ dict: Dictionary<String, Any>) -> Date? {
    if let value = dict[key] as? String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: value)!
    }
    else {
        print(getNoKeyString(key))
    }
    return nil
}

func getDictionayValue(_ key: String, _ dict: Dictionary<String, Any>) -> Dictionary<String, Any>? {
    if let value = dict[key] as? Dictionary<String, Any> {
        return value
    }
    else {
        print(getNoKeyString(key))
    }
    return nil
}

func getArrayValue(_ key: String, _ dict: Dictionary<String, Any>) -> Array<Dictionary<String, Any>>? {
    if let value = dict[key] as? Array<Dictionary<String, Any>> {
        return value
    }
    else {
        print(getNoKeyString(key))
    }
    return nil
}

func getArrayString(_ key: String, _ dict: Dictionary<String, Any>) -> String {
    if let value = dict[key] as? String {
        return value
    }
    else if let value = dict[key] as? Array<String> {
        return value.joined(separator: ", ")
    }
    else {
        print(getNoKeyString(key))
    }
    return ""
}
