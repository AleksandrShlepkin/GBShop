//
//  ChangeUserRequestFactory.swift
//  GBShop
//
//  Created by Mac on 17.02.2022.
//

import Foundation
import Alamofire

protocol ChangeUserRequestFactory {
    func chengeUser(user: User,
                    complitionHandler: @escaping (AFDataResponse<ChangeUserModel>) -> Void)
}
