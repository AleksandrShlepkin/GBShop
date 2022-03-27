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
    
    func deleteComent() {
        let delete = requestFactory.deleteComments()
        delete.deleteComment(productID: 123) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getComment() {
        let comments = requestFactory.makeComments()
        comments.getComments(productID: 123) { (response)  in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
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
        let user = User(username: "Aleksandr",
                        password: "helloworld",
                        email: "alex@icloud.com",
                        gender: "male"
                        , bio: "Hi",
                        creditCard: 14235346)
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
        let user = User(username: "Aleksandr",
                        password: "helloWorld",
                        email: "aleksandr@mail.ru",
                        gender: "male",
                        bio: "what's going on here!?",
                        creditCard: 214135)
        
        change.chengeUser(user: user) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCart() {
        let getCart = requestFactory.getShoppingCart()
        let product1 = ProductModel(result: 1,
                                    productID: 123,
                                    productName: "Asus",
                                    productPrice: 34500,
                                    productDescription: "Gaming notebook")
        let product2 = ProductModel(result: 1,
                                    productID: 445,
                                    productName: "Apple",
                                    productPrice: 98000,
                                    productDescription: "Devolopment notebook")
        UserShoppingCart.share.addProduct(product1)
        UserShoppingCart.share.addProduct(product2)
        
        let products = UserShoppingCart.share.products
        print(products)
        
        if !products.isEmpty {
            getCart.getShoppingCart(userID: 123) { response  in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error)
                }
            }
        }
       print("Товаров в корзине на \(UserShoppingCart.share.sum) тысяч рублей")
        UserShoppingCart.share.clearCart()
    }
    
    
}

