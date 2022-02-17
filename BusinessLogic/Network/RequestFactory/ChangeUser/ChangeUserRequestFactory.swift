//
//  ChangeUserRequestFactory.swift
//  GBShop
//
//  Created by Mac on 17.02.2022.
//

import Foundation
import Alamofire

protocol ChangeUserRequestFactory {
    func chengeUser(userId: Int,
                    userName: String,
                    password: String,
                    email: String,
                    gender: String,
                    creditCard: String,
                    bio: String,
                    complitionHandler: @escaping (AFDataResponse<ChangeUserModel>) -> Void)
}
