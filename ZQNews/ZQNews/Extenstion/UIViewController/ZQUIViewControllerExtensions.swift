//
//  HideNavigationBar.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/21.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    private struct HideNavigationBar {
        static var tKey = "isHideNavigationBar"
    }
    
    public class func initializeMethod(){
        let originalSelector = #selector(UIViewController.viewDidAppear(_:))
        let swizzledSelector = #selector(UIViewController.hideNav_viewWillAppear(animated:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        //在进行 Swizzling 的时候,需要用 class_addMethod 先进行判断一下原有类中是否有要替换方法的实现
        let didAddMethod: Bool = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))

        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
        
    }
    
    @objc func hideNav_viewWillAppear(animated: Bool) {
        self.hideNav_viewWillAppear(animated: animated)
        self.navigationController?.setNavigationBarHidden(self.isHideNavigationBar, animated: animated)
        DLog("change hideNav_viewWillAppear")
    }
    
    @objc public var isHideNavigationBar: Bool {
        get { return (objc_getAssociatedObject(self, &HideNavigationBar.tKey) as? Bool) ?? false}
        set { objc_setAssociatedObject(self, &HideNavigationBar.tKey, newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }
}





