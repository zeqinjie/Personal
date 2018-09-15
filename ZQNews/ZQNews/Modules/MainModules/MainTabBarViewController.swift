//
//  MainTabBarViewController.swift
//  ZQNews
//
//  Created by 郑泽钦 on 2018/9/15.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//


import RAMAnimatedTabBarController

class MainTabBarViewController: RAMAnimatedTabBarController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    ///添加一个控制器
    private func addOneChildVC(childVC: UIViewController, title: String?, image: UIImage?, selecteImage: UIImage?) {
        
        //1.添加子控制器
        let navVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navVC)
        //2.添加标题
        let item = RAMAnimatedTabBarItem(title: title, image: image, selectedImage: selecteImage)
        
//        let animation = RAMTransitionItemAnimations()
//        animation.iconSelectedColor = UIColor.orange
//        animation.transitionOptions = UIViewAnimationOptions.transitionCurlUp
//        item.animation = animation
        
        
        
        navVC.tabBarItem = item
        
        
    }
}
    

