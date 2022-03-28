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
    
 
    
    func makeCatalog() -> CatalogRequestFactory {
        let errorParser = makeErrorParser()
        return Catalog(errorParse: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetGoodByld() -> getGoodByldRequestFactory {
        let errorParser = makeErrorParser()
        return GoodByld(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
   
    func makeComments() -> CommentsRequsetFactory {
        let errorParse = makeErrorParser()
        return Comments(errorParser: errorParse, sessionMenager: commonSession, queue: sessionQueue)
    }
    func deleteComments() -> CommentsRequsetFactory {
        let errorParser = makeErrorParser()
        return Comments(errorParser: errorParser, sessionMenager: commonSession, queue: sessionQueue)
    }
    
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
}
