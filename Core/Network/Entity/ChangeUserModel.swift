//
//  ChangeUserModel.swift
//  GBShop
//
//  Created by Mac on 17.02.2022.
//

import Foundation

struct ChangeUserModel: Codable {
    
    let userId: Int
    let userName: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "id_user"
        case userName
        case password
        case email
        case gender
        case creditCard = "credit_card"
        case bio
    }
    
    
}
