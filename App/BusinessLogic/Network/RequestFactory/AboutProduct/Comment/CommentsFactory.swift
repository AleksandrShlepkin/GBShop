//
//  CommentsFactory.swift
//  GBShop
//
//  Created by Mac on 17.04.2022.
//

import Foundation
import Alamofire

protocol CommentsRequestFactory {
    func getComments(productID: Int, complitionHandler: @escaping (AFDataResponse<CommentsResponse>) -> Void )
    
    func deleteComment(productID: Int, complitionHandler: @escaping (AFDataResponse<CommentsResponse>) -> Void)
}
