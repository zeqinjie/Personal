//
//  EpisodeListViewController.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/21.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQEpisodeListViewController: BaseViewController {
    
    var viewModel = ZQEpisodeListViewModel()
    var dataSourece = [ZQEpisodeListModel]()
    var page = 1
    var type = 1
    
    @IBOutlet weak var tableView: ZQRefreshTableView?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        // Do any additional setup after loading the view.
        loadFirstData()
    }

    
    //MARK: - Setter && Getter
    
    
    //MARK: - API
    fileprivate func loadData() {
        viewModel.getEpisodeData(page: self.page, type: self.type, successBlock: { (json) in
            
        }, failBlock: { (fail) in
        
        })
    }
    
    //MARK: - IBAction
    
    //MARK: - Override Method
    
    //MARK: - Private Method
    fileprivate func loadFirstData()  {
        self.page = 1
        self.loadData()
    }
    
    
    //MARK: - Public Method
    func refreshHeaderData(tableView:ZQRefreshTableView)  {
        
    }
    //MARK: - KVO
    
    //MARK: - NSNotifaction

}

// MARK: - UI
extension ZQEpisodeListViewController{
    @objc func creatUI()  {
        self.tableView?.loadMoreBlock = {
            (tableView) in
            self.page += 1
            self.loadData()
        }
    }
}

// MARK: - UITableViewDataSource && UITableViewDataSource
extension ZQEpisodeListViewController:UITableViewDelegate, UITableViewDataSource{
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataSourece.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let model = dataSourece[indexPath.row]
        let cell:ZQEpisodeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier(), for: indexPath) as! ZQEpisodeListTableViewCell
        
        
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        let model = dataSourece[indexPath.row]
        return model.cellIdHeigth()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = dataSourece[indexPath.row]
//        tableView.reloadRows(at: [indexPath], with: .none)
//    }
}


