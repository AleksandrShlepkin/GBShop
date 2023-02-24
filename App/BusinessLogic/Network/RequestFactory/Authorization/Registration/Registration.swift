//
//  Registration.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation
import Alamofire

class Registration: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "hhttps://salty-chamber-83696.herokuapp.com/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Registration: RegistrationRequestFactory {
    func singUp(email: String, password: String, complitionHandler: @escaping (AFDataResponse<RegistrationResponse>) -> Void) {
        let requestModel = Auth(baseUrl: baseURL,
                                email: email,
                                password: password)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    func register(name: String, email: String, password: String, validPassword: String, complitionHandler: @escaping (AFDataResponse<RegistrationResponse>) -> Void) {
        let requestModel = Register(baseUrl: baseURL,
                                    name: name,
                                    email: email,
                                    password: password,
                                    validPassword: validPassword)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
}


extension Registration {
    struct Register: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "register"
        
        let name: String?
        let email: String
        let password: String
        let validPassword: String?
        
        var parameters: Parameters? {
            return [
                "name": name ?? "",
                "email": email,
                "password": password,
                "validPassword": validPassword ?? ""
            ]
        }
    }
    
    struct Auth: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "auth"
        
        var email: String
        var password: String
        var parameters: Parameters? {
            return [
                "email": email,
                "password": password]
        }
        
        
    }
}
