//
//  RegistrationResponse.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation


struct RegistrationResponse: Codable {
    
    var result: Int
    var id: UUID?
    var message: String?
    
}
