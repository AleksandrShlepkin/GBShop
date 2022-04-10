//
//  CommentResponse.swift
//  GBShop
//
//  Created by Mac on 03.04.2022.
//

import Foundation


struct CommentsResponse: Codable {
    var result: Int?
    var userID: Int?
    var message: String?
    var comment: [CommentData]?
    var errorMessage: String?
}
