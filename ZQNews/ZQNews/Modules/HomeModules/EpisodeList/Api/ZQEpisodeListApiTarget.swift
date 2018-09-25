//
//  ZQEpisodeListApiTarget.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/25.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit

import Foundation
import Moya


public enum ZQEpisodeListApiTarget{
    //随机推荐热门段子（包含文字、图片、GIF、视频）：
    case satin(type:Int,page:Int)
}

extension ZQEpisodeListApiTarget:TargetType{
   
    //随机推荐热门段子（包含文字、图片、GIF、视频）：
    public var path: String {
        switch self {
        case .satin(_,_):
            return ZQSatinApiPath
        }
    }
    
    ///任务
    public var task: Task {
        var parameters = self.parameters
        switch self {
        case let .satin(type,page):
            parameters["type"] = type
            parameters["page"] = page
            return .requestParameters(parameters:parameters, encoding: URLEncoding.default)
        }
    }
    
    
}

