//
//  ForgotPasswordViewController.swift
//  beautyios
//
//  Created by Michael on 6/12/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit
import Material

class ForgotPasswordViewController: ViewController {

    @IBOutlet weak var userTextField: ErrorTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUserTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func getNewPassword(_ sender: Any) {
        if (userTextField.text?.isEmpty)! {
            self.showWarningMessage("이메일을 입력하세요!")
        }
        else {
            showLoading("비밀코드를 가져 오는중...")
            AuthControllers.forgotPassword(userTextField.text!, { (result) in
                self.hideLoading()
                self.navigationController?.popViewController(animated: true)
            }, { (errorString) in
                self.hideLoading()
                self.showErrorMsg(errorString)
            })
        }

    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension ForgotPasswordViewController {
    fileprivate func prepareUserTextField() {
    }
}

extension ForgotPasswordViewController: TextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
}
