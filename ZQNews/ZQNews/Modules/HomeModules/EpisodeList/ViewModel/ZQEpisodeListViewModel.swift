//
//  ZQEpisodeListViewModel.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/25.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQEpisodeListViewModel: BaseViewModel {
    
    
    
    // MARK: - API
    
    ///   获取段子
    /// - Parameters:
    ///   - page: page=1:页码
    ///   - type: type=1 : 全部 type=2 : 文字 type=3 : 图片 type=4 : gif type=5 : 视频
    func getEpisodeData(page:Int,type:Int,successBlock:@escaping ZQSuccessBlock,failBlock:@escaping ZQFailBlock)  {
        self.netWorkTool.requestDataWithTargetModelJSON(target: ZQEpisodeListApiTarget.satin(type: type, page: page), model: ZQEpisodeListResultModel.self, successClosure: { (model) in
            if let m = model as? ZQEpisodeListResultModel{
                if m.code == 200 {
                    successBlock(m)
                }else{
                    failBlock(m.msg)
                }
            }else{
                failBlock("")
            }
            
        }) { (fail) in
            failBlock(fail)
        }
    }
    
    
}
