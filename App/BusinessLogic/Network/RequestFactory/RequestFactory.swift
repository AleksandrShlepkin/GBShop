//
//  RequestFactory.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogOutRequestFactory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOut(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegisterUserRequestFactory() -> RegisterUserRequestFactory {
        let errorParser = makeErrorParser()
        return RegisterUser(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeUserrequestFactory() -> ChangeUserRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUser(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeCatalog() -> CatalogRequestFactory {
        let errorParser = makeErrorParser()
        return Catalog(errorParse: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetGoodByld() -> getGoodByldRequestFactory {
        let errorParser = makeErrorParser()
        return GoodByld(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
   
}
