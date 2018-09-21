//
//  ZQHttpTargetType.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/21.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//
import Foundation
import Moya


public enum ZQApiMainHttpTarget{
    //随机推荐热门段子（包含文字、图片、GIF、视频）：
    case satin(type:Int,page:Int)
}

extension ZQApiMainHttpTarget:TargetType{
    //请求URL
    public var baseURL:URL{
        return URL(string:"https://www.apiopen.top")!
    }
    
    
    //随机推荐热门段子（包含文字、图片、GIF、视频）：
    public var path: String {
        switch self {
            case .satin(_,_):
                return "/satinApi"
        }
    }
    
    ///请求方式
    public var method:Moya.Method {
        switch self {
            case .satin(_,_):
                return .get
        }
    }
    
    ///单元测试用
    public var sampleData:Data{
        return "".data(using:.utf8)!
    }
    
    ///任务
    public var task: Task {
        var parameters:[String: Any] = ["version":"1.1.0","mobile_id": "xxxx"]
        switch self {
        case let .satin(type,page):
            parameters["type"] = type
            parameters["page"] = page
            return .requestParameters(parameters:parameters, encoding: URLEncoding.default)
        }
        
        
    }
    
    ///请求头信息
    public var headers: [String : String]? {
        return ["device":"ios"]
    }
}


