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
        
        let token = User.getUserToken()
        
        if token != "" && token != nil {
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
            
            AuthControllers.oauthToken(loginEmailTextField.text!,
                                  loginPasswordTextField.text!,
                                  completion: {(response, error) -> Void in
                                    
                                    let accessToken = response?.object(forKey: "access_token")
                                    
                                    if accessToken != nil {
                                        User.setUser(self.loginEmailTextField.text!, self.loginPasswordTextField.text!, accessToken as! String, success: { (user) in
                                            let preferences = UserDefaults.standard
                                            preferences.set(accessToken, forKey: User.PADO_TOKEN)
                                        
                                            let didSave = preferences.synchronize();
                                        
                                            print(accessToken ?? "")
                                            self.updatePush()
                                            print(didSave)
                                            self.hideLoading()
                                            self.performSegue(withIdentifier: "gotoMain", sender: sender)
                                        }, failure: { (errorString) in
                                            self.hideLoading()
                                        })
                                    }
                                    else{
                                        self.hideLoading()

                                        self.errorLabel.text = "아이디나 비밀번호가 올바르지 않습니다.";
                                        self.errorLabel.isHidden = false;
                                    }
            })
        }
    }

    func updatePush() {
        
        let preferences = UserDefaults.standard
        
        let padoToken = preferences.string(forKey: User.PADO_TOKEN)
        var onesignalId = preferences.string(forKey: User.ONESIGNAL_ID)
        var onesignalToken = preferences.string(forKey: User.ONESIGNAL_TOKEN)
        
        if onesignalId == nil{
            onesignalId = ""
        }
        
        if onesignalToken == nil{
            onesignalToken = ""
        }
        
        AuthControllers.login(onesignalId!,
                                   onesignalToken!, padoToken!,
                                   completion: {(response, error) -> Void in
                                    
                                    if response != nil{
                                    }else{
                                    }
                                    
        })
        
    }

    
    @IBAction func forgotPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoForgotPassword", sender: sender)
        
        
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

