//
//  CategoruProduct.swift
//  GBShop
//
//  Created by Mac on 04.04.2022.
//

import Foundation
import Alamofire

class Category: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    var baseURL = URL(string: "https://salty-chamber-83696.herokuapp.com/")!
    
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Category: CategoryRequestFactory {
    func getCategoryProduct(categoryId: Int, pageNumber: Int, complitionHandler: @escaping (AFDataResponse<GoodsResponse>) -> Void) {
        let requestModel = Category(baseUrl: baseURL, categoryID: categoryId, pageNumber: pageNumber)
        self.request(request: requestModel , completionHandler: complitionHandler)
    }
    
    func getProduct(productID: Int, complitionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void) {
        let requestModel = Product(baseUrl: baseURL, productID: productID)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
}

extension Category {
    struct Category: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "getCategory"
        
        var categoryID: Int
        var pageNumber: Int
        
        var parameters: Parameters? {
            return [
                "categoryId": categoryID,
                "pageNumber": pageNumber
            ]
        }
    }
    
    struct Product: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "getProduct"
        
        var productID: Int
        
        var parameters: Parameters? {
            return [
                "productID": productID
            ]
        }
    }
}
