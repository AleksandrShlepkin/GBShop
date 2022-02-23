//
//  User.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation

struct User: Codable {
    let id: Int?
    let login: String?
    let password: String?
    let name: String?
    let lastname: String?
    let gender: String?
    let creditCard: String?
    let bio: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id_user"
        case login = "user_login"
        case password 
        case name = "user_name"
        case lastname = "user_lastname"
        case creditCard = "credit_card"
        case bio
        case gender
        case email
    }
}
