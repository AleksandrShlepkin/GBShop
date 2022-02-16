//
//  LogOut.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

class LogOut: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)){
            self.sessionManager = sessionManager
            self.errorParser = errorParser
            self.queue = queue
        }
}

extension LogOut: LogOutRequestFactory {
    func logOut(result: String, complitionHandler: @escaping (AFDataResponse<LogOutModel>) -> Void) {
        let requestModel = LogOut(baseUrl: baseUrl, result: result)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
}

extension LogOut {
    struct LogOut: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "logout.json"
        let result: String
        var parameters: Parameters? {
            return [
                "result": result]
        }
        
        
    }
}
