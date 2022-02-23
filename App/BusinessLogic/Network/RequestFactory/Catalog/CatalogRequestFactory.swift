//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Mac on 22.02.2022.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func getCatalog( pageNumber: Int,
                     idCategory: Int,
                     complitionHandler: @escaping (AFDataResponse<[Products]>) -> Void)
}
