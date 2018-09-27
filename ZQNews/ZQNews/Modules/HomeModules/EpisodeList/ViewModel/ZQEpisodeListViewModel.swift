//
//  ZQEpisodeListViewModel.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/25.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQEpisodeListViewModel: BaseViewModel {
    
    var episodeListModels:[ZQEpisodeListModel]?
    
    // MARK: - API
    
    ///   获取段子
    /// - Parameters:
    ///   - page: page=1:页码
    ///   - type: type=1 : 全部 type=2 : 文字 type=3 : 图片 type=4 : gif type=5 : 视频
    func getEpisodeData(page:Int,type:Int,successBlock:@escaping SuccessJSONBlock,failBlock:@escaping FailBlock)  {
        self.netWorkTool.requestDataWithTargetJSON(target: ZQEpisodeListApiTarget.satin(type: type, page: page), successClosure: { [weak self] (json) in
            DLog("json = \(json)")
            guard let dic = json.dictionaryObject else { return }
            let model = ZQEpisodeListResultModel.deserialize(from: dic)
            if model?.code == 200 {
                self?.updataBlock?()
                successBlock(json)
            }else{
                failBlock(model?.msg)
            }
        }) { (fail) in
            failBlock(fail)
        }
    }
    
    
    
    
}
