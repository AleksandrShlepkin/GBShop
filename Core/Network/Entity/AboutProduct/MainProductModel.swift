//
//  ProductModel.swift
//  GBShop
//
//  Created by Mac on 03.04.2022.
//

import Foundation


struct CategoryModel: Codable {
    var id: Int
    var category: [ProductModel] = []
}

struct ProductModel: Codable {
    
    var name: String
    var id: Int
    var shortDescription: String
    var description: String
    var price: Int
    var comments: [CommentData?] = []
    var url: String?
}

struct CommentData: Codable {
    
    var comment: String
    var name: String
    var id: Int
}
