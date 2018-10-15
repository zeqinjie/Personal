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
    
    
    class func layoutImageView(imageView:UIImageView,contentView:UIView,padding:CGFloat) {
        guard imageView.image != nil else { return }
        var viewFrame = contentView.frame
        viewFrame.size.width -= (padding * 2.0)
        viewFrame.size.height -= ((padding * 2.0))
        
        var imageFrame = CGRect.zero
        imageFrame.size = imageView.image!.size;
        
        if imageView.image!.size.width > viewFrame.size.width
            || imageView.image!.size.height > viewFrame.size.height {
            let scale = min(viewFrame.size.width / imageFrame.size.width, viewFrame.size.height / imageFrame.size.height)
            imageFrame.size.width *= scale
            imageFrame.size.height *= scale
            imageFrame.origin.x = (contentView.frame.size.width - imageFrame.size.width) * 0.5
            imageFrame.origin.y = (contentView.frame.size.height - imageFrame.size.height) * 0.5
            imageView.frame = imageFrame
        }
        else {
            imageView.frame = imageFrame;
            imageView.center = CGPoint(x: contentView.frame.midX, y: contentView.frame.midY)
        }
    }
}
