//
//  ZQCommonHeader.swift
//  house591
//
//  Created by xiwu on 2017/7/21.
//
//

import Foundation
import UIKit


// MARK: ----- 通用-----
// MARK: 设备信息
/// 当前app信息
let ZQAppInfo = Bundle.main.infoDictionary
///// 当前app版本号
let ZQCurrentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

///// 获取设备系统号
let ZQGetSystemVersion = UIDevice.current.systemVersion

//请求时长
let ZQRequestTimeCountOut : Int = 120

// MARK:  尺寸信息

/// 全屏
let ZQScreen = UIScreen.main.bounds
/// 全屏宽度
let ZQScreenWitdh = UIScreen.main.bounds.width
/// 全屏高度，不含状态栏高度
let ZQScreenHeight = UIScreen.main.bounds.height

/// tabbar切换视图控制器高度
let ZQTabbarHeight : CGFloat = 49.0
/// 搜索视图高度
let ZQSearchBarHeight : CGFloat = 45.0

/// 状态栏高度
var ZQStatusBarHeight : CGFloat  {
    get {
        if ZQIsIhoneX() {
            return 44.0
        }else{
            return 20.0
        }
    }
}

//tabbar高度
var ZQTabBarHeight : CGFloat  {
    get {
        if ZQIsIhoneX() {
            return 83.0
        }else{
            return 49.0
        }
    }
}
/// 导航栏高度
let ZQNavigationHeigth : CGFloat = 44.0

/// 状态栏 + 导航栏高度
let ZQStatusAndNavigationHeigth = ZQNavigationHeigth + ZQStatusBarHeight

///IPhoneX 头部
var ZQIPhoneXTopHeigth : CGFloat  {
    get {
        if ZQIsIhoneX() {
            return 30.0
        }else{
            return 0.0
        }
    }
}

///IPhoneX 底部留白
var ZQIPhoneXBottomHeigth : CGFloat  {
    get {
        if ZQIsIhoneX() {
            return 34.0
        }else{
            return 0.0
        }
    }
}



// MARK: ----- 通用-----
//house591AppDelegate
//let ZQDelegateApp  = (UIApplication.shared.delegate as! house591AppDelegate)




/// 打印日志
///
/// - Parameter str: 内容
func DLog(_ str: String) {
    #if DEBUG
    print("file: \(#file), line:\(#line),\(str)")
    #endif
}


func ZQSYSFontSize(_ size: CGFloat)->UIFont{
    return UIFont.systemFont(ofSize: size)
}

func ZQBoldFontSize(_ size: CGFloat)->UIFont{
    return UIFont.boldSystemFont(ofSize: size)
}

/// 处理数据Number 或者 String统一返回String
///
/// - Parameter str: 接收string 或者 number类型
/// - Returns: 返回结果String
func ZQGuardValueString(_ str:Any?) -> String {
    var result = ""
    if str is String {
        result = str as! String
    }else if(str is NSNumber){
        let number:NSNumber = str as! NSNumber
        result = number.stringValue
    }
    return result
}


///  字符串 1 或者 number 1时候转bool true
///
/// - Parameter str: 接收string 或者 number类型
/// - Returns: 返回结果bool
func ZQStringToBool(_ str:Any?) -> Bool{
    var result = false
    let string = ZQGuardValueString(str)
    if string == "1" {
        result = true
    }
    return result
}

public func ZQIsIhoneX() -> Bool {
    if UIScreen.main.bounds.height == 812 {
        return true
    }
   
    return false
}


func ZQGuardNullString(_ str:String?) -> String{
    if str == nil {
        return ""
    }
    return str!
}



