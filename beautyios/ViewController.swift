//
//  ViewController.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit
import SwiftMessages
import RappleProgressHUD


class ViewController: UIViewController {

    let errorMsgTitle = "오유"
    let warningMsgTitle = "경고"
    let infoMsgTitle = "주의"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showErrorMsg(_ errorString: String) {
        showMessage(self.errorMsgTitle, errorString, Theme.error)
    }
    
    func showWarningMessage(_ warningString: String) {
        showMessage(self.warningMsgTitle, warningString, Theme.warning)
    }
    
    func showInfoMessage(_ infoString: String) {
        showMessage(self.infoMsgTitle, infoString, Theme.info)
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
    
    func showLoading(_ msg: String) {
        if msg.isEmpty {
            RappleActivityIndicatorView.startAnimating()
        }
        else {
            RappleActivityIndicatorView.startAnimatingWithLabel(msg)
        }
    }
    
    func hideLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
}

