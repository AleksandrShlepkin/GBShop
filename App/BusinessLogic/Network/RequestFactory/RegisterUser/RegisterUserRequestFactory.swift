//
//  RegisterUserRequestFactory.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

protocol RegisterUserRequestFactory {
    func registerUser(result: String,
                      userMessege: String,
                      complitionHandler: @escaping (AFDataResponse<RegisterUserModel>) -> Void)
}

