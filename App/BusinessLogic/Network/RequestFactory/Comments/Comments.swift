//
//  Comments.swift
//  GBShop
//
//  Created by Mac on 09.03.2022.
//

import Foundation
<<<<<<< HEAD
import Alamofire

class Comments: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://quiet-tor-66324.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionMenager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)){
            self.errorParser = errorParser
            self.sessionManager = sessionMenager
            self.queue = queue
        }
}

extension Comments: CommentsRequsetFactory {
    func getComments(productID: Int, complitionHandler: @escaping (AFDataResponse<CommentsResponse>) -> Void) {
        let requestModel = Comments(baseUrl: baseURL, productID: productID)
        self.request(request: requestModel, completionHandler: complitionHandler)
    }
}

extension Comments {
    struct Comments: RequestRouter {
        
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "commetns"
        
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "productID": productID
            ]
        }

    }
}
=======
>>>>>>> feature-lesson_4
