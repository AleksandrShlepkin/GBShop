//
//  File.swift
//  GBShop
//
//  Created by Mac on 04.04.2022.
//

import Foundation
import Alamofire

protocol CategoryRequestFactory {
    func getCategoryProduct(categoryId: Int, pageNumber: Int, complitionHandler: @escaping (AFDataResponse<GoodsResponse>) -> Void)
    
    func getProduct(productID: Int, complitionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void )
}
