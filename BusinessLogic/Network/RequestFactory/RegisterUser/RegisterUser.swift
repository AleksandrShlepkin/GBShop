//
//  RegisterUser.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

class RegisterUser: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.sessionManager = sessionManager
        self.errorParser = errorParser
        self.queue = queue
    }
    
    
}

extension RegisterUser: RegisterUserRequestFactory {
    func registerUser(result: String, userMessege: String, complitionHandler: @escaping (AFDataResponse<RegisterUserModel>) -> Void) {
        let requestModel = RegisterUser(baseUrl: baseURL, result: result, userMessage: userMessege)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
}

extension RegisterUser {
    struct  RegisterUser: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "registerUser.json"
        
        let result: String
        let userMessage: String
        
        var parameters: Parameters? {
            return [
                "result": result,
                "userMessage": userMessage
            ]
        }
        
        
    }
    
}
