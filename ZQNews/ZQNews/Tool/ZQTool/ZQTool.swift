//
//  ZQTool.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/20.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit
import KeychainAccess
class ZQTool: NSObject {
    
    
    /// 用户唯一uuid
    ///
    /// - Returns: uuid
    class func uniqueUUIDCode() -> String {
        let key = "uniqueUUIDCode"
        var uniqueUUIDCode = ""
        let keychain = Keychain(accessGroup: "com.ZQNews")
        let uuid = keychain[string: key]
        if let uuid = uuid {
            uniqueUUIDCode = uuid
        }else {
            keychain[string: key] = uuidDevice()
            uniqueUUIDCode = uuidDevice()
        }
        return uniqueUUIDCode
    }
    
    
    /// 设备uuid
    ///
    /// - Returns: uuid
    class func uuidDevice() -> String {
        var uuidString = UIDevice.current.identifierForVendor?.uuidString
        uuidString = uuidString?.replacingOccurrences(of: "-", with: "")
        guard let uuid = uuidString else { return "" }
        return uuid
    }
    
    
    /// 通過storyboardName 獲取 vc
    ///
    /// - Parameters:
    ///   - storyboardName: 故事版名稱
    ///   - identifier: vc id
    /// - Returns: vc
    class func instantiateVC<T>(_ storyboardName:String,_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)
        let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: storyboardID) as? T {
            return vc
        } else {
            return nil
        }
        
    }
}
