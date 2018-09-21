//
//  MainTabBarViewController.swift
//  ZQNews
//
//  Created by 郑泽钦 on 2018/9/15.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//


import RAMAnimatedTabBarController

class ZQMainTabBarViewController: RAMAnimatedTabBarController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        creatChildVCS()
        super.viewDidLoad()
    }

    
}
    
extension ZQMainTabBarViewController {
    // MARK: - <##>Pirvate Method
    private func creatChildVCS(){
        //首页
        addChildVC(childVC: ZQHomeViewController(), title: "首页", image: UIImage(imageLiteralResourceName: "home"), selecteImage: UIImage(named: "home_sel"))
        //News
        addChildVC(childVC: ZQNewsViewController(), title: "新闻", image: UIImage(imageLiteralResourceName: "news"), selecteImage: UIImage(named: "news_sel"))
        //我的
        addChildVC(childVC: ZQMineViewController(), title: "我的", image: UIImage(imageLiteralResourceName: "user"), selecteImage: UIImage(named: "user_sel"))
        //设置
        addChildVC(childVC: ZQSettingViewController(), title: "设置", image: UIImage(imageLiteralResourceName: "settings"), selecteImage: UIImage(named: "settings_sel"))
    }
    
    ///添加一个控制器
    private func addChildVC(childVC: UIViewController, title: String?, image: UIImage?, selecteImage: UIImage?) {
        
        //1.添加子控制器
        let navVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navVC)
        //2.添加标题
        let item = RAMAnimatedTabBarItem(title: title, image: image, selectedImage: selecteImage)
        let animation = RAMBounceAnimation()
        item.animation = animation
        itemColor(unselColor: ZQColor_888888!, selColor: ZQColor_ff4000!, item: item, animation: animation)
        navVC.tabBarItem = item
    }
    
    private func itemColor(unselColor:UIColor,selColor:UIColor,item:RAMAnimatedTabBarItem,animation:RAMItemAnimation){
        item.textColor = unselColor
        item.iconColor = unselColor
        animation.iconSelectedColor = selColor
        animation.textSelectedColor = selColor
    }
}
