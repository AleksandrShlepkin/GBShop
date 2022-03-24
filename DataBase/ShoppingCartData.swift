//
//  ShoppingCartData.swift
//  GBShop
//
//  Created by Mac on 22.03.2022.
//

import Foundation

final class ShoppingCartData {
    private let encode = JSONEncoder()
    private let decode = JSONDecoder()
    
    private let key = "ShoppongCart"
    
    func saveData(product: [ProductModel]) {
        do {
        let data = try self.encode.encode(product)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func reternData() -> [ProductModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decode.decode([ProductModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func getSum(product: [ProductModel]) -> Int {
        return product.map({$0.productPrice}).reduce(0, +)
    }
    
    
}
