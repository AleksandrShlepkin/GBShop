//
//  ShoppingCartRequestFactory.swift
//  GBShop
//
//  Created by Mac on 22.03.2022.
//

import Foundation
import Alamofire

protocol ShoppingCartRequestFactory {
    func getShoppingCart(userID: Int, completionHandler: @escaping  (AFDataResponse<ShoppingCartResponse>) -> Void)
}


