//
//  Utilities.swift
//  GBShop
//
//  Created by Mac on 25.03.2022.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textField: UITextField) {
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2.0, width: textField.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    static func styleFielledButton(_ button: UIButton) {
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.systemGreen
    }
    
    
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordText = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
        return passwordText.evaluate(with: password)
    }
}

extension Data {
    var prettyJSON: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
            return nil
        }
        return prettyPrintedString
    }
}

enum Result<T> {
    case done(T)
    case fail(String)
    
    func map<P>(f: (T) -> P) -> Result<P> {
        switch self {
        case .done(let value):
            return .done(f(value))
        case .fail(let error):
            return .fail(error)
        }
    }
    
    var description : String {
        get {
            switch self {
            case .done(let value):
                return "\(value)"
            case .fail(let message):
                return "\(message)"
            }
        }
    }
}
