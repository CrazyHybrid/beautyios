//
//  SignUpViewController.swift
//  beautyios
//
//  Created by Michael on 6/11/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit
import Material
import ActiveLabel
import SwiftMessages

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var displayNameTextField: TextField!
    
    @IBOutlet weak var emailTextField: ErrorTextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var passconfirmField: TextField!
    @IBOutlet weak var termsAndConditionsSwitch: UISwitch!
    @IBOutlet weak var termLabel: ActiveLabel!
    @IBOutlet weak var birthdayLableButton: RaisedButton!
    @IBOutlet weak var selMenButton: RaisedButton!
    @IBOutlet weak var selWomenButton: RaisedButton!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    @IBOutlet weak var birthDayLabel: UILabel!
    
    var nSex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTermsAndCondition()
        prepareTextFields()
        
        birthdayLableButton.addTarget(self, action: #selector( onClickBirthDay(sender:)), for: .touchUpInside)
        selMenButton.addTarget(self, action: #selector(onClickMen(sender:)), for: .touchUpInside)
        selWomenButton.addTarget(self, action: #selector(onClickWomen(sender:)), for: .touchUpInside)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.dateView.isHidden = true
    }
    
    @IBAction func signup(_ sender: Any) {
        
        if !termsAndConditionsSwitch.isOn{
            showWarningMessage("이용약관에 동의해주세요.");
            return
        }
        
        self.performSegue(withIdentifier: "gotoSezzwho", sender: sender)
    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickDateYes(_ sender: Any) {
        
        self.dateView.isHidden = true
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        birthDayLabel.text = dateFormat.string(from: birthDayPicker.date)
        
        
    }

    @IBAction func onClickDateNo(_ sender: Any) {
        self.dateView.isHidden = true
    }
    
    func onClickBirthDay( sender: UIButton ){
        
        self.dateView.isHidden = false
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-MMM-yyyy"
        dateformatter.locale = Locale.init(identifier: "en_GB")
        
        let currentdate = birthDayLabel.text
        
        let date1 = dateformatter.date(from: currentdate!)
        dateformatter.dateFormat = "dd-MM-yyyy"
        
        print(date1 ?? String())
        
    }
    
    func onClickMen ( sender: UIButton ){
        selMenButton.backgroundColor = beautyTheme.Colors.beautyColor
        selMenButton.setTitleColor(UIColor.white, for: .normal)
        selWomenButton.backgroundColor = UIColor.white
        selWomenButton.setTitleColor(beautyTheme.Colors.beautyColor, for: .normal)
        nSex = 1
        
    }
    
    func onClickWomen( sender: UIButton ){
        selWomenButton.backgroundColor = beautyTheme.Colors.beautyColor
        selWomenButton.setTitleColor(UIColor.white, for: .normal)
        selMenButton.backgroundColor = UIColor.white
        selMenButton.setTitleColor(beautyTheme.Colors.beautyColor, for: .normal)
        nSex = 2
    }
    
    func showWarningMessage(_ warningString: String) {
        showMessage("경고", warningString, Theme.warning)
    }
    
    func showMessage(_ titleString: String, _ msgString: String, _ theme: Theme) {
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(theme)
        view.configureContent(title: titleString, body: msgString)
        view.button?.isHidden = true
        
        var config = SwiftMessages.Config()
        config.presentationContext = .viewController(self.navigationController == nil ? self:self.navigationController!)
        config.duration = .forever
        config.dimMode = .gray(interactive: true)
        config.interactiveHide = false
        config.preferredStatusBarStyle = .lightContent
        config.eventListeners.append() { event in
            if case .didHide = event { print("yep") }
        }
        
        SwiftMessages.show(config: config, view: view)
    }

    
}

extension SignUpViewController {
    fileprivate func prepareTermsAndCondition() {
        let termsCustomType = ActiveType.custom(pattern: "\\s이용약관\\b")
        
        termLabel.enabledTypes.append(termsCustomType)
        
        
        termLabel.customColor[termsCustomType] = beautyTheme.Colors.beautyColor
        termLabel.customSelectedColor[termsCustomType] = UIColor.green
        
        termLabel.text = "이용약관 동의합니다."
        
        termLabel.handleCustomTap(for: termsCustomType) { element in
            print("Custom type tapped: \(element)")
        }

    }
    
    fileprivate func prepareTextFields() {
        
        // Setting the visibilityIconButton color.
        passwordTextField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordTextField.isSecureTextEntry ? 0.38 : 0.54)
    }
}

extension SignUpViewController: TextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == displayNameTextField {
            let _ = emailTextField.becomeFirstResponder()
        }
        if textField == emailTextField {
            let _ = passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            let _ = passconfirmField.becomeFirstResponder()
        }
        else {
            displayNameTextField.resignFirstResponder()
            passconfirmField.resignFirstResponder()
            emailTextField?.resignFirstResponder()
            passwordTextField?.resignFirstResponder()
        }
        
        return true
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            (textField as? ErrorTextField)?.isErrorRevealed = !isValidEmail(str: textField.text!)
        }
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            (textField as? ErrorTextField)?.isErrorRevealed = !isValidEmail(str: textField.text!)
        }
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            (textField as? ErrorTextField)?.isErrorRevealed = !isValidEmail(str: textField.text!)
        }
        return true
    }
    
    func isValidEmail(str:String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: str)
        return result
    }
}

