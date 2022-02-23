//
//  ViewController.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    let user = User(id: 123,
                login: "alex@gb.com",
                password: "124414",
                name: "Alex",
                lastname: "Short",
                gender: "male",
                creditCard: "1314-4533-4554-1123",
                bio: "I'm student GB",
                email: "alex@gb.com")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGoodByld()
    }
    
    func getGoodByld() {
        let getGoodByld = requestFactory.makeGetGoodByld()
        getGoodByld.getGoodByld(productId: 123) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCatalog() {
        let catalog = requestFactory.makeCatalog()
        catalog.getCatalog(pageNumber: 1, idCategory: 1) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    func auth() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(user: user) { response  in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func logOut() {
        let logOut = requestFactory.makeLogOutRequestFactory()
        logOut.logOut(result: "1") { response  in
            switch response.result {
            case .success(let logOut):
                print(logOut)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func registerUser() {
        let register = requestFactory.makeRegisterUserRequestFactory()
        register.registerUser(result: "1",
                              userMessege: "userMessage") { response  in
            switch response.result {
            case .success(let result):
                print( result)
            case .failure(let error):
                print( error)
            }
        }
    }
    
    func changeUser() {
        let change = requestFactory.makeChangeUserrequestFactory()
        let user = User(id: 123,
                        login: "alex@gb.com",
                        password: "124135",
                        name: "Alex",
                        lastname: "Short",
                        gender: "male",
                        creditCard: "3432-4567-2345-9888",
                        bio: "I student GB",
                        email: "alex@gb.com")
        
        change.chengeUser(user: user) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

