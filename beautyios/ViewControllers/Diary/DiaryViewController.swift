//
//  DiaryViewController.swift
//  beautyios
//
//  Created by Michael on 6/22/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit

class DiaryViewController : UIViewController{
    
    var bClickAddState: Bool = false
    
    @IBOutlet weak var notiLabel: UILabel!
    
    @IBOutlet weak var emptyDiaryView: UIView!
    @IBOutlet weak var addDiaryView: UIView!
    @IBOutlet weak var mainDiaryView: UIView!
    
    @IBOutlet weak var switchAlarm: UISwitch!
    @IBOutlet weak var textAlarmLabel: UILabel!
    
    @IBOutlet weak var diaryTableView: UITableView!
    
    @IBOutlet weak var addDiaryButton: UIButton!
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emptyDiaryView.isHidden = false
        addDiaryView.isHidden = true
        mainDiaryView.isHidden = true
        
        bClickAddState = false
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)        
    }
    
    @IBAction func onClickNotification(_ sender: Any) {
    }
    
    @IBAction func onClickAddDiary(_ sender: Any) {
        
        if bClickAddState {
            addDiaryButton.setImage(UIImage(named : "ic_plus"), for: UIControlState.normal)
            
            addDiaryView.isHidden = true
            bClickAddState = false
            
        } else {
            addDiaryButton.setImage(UIImage(named : "ic_close_diary"), for: UIControlState.normal)
            
            addDiaryView.isHidden = false
            bClickAddState = true
        }
    }
    

    @IBAction func onClickAddFoodDiary(_ sender: Any) {
        
        let createDiaryVC = self.storyboard?.instantiateViewController(withIdentifier: "creatediaryVC") as! CreateDiaryController
        createDiaryVC.diaryNum = 1
        createDiaryVC.diaryTitle = "음식"
        self.navigationController?.pushViewController(createDiaryVC, animated: true)
        
    }
    
    
    @IBAction func onClickAddWeightDiary(_ sender: Any) {
        let createDiaryVC = self.storyboard?.instantiateViewController(withIdentifier: "creatediaryVC") as! CreateDiaryController
        createDiaryVC.diaryNum = 2
        createDiaryVC.diaryTitle = "체중"
        self.navigationController?.pushViewController(createDiaryVC, animated: true)
        
    }
    
    @IBAction func onClickAddSleepDiary(_ sender: Any) {
        let createDiaryVC = self.storyboard?.instantiateViewController(withIdentifier: "creatediaryVC") as! CreateDiaryController
        createDiaryVC.diaryNum = 3
        createDiaryVC.diaryTitle = "잠"
        self.navigationController?.pushViewController(createDiaryVC, animated: true)
        
    }
    
    @IBAction func onClickAddWorkoutDiary(_ sender: Any) {
        let createDiaryVC = self.storyboard?.instantiateViewController(withIdentifier: "creatediaryVC") as! CreateDiaryController
        createDiaryVC.diaryNum = 4
        createDiaryVC.diaryTitle = "물"
        self.navigationController?.pushViewController(createDiaryVC, animated: true)
        
    }
    
    @IBAction func onClickAddWaterDiary(_ sender: Any) {
        let createDiaryVC = self.storyboard?.instantiateViewController(withIdentifier: "creatediaryVC") as! CreateDiaryController
        createDiaryVC.diaryNum = 5
        createDiaryVC.diaryTitle = "운동"
        self.navigationController?.pushViewController(createDiaryVC, animated: true)

    }
    
}

extension DiaryViewController{
    
}
