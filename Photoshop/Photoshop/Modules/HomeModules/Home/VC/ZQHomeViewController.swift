//
//  HomeViewController.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/18.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQHomeViewController: BaseViewController {

    @IBOutlet weak var chooseBtn: UIButton!
    
    // MARK: - Override <##>
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
    }
    
    override func defaultSet() {
        super.defaultSet()
        self.isHideNavigationBar = true
    }
    
    // MARK: - Action
    @IBAction func chooseAction(_ sender: UIButton) {
        
    }
}

extension ZQHomeViewController {
    fileprivate func creatUI() {
        self.chooseBtn.layer.borderColor = ZQColor_563885?.cgColor
        self.chooseBtn.layer.cornerRadius = 0.5 * self.chooseBtn.frame.width
        self.chooseBtn.layer.borderWidth = 8
    }
}

