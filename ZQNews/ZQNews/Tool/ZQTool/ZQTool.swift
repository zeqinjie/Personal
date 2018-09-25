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
}
