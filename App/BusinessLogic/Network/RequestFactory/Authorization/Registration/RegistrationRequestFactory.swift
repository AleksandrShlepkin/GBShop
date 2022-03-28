//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation
import Alamofire


protocol RegistrationRequestFactory {
    func register(name: String,
                  email: String,
                  password: String,
                  validPassword: String,
                  complitionHandler: @escaping (AFDataResponse<RegistrationResponse>) -> Void)
    
    func singUp(email: String,
                password: String,
                complitionHandler: @escaping (AFDataResponse<RegistrationResponse>) -> Void)
}
