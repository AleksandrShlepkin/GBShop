//
//  CommentsViewModel.swift
//  GBShop
//
//  Created by Mac on 18.04.2022.
//

import Foundation

struct CommentsViewModel {
    
    private(set) var name: String
    private(set) var id: Int
    private(set) var comment: String
    
    init(comments: CommentData) {
        self.name = comments.name
        self.id = comments.id
        self.comment = comments.comment
    }
}
