//
//  Registration.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation


struct RegistrationRequest: Codable {
    
    var name: String
    var email: String
    var password: String
    var validPassword: String?
    
}
