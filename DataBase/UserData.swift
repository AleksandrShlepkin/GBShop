//
//  UserData.swift
//  GBShop
//
//  Created by Mac on 22.03.2022.
//

import Foundation

class UserShoppingCart {
    static let share = UserShoppingCart()
    private let cart = ShoppingCartData()
    
    private(set) var products: [ProductModel] = [] {
        didSet {
            cart.saveData(product: self.products)
        }
    }
    
    private(set) var sum: Int
    
    private init() {
        let product = self.cart.reternData()
        self.products = product
        self.sum = self.cart.getSum(product: product)
    }
    
    
    func addProduct(_ product: ProductModel) {
        self.products.append(product)
        self.sum += product.price
    }
    
    func deleteProduct(_ product: ProductModel) {
        self.products.remove(at: product.id)
        self.sum -= product.price
    }
    
    func clearCart() {
        self.products = []
        self.sum = 0
    }
}
