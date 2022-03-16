//
//  RegisterUserModel.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation

struct RegisterUserModel: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
