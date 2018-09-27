//
//  ZQNetWorkTool.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/20.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import Foundation
import Moya
import Result
import SwiftyJSON

///成功
typealias SuccessStringBlock = (_ result: String) -> Void
typealias SuccessModelBlock = (_ result: ZQMappable?) -> Void
typealias SuccessArrModelBlock = (_ result: [ZQMappable]?) -> Void
typealias SuccessJSONBlock = (_ result:JSON) -> Void
/// 失败
typealias FailBlock = (_ errorMsg: String?) -> Void

class ZQNetWorkTool {
    static let shared = ZQNetWorkTool()
    private init(){}
    private let failInfo="数据解析失败"
    
    // MARK: - Public Method
    /// 请求JSON数据
    func requestDataWithTargetJSON<T:TargetType>(target:T,successClosure:@escaping SuccessJSONBlock,failClosure: @escaping FailBlock) {
        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
        let _ = requestProvider.request(target) { (result) -> () in
            switch result{
            case let .success(response):
                do {
                    let mapjson = try response.mapJSON()
                    let json=JSON(mapjson)
                    successClosure(json)
                } catch {
                    failClosure(self.failInfo)
                }
            case let .failure(error):
                failClosure(error.errorDescription)
            }
        }
    }
    
    /// 请求数组对象JSON数据
//    func requestDataWithTargetArrModelJSON<T:TargetType,M:ZQMappable>(target:T,model:M,successClosure:@escaping SuccessArrModelBlock,failClosure: @escaping FailBlock) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let json = try response.mapJSON()
//                    let jsonString = try JSON(json).string!
//                    let arr = try?M.mapFromJson(jsonString , M.self)
//                    successClosure(arr as? [ZQMappable])
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//        }
//    }
    
    /// 请求对象JSON数据
//    func requestDataWithTargetModelJSON<T:TargetType,M:Mappable>(target:T,model:M,successClosure:@escaping SuccessModelBlock,failClosure: @escaping FailBlock) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let json = try response.mapJSON()
//                    let model = M.mapFromJson
//                    successClosure(model)
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//        }
//    }
    
    ///请求String数据
    func requestDataWithTargetString<T:TargetType>(target:T,successClosure:@escaping SuccessStringBlock,failClosure: @escaping FailBlock) {
        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
        let _=requestProvider.request(target) { (result) -> () in
            switch result{
            case let .success(response):
                do {
                    let str = try response.mapString()
                    successClosure(str)
                } catch {
                    failClosure(self.failInfo)
                }
            case let .failure(error):
                failClosure(error.errorDescription)
            }
            
        }
    }
    
    // MARK: - Private Method
    //设置一个公共请求超时时间
    private func requestTimeoutClosure<T:TargetType>(target:T) -> MoyaProvider<T>.RequestClosure{
        let requestTimeoutClosure = { (endpoint:Endpoint, done: @escaping MoyaProvider<T>.RequestResultClosure) in
            do{
                var request = try endpoint.urlRequest()
                request.timeoutInterval = 120 //设置请求超时时间
                done(.success(request))
            }catch{
                return
            }
        }
        return requestTimeoutClosure
    }
}


