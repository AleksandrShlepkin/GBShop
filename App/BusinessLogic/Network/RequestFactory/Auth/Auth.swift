//
//  Auth.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://salty-chamber-83696.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Auth: AuthRequestFactory {
    func login(user: User, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl,
                                 username: user.username ?? "",
                                 password: user.password ?? "",
                                 email: user.email ?? "",
                                 gender: user.gender ?? "",
                                 creditCard: user.creditCard ?? 123,
                                 bio: user.bio ?? "")
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"
        
        var username: String
        var password: String
        var email: String
        var gender: String
        var creditCard: Int
        var bio: String
        
        
        var parameters: Parameters? {
            return [
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "creditCard": creditCard,
                "bio": bio
            ]
        }
    }
}

