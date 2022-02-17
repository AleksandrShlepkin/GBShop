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
    func chengeUser(userId: Int,
                    userName: String,
                    password: String,
                    email: String,
                    gender: String,
                    creditCard: String,
                    bio: String,
                    complitionHandler: @escaping (AFDataResponse<ChangeUserModel>) -> Void) {
        let requestModel = ChangeUser(baseUrl: baseURL,
                                      userId: userId,
                                      userName: userName,
                                      password: password,
                                      email: email,
                                      gender: gender,
                                      creditCard: creditCard,
                                      bio: bio)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
    
}


extension ChangeUser {
    struct ChangeUser: RequestRouter{
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "changeUserData.json"
        
        let userId: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
