//
//  LoginViewController.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    private var token: AuthStateDidChangeListenerHandle!

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func SingUpButton(_ sender: Any) {
        
        singUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        token = Auth.auth().addIDTokenDidChangeListener { [weak self] auth, user in
            guard user != nil else { return }
        }
    }
    
    func singUp() {
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText else {
                  return showAlert(title: "Ошибка", text: "Введите логин и пароль")
              }
        let singUp = requestFactory.singUp()
        singUp.singUp(email: email, password: password) { response  in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error  in
            if error != nil {
                self.showAlert(title: "Ошибка", text: "Не верный логин или пароль")
            } else {
                self.performSegue(withIdentifier: "GoHome", sender: nil)
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
