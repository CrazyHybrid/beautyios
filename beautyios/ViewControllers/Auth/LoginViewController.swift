//
//  LoginViewController.swift
//  beauty-ios
//
//  Created by Michael on 6/10/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: ViewController {

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = User.getUser() {
            self.performSegue(withIdentifier: "gotoMain", sender: self)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        errorLabel.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
extension LoginViewController {
    @IBAction func login(_ sender: Any) {
        if (loginEmailTextField.text?.isEmpty)! || (loginPasswordTextField.text?.isEmpty)! {
            self.showWarningMessage("이메일과 비밀코드를 입력하세요!")
        }
        else {
            showLoading("")
            
            AuthControllers.login(loginEmailTextField.text!,
                                  loginPasswordTextField.text!,
                                { (result) in

                                    self.hideLoading()
                                    self.performSegue(withIdentifier: "gotoMain", sender: sender)
                                }) { (errorString) in
                                    self.hideLoading()
                                    self.showErrorMsg(errorString)
                                }
            
        }
    }

    
    @IBAction func forgotPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoForgotPassword", sender: sender)
        
//        let forgetVC = storyboard?.instantiateViewController(withIdentifier: "commentsVC") as! ForgotPasswordViewController
//        self.navigationController?.pushViewController(forgetVC, animated: true)
        
    }
    @IBAction func signup(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoSignup", sender: sender)
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginEmailTextField {
            let _ = loginPasswordTextField.becomeFirstResponder()
        }
        else {
            loginEmailTextField?.resignFirstResponder()
            loginPasswordTextField?.resignFirstResponder()
        }
        
        return true
    }
}

