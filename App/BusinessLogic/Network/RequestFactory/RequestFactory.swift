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
    
    func getShoppingCart() -> ShoppingCartRequestFactory {
        let errorParser = makeErrorParser()
        return ShoppingCart(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func registration() -> RegistrationRequestFactory {
        let error = makeErrorParser()
        return Registration(errorParser: error, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func singUp() -> RegistrationRequestFactory {
        let error = makeErrorParser()
        return Registration(errorParser: error, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func getCategory() -> CategoryRequestFactory {
        let error = makeErrorParser()
        return Category(errorParser: error, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func getProduct() -> CategoryRequestFactory {
        let error = makeErrorParser()
        return Category(errorParser: error, sessionManager: commonSession, queue: sessionQueue)
    }
}
