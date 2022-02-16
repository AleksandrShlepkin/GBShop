//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logOut(result: String,
                complitionHandler: @escaping (AFDataResponse<LogOutModel>) -> Void)
}
