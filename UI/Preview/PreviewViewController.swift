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
    }
    
    @IBAction func goRegisterButton(_ sender: UIButton) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
    }
    
    
    
    func setUpButtons() {
        Utilities.styleFielledButton(LogInButtonStyle)
        Utilities.styleFielledButton(registerButtonStyle)
    }
    
    
}
