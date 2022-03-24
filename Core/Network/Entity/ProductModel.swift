//
//  ProductModel.swift
//  GBShop
//
//  Created by Mac on 23.02.2022.
//

import Foundation

struct ProductModel: Codable {
    
    let result: Int
    let productID: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
//    enum CodingKeys: String, CodingKey {
//        case result
//        case productName = "product_name"
//        case productPrice = "product_price"
//        case productDescription = "product_description"
//    }
}
