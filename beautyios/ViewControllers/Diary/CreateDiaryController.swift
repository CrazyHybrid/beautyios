//
//  CreateDiaryController.swift
//  beautyios
//
//  Created by Michael on 6/23/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit


class CreateDiaryController: UIViewController
{
    
    var clockView: CustomTimePicker = CustomTimePicker()
    
    @IBOutlet weak var titleDiary: UILabel!
    @IBOutlet weak var NotiLabel: UILabel!
    
    var diaryNum: Int = 0
    var diaryTitle: String = ""
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleDiary.text = diaryTitle
        
        if diaryNum == 1{
            
        } else if diaryNum == 2 {
            
        } else if diaryNum == 3 {
            
        } else if diaryNum == 4 {
            
        } else if diaryNum == 5 {
            
        }
        
    }
    
    @IBAction func onClickBack(_ sender: Any) {
    }
    
    @IBAction func onClickNotification(_ sender: Any) {
    }
    
    
    
    @IBAction func onClickSleepStart(_ sender: Any) {
        
        clockView = CustomTimePicker(view: self.view, withDarkTheme: false)
//        clockView.delegate = self as! CustomTimePickerDelegate as! CustomTimePickerDelegate
        
    }
    
    @IBAction func onClickSleepEnd(_ sender: Any) {
    }
    
    @IBAction func onClickRegisterSleep(_ sender: Any) {
    }
    
    
}

extension CreateDiaryController{
    
}

