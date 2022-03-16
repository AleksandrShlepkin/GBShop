//
//  GetGoodByldRequestFactory.swift
//  GBShop
//
//  Created by Mac on 23.02.2022.
//

import Foundation
import Alamofire

protocol getGoodByldRequestFactory {
    func getGoodByld(productId: Int,
                     complitionHandler: @escaping (AFDataResponse<ProductModel>) -> Void)
}
