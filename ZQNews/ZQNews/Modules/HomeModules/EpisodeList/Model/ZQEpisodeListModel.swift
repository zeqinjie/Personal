//
//  ZQEpisodeListModel.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/26.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQEpisodeListModel: BaseModel {
    //1:小图*1，2:小图*3，3:大图*1
    @objc var type:Int = 0
    
    func cellIdentifier() -> String {
        if type == 3 {
            return ZQEpisodeListEnumTypeBigImgNews//大圖1
        }else if type == 2 {
            return ZQEpisodeListEnumTypeManyImgNews//小圖3
        }else{
            return ZQEpisodeListEnumTypeSmallImgNews //小圖1
        }
    }
    
    func cellIdHeigth() -> CGFloat {
        if type == 3 {
            return 295.0 //大圖1
        }else if type ==  2 {
            return 188.0 //小圖3
        }else{
            return 135.0 //小圖1
        }
        
    }
}
