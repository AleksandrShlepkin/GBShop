//
//  CommentsRequestFactory.swift
//  GBShop
//
//  Created by Mac on 09.03.2022.
//

import Foundation
import Alamofire

protocol CommentsRequsetFactory {
    func getComments(productID: Int, complitionHandler: @escaping (AFDataResponse<CommentsResponse>) -> Void)
}
