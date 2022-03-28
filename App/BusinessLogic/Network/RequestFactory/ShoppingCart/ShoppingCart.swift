//
//  ShoppingCart.swift
//  GBShop
//
//  Created by Mac on 22.03.2022.
//

import Foundation
import Alamofire

class ShoppingCart: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://salty-chamber-83696.herokuapp.com/")!
//    let baseURL = URL(string: "http://127.0.0.1:8080")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.queue = queue
        self.sessionManager = sessionManager
    }
}

extension ShoppingCart: ShoppingCartRequestFactory {
    func getShoppingCart(userID: Int, completionHandler: @escaping (AFDataResponse<ShoppingCartResponse>) -> Void) {
        let requestModel = ShoppingCart(baseUrl: baseURL, userID: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}

extension ShoppingCart {
    struct ShoppingCart: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "cart"
        let encoding: RequestRouterEncoding = .json
        
        let userID: Int
        let productID = UserShoppingCart.share.products.map({$0.productID})
        
        var parameters: Parameters? {
            return [
                "userID": userID,
                "sum": UserShoppingCart.share.sum,
                "productID": productID
            ]
        }
        
        
    }
}
