//
//  RegisterViewController.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class RegisterViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    private var token: AuthStateDidChangeListenerHandle!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validPasswordTextField: UITextField!
    
    @IBAction func registerButton(_ sender: UIButton) {
        register()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func register() {
        guard let name = nameTextField.text, nameTextField.hasText,
              let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText,
              let validPassword = validPasswordTextField.text, validPasswordTextField.hasText else {
                  return showAlert(title: "Ошибка", text: "Заполните обязательные поля")
              }
  
        let registr = requestFactory.registration()
        registr.register(name: name,
                         email: email ,
                         password: password,
                         validPassword: validPassword ) { response  in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if  error != nil {
                self.showAlert(title: "Ошибка", text: "Регистрация не получилась")
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["name": name,
                                                          "email": email,
                                                          "password": password,
                                                          "uid": authResult!.user.uid]) { err  in
                    if err != nil {
                        self.showAlert(title: "Error", text: "Error")
                    }
                }
//                self.showAlert(title: "Поздравляю!", text: "Регистрация прошла успешно")
                self.performSegue(withIdentifier: "HomeView", sender: nil)
            }
        }
    }
    
    func showAlert(title: String?, text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okControl = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okControl)
        self.present(alert, animated: true, completion: nil)
    }
}
