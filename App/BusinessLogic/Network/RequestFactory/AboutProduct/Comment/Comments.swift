//
//  Comments.swift
//  GBShop
//
//  Created by Mac on 17.04.2022.
//

import Foundation
import Alamofire

class Comments: AbstractRequestFactory {
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

extension Comments: CommentsRequestFactory {
    func getComments(productID: Int, complitionHandler: @escaping (AFDataResponse<CommentsResponse>) -> Void) {
        let requestModel = GetComments(baseUrl: baseURL, productID: productID)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    func deleteComment(productID: Int, complitionHandler: @escaping (AFDataResponse<CommentsResponse>) -> Void) {
        let requestModel = DeleteComment(baseUrl: baseURL, productID: productID)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
    
    
}

extension Comments {
    struct GetComments: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "comments"
        
        var productID: Int
        
        var parameters: Parameters? {
            return [
                "productID": productID
            ]
        }
    }
    
    struct DeleteComment: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "deleteComment"
        
        var productID: Int
        
        var parameters: Parameters? {
            return [
                "productID": productID
            ]
        }
    }
}
