//
//  ShoppingCartRequest.swift
//  GBShop
//
//  Created by Mac on 22.03.2022.
//

import Foundation


struct ShoppingCartRequset: Codable {
    let userID: Int?
    let productID: [Int]?
    let sum: Int?
}
