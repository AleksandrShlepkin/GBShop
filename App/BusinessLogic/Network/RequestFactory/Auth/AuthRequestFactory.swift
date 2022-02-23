//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(user: User,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

