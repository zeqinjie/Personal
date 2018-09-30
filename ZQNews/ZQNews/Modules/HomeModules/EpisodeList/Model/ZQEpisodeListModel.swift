//
//  ZQEpisodeListModel.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/26.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

class ZQEpisodeListResultModel: BaseModel {
    var data:[ZQEpisodeListModel]?
    var msg: String?
    var code: Int?
}


class ZQEpisodeListModel: BaseModel {
    /*text : 文字  image : 图片   gif : Gif   video: 视频 */
    var type = ""
    var text = ""
    var created_at = ""
    var bimageuri = ""
    var username = ""
    var uid = ""
    var header = ""
    var top_commentsVoiceuri:String?
    var top_commentsContent:String?
    var top_commentsHeader:String?
    var top_commentsName:String?
    var passtime =  ""
    var image = ""
    var gif = ""
    var thumbnail = ""
    var video = ""
    var soureid = 0
    var up = 0
    var down = 0
    var forward = 0
    var comment = 0
    
    func cellIdentifier() -> String {
//        if type == "text" {
//            return ZQEpisodeListEnumTypeBigImgNews//大圖1
//        }else if type == "image" {
//            return ZQEpisodeListEnumTypeManyImgNews//小圖3
//        }else if type == "gif" {
//            return ZQEpisodeListEnumTypeSmallImgNews //小圖1
//        }else {
//            return ZQEpisodeListEnumTypeSmallImgNews //小圖1
//        }
        return "ZQEpisodeListTableViewCell"
    }
    
    func cellIdHeigth() -> CGFloat {
        if type == "text" {
            return 295.0
        }else if type == "image" {
            return 188.0
        }else if type == "gif" {
            return 135.0
        }else {//video
            return 135.0
        }
        
    }
}
