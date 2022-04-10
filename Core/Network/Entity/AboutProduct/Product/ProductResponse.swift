//
//  ProductResponse.swift
//  GBShop
//
//  Created by Mac on 03.04.2022.
//

import Foundation


struct ProductResponse: Codable {
    
    var result: Int
    var errorMessage: String?
    let product: ProductModel?
    
}
