//
//  AuthViewController.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation
import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var LogInButtonStyle: UIButton!
    
    @IBOutlet weak var registerButtonStyle: UIButton!
    @IBAction func goLogInButton(_ sender: UIButton) {
        goLogin()
    }
    
    @IBAction func goRegisterButton(_ sender: UIButton) {
        goRegister()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
    }
    
    
    
    func goLogin() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    func goRegister() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    func setUpButtons() {
        Utilities.styleFielledButton(LogInButtonStyle)
        Utilities.styleFielledButton(registerButtonStyle)
    }
    
    
}
