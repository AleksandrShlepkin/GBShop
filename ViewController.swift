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
        logOut()
        
    }
    
    func auth() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "Mypassword") { response  in
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


}

