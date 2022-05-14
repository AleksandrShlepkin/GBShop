//
//  CategoryResponse.swift
//  GBShop
//
//  Created by Mac on 03.04.2022.
//

import Foundation


struct GoodsResponse: Codable {
    
    var result: Int
    var errorMessage: String?
    let pageNumber: Int?
    let goods: [ProductModel]?
    
}
