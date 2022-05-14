//
//  APIService.swift
//  GBShop
//
//  Created by Mac on 06.04.2022.
//

import Foundation
import Alamofire


final class APIServiceProduct {
    
    private let request = RequestFactory()
    private(set) var product: Result<[ProductViewModel]>?
    
    func getCatalog(categoryId: Int, pageNumber: Int, complition: @escaping () -> Void) {
        let catalog = request.getCategory()
        catalog.getCategoryProduct(categoryId: categoryId, pageNumber: pageNumber) { [weak self]
            response in
            guard let self = self else { return }
            switch response.result {
            case .success(let result):
                if result.result == 1,
                   let catalog = result.goods {
                    self.product = .done(catalog.compactMap { ProductViewModel(good: $0)})
                } else {
                    self.product = .fail("Error in APIService")
                }
                print(result)
            case .failure(let error):
                print(error)
                
            }
            DispatchQueue.main.async {
                complition()
            }
        }
    }
    
}
