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
import Alamofire

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
        FirebaseApp.configure()
        token = Auth.auth().addIDTokenDidChangeListener { [weak self] auth, user in
            guard user != nil else { return }
        }
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
                self.showAlert(title: "Error", text: "Error")
            } else {
                self.performSegue(withIdentifier: "HomeView", sender: nil)
            }
        }
        
    }
    
    func goHome() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeView") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func showAlert(title: String?, text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okControl = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okControl)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
