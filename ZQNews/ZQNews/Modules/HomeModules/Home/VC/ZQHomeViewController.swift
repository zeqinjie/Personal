//
//  HomeViewController.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/18.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQHomeViewController: BaseViewController {

    fileprivate var pageManager:LTSimpleManager?
    fileprivate var listVCS = [ZQEpisodeListViewController]()
    fileprivate var titles:[String] = ["全部","文字","图片","GIF","视频"]
    fileprivate lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.titleColor = UIColor(r: 102, g: 102, b: 102)
        layout.titleSelectColor = UIColor(r: 34, g: 34, b: 34)
        layout.titleViewBgColor = ZQColor_ffffff
        layout.bottomLineColor = ZQColor_ff4400
        layout.isAverage = true
        return layout
    }()
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Setter && Getter
    
    //MARK: - UI
    
    //MARK: - API
    
    //MARK: - IBAction
    
    //MARK: - Override Method
    
    //MARK: - Private Method
    ///上拉重新刷新數據
    func refreshContentListData(_ tableView: ZQRefreshTableView, _ index: Int){
        if self.listVCS.count > index {
            let vc = self.listVCS[index]
            vc.refreshHeaderData(tableView:tableView)
        }
        
    }
    //MARK: - Public Method
    
}

// MARK: - UI
extension ZQHomeViewController {
    func creatUI()  {
        for (index,_) in titles.enumerated() {
            let vc = ZQTool.instantiateVC("HomeModules", ZQEpisodeListViewController.self)
            if let vc = vc {
                vc.type = index + 1
                listVCS.append(vc)
            }
        }
        
        let Y: CGFloat = ZQStatusAndNavigationHeigth
        let H: CGFloat = view.bounds.height - Y - ZQTabBarHeight
        
        pageManager = LTSimpleManager(frame: CGRect(x: 0, y: Y, width: view.bounds.width, height: H), viewControllers: listVCS, titles: titles, currentViewController: self, layout: layout)
        pageManager?.didSelectIndexHandle({ (index) in
            DLog("didSelectIndexHandle = \(index)")
        })
        pageManager?.delegate = self
        guard let pageManager = pageManager else { return }
        self.view.addSubview(pageManager)
    }
    
}


//MARK: LTSimpleScrollViewDelegate
extension ZQHomeViewController: LTSimpleScrollViewDelegate {
    
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int) {
        //注意这里循环引用问题。
        if scrollView is ZQRefreshTableView {
            let tableView:ZQRefreshTableView = scrollView as! ZQRefreshTableView
            tableView.loadNewDataBlock = { [unowned self] (tableView:ZQRefreshTableView?) in
                self.refreshContentListData(tableView!,index)
            }
            
        }
    }
}
