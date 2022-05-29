//
//  DefaultResponse.swift
//  GBShop
//
//  Created by Mac on 01.03.2022.
//

import Foundation


struct DefaultResponse: Codable {
    var result: Int
    var userId: String?
    var user_message: String?
    var error_message: String?
}
