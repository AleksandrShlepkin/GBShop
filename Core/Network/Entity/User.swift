//
//  User.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation

struct User: Codable {
    let username: String
    let password: String
    let email: String
    let gender: String
    let bio: String
    let creditCard: Int
    
    init(username: String? = nil,
         password: String? = nil,
         email: String? = nil,
         gender: String? = nil,
         bio: String? = nil,
         creditCard: Int? = nil){
        self.username = username ?? "unknow user"
        self.password = password ?? ""
        self.email = email ?? "email empty"
        self.gender = gender ?? "gender empty "
        self.bio = bio ?? "bio empty"
        self.creditCard = creditCard ?? 123124
    }
    
   }
