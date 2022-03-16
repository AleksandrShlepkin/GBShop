//
//  CatalogModel.swift
//  GBShop
//
//  Created by Mac on 22.02.2022.
//

import Foundation



struct CatalogModel: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
    }
    
    
}
