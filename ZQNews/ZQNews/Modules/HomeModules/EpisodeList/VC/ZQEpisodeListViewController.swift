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
    weak var listTableView:ZQRefreshTableView?
    var page = 1
    var type = 1
    
    var dataSource = [ZQEpisodeListModel]()
    @IBOutlet weak var tableView: ZQRefreshTableView?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        // Do any additional setup after loading the view.
        showHud()
        loadFirstPageData(true)
    }

    
    //MARK: - Setter && Getter
    
    
    //MARK: - API
    fileprivate func loadData() {
        viewModel.getEpisodeData(page: self.page, type: self.type, successBlock: {[unowned self] (json) in
            self.hideHud()
            self.endRefresh()
            guard let model = json as? ZQEpisodeListResultModel else {return}
            self.dealData(json: model)
        }, failBlock: { [unowned self] (fail) in
            self.endRefresh()
            self.hideHud()
        })
    }
    
    //MARK: - IBAction
    
    //MARK: - Override Method
    
    //MARK: - Private Method
    func loadFirstPageData(_ showHud:Bool) {
        self.page = 1
        if showHud {
            self.showHud()
        }
        self.loadData()
    }
    
    
    fileprivate func dealData(json:ZQEpisodeListResultModel){
        if self.page == 1 {
            self.dataSource.removeAll()
        }
        guard let arr = json.data else {return}
        self.dataSource += arr
        self.tableView?.reloadData()
    }
    
    func endRefresh(){
        self.tableView?.endRefreshing()
        self.listTableView?.endRefreshing()
    }
    
    //MARK: - Public Method
    func refreshHeaderData(tableView:ZQRefreshTableView)  {
        DLog("refreshHeaderData")
        self.listTableView = tableView
        self.loadFirstPageData(false)
    }


}

// MARK: - UI
extension ZQEpisodeListViewController{
    @objc func creatUI()  {
        creatTableView()
    }
    
    private func creatTableView() {
        self.glt_scrollView = self.tableView
        self.tableView?.tableFooterView = UIView()
        self.setAutomaticallyAdjustsScrollView(self.tableView)
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
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let model = dataSource[indexPath.row]
        let cell:ZQEpisodeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier(), for: indexPath) as! ZQEpisodeListTableViewCell
        cell.model = model
        
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        let model = dataSource[indexPath.row]
        return model.cellIdHeigth()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = dataSourece[indexPath.row]
//        tableView.reloadRows(at: [indexPath], with: .none)
//    }
}


