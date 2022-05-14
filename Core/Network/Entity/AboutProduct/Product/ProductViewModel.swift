//
//  ProductViewModel.swift
//  GBShop
//
//  Created by Mac on 09.04.2022.
//

import Foundation


struct ProductViewModel {
    
    private(set) var name: String
    private(set) var id: Int
    private(set) var shortDescription: String
    private(set) var description: String
    private(set) var price: Int
    private(set) var comments: [CommentData?] = []
    private(set) var url: String
    
    
    init(good: ProductModel) {
        self.name = good.name
        self.id = good.id
        self.shortDescription = good.shortDescription
        self.description = good.description
        self.price = good.price
        self.comments = good.comments
        self.url = good.url ?? ""
    }
}
