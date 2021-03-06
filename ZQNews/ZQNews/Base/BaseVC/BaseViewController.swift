//
//  BaseViewController.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/18.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSet()
    }
    
    //MARK: - Setter && Getter
    
    //MARK: - UI
    
    //MARK: - API
    
    //MARK: - IBAction
    
    //MARK: - Override Method
    
    //MARK: - Private Method
    
    //MARK: - Public Method
    func defaultSet() {
        view.backgroundColor = ZQColor_ffffff
    }
    
    func setAutomaticallyAdjustsScrollView(_ scrollView: UIScrollView?) {
        if #available(iOS 11.0, *) {
            if scrollView != nil {
                scrollView?.contentInsetAdjustmentBehavior = .never
            }
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    //MARK: - KVO
    
    //MARK: - NSNotifaction
    



}
