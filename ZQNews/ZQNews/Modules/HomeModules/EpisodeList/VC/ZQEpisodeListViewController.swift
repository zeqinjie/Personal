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
    
    var page = 1
    var type = 1
    
    @IBOutlet weak var tableView: ZQRefreshTableView?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        // Do any additional setup after loading the view.
        showHud()
        loadFirstData()
    }

    
    //MARK: - Setter && Getter
    
    
    //MARK: - API
    fileprivate func loadData() {
        viewModel.getEpisodeData(page: self.page, type: self.type, ZQSuccessBlock: {[unowned self] (json) in
            self.hideHud()
            guard let model = json as? ZQEpisodeListResultModel else {return}
            self.dealData(json: model)
        }, ZQFailBlock: { [unowned self] (fail) in
            self.hideHud()
        })
    }
    
    //MARK: - IBAction
    
    //MARK: - Override Method
    
    //MARK: - Private Method
    fileprivate func loadFirstData()  {
        self.page = 1
        self.loadData()
    }
    
    
    fileprivate func dealData(json:ZQEpisodeListResultModel){
        
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
        return viewModel.dataSourece.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let model = viewModel.dataSourece[indexPath.row]
        let cell:ZQEpisodeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier(), for: indexPath) as! ZQEpisodeListTableViewCell
        
        
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        let model = viewModel.dataSourece[indexPath.row]
        return model.cellIdHeigth()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = dataSourece[indexPath.row]
//        tableView.reloadRows(at: [indexPath], with: .none)
//    }
}


