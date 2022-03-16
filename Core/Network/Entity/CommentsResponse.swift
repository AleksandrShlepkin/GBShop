//
//  DefaultComment.swift
//  GBShop
//
//  Created by Mac on 16.03.2022.
//

import Foundation

struct CommentsResponse: Codable {
    var result: Int?
    var user: [String: String]?
    var errorMessage: String?
    
}
