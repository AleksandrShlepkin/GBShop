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
    
    


}

