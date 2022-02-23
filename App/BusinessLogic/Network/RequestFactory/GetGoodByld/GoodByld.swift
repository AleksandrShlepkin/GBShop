//
//  GoodByld.swift
//  GBShop
//
//  Created by Mac on 23.02.2022.
//

import Foundation
import Alamofire

class GoodByld: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)){
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GoodByld: getGoodByldRequestFactory {
    func getGoodByld(productId: Int, complitionHandler: @escaping (AFDataResponse<ProductModel>) -> Void) {
        let requestModel = GoodByld(baseUrl: baseURL, productID: productId)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
}


extension GoodByld {
    struct GoodByld: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID
            ]
        }
        
        
    }
}
