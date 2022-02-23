//
//  Catalog.swift
//  GBShop
//
//  Created by Mac on 22.02.2022.
//

import Foundation
import Alamofire


class Catalog: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParse: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)){
        self.errorParser = errorParse
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Catalog: CatalogRequestFactory {
    func getCatalog(pageNumber: Int, idCategory: Int, complitionHandler: @escaping (AFDataResponse<[Products]>) -> Void) {
        let requestModel = Catalog(baseUrl: baseURL, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
    
}

extension Catalog {
    struct Catalog: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
                
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
                            ]
        }
        
        
    }
}
