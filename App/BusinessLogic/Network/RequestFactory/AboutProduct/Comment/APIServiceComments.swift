//
//  APIServiceComments.swift
//  GBShop
//
//  Created by Mac on 18.04.2022.
//

import Foundation
import Alamofire

final class APIServiceComments {
    private let request = RequestFactory()
    private(set) var comment: Result<[CommentsViewModel]>?
    
    func getComments(productID: Int, complition: @escaping () -> Void) {
        let comments = request.getComments()
        comments.getComments(productID: productID) { [weak self] response  in
            guard let self = self else { return }
            switch response.result {
            case .success(let result):
                if result.result == 1,
                   let comment = result.comment {
                    self.comment = .done(comment.compactMap { CommentsViewModel(comments: $0)})
                } else {
                    self.comment = .fail("Error in APIService")
                }
            case .failure(let error):
                print(error)
            }
            DispatchQueue.main.async {
                complition()
            }
        }
    }
}
