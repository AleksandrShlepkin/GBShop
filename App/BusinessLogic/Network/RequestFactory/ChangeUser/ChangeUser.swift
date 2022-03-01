//
//  ChangeUser.swift
//  GBShop
//
//  Created by Mac on 17.02.2022.
//

import Foundation
import Alamofire

class ChangeUser: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue =  DispatchQueue.global(qos: .utility)){
        self.sessionManager = sessionManager
        self.errorParser = errorParser
        self.queue = queue
    }
    
}

extension ChangeUser: ChangeUserRequestFactory {
    func chengeUser(user: User, complitionHandler: @escaping (AFDataResponse<ChangeUserModel>) -> Void) {
        let requestModel = ChangeUser(baseUrl: baseURL, user: user)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
    
    
}


extension ChangeUser {
    struct ChangeUser: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "changeUserData.json"
        
        let user: User
        
                var parameters: Parameters? {
            return [
                
                "username": user.username,
                "email": user.email,
                "gender": user.gender,
                "credit_card": user.creditCard,
                "bio": user.bio
            ]
        }
    }
}
