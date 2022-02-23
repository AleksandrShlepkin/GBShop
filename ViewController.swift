//
//  ViewController.swift
//  GBShop
//
//  Created by Mac on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCatalog()
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
        auth.login(userName: "Somebody",
                   password: "Mypassword") { response  in
            switch response.result {
            case .success(let login):
                print(login)
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
        change.chengeUser(userId: 123,
                          userName: "username",
                          password: "password",
                          email: "email",
                          gender: "gender",
                          creditCard: "creditCard",
                          bio: "bio"
        ) { response  in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

