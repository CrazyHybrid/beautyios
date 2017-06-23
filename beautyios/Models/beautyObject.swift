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

enum MessageType {
    case photo
    case text
    case location
}

enum MessageOwner {
    case sender
    case receiver
}

enum PhotoSource {
    case library
    case camera
}

enum ShowExtraView {
    case contacts
    case profile
    case preview
    case map
}

struct GlobalVariables {
    static let blue = UIColor.rbg(r: 129, g: 144, b: 255)
    static let purple = UIColor.rbg(r: 161, g: 114, b: 255)
}

//Extensions
extension UIColor{
    class func rbg(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return color
    }
}

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
