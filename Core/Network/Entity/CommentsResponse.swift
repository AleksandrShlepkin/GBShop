//
//  DefaultComment.swift
//  GBShop
//
//  Created by Mac on 16.03.2022.
//

import Foundation

//struct CommentsResponse: Codable {
//    var result: Int?
//    var userID: [Int]?
//    var comment: [String: String]?
//    var errorMessage: String?
//
//
//
//}

struct CommentsResponse: Codable {
    var result: Int
    var userID: Int?
    var message: String?
    var comment: [CommentData]?
    var errorMessage: String?
}

struct CommentData: Codable {
    var comment: String?
    var name: String?
    var id: Int?

}
