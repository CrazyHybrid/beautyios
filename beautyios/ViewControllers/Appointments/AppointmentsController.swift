//
//  Appointments.swift
//  beautyios
//
//  Created by Michael on 6/20/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class AppointmentsController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var shadowView: UIView!
    let blueInstagramColor = UIColor(red: 58/255.0, green: 198/255.0, blue: 172/255.0, alpha: 1.0)
    let selBarBackColor = UIColor(red: 74/255.0, green: 77/255.0, blue: 84/255.0, alpha: 1.0)
    let BarBackColor = UIColor(red: 87/255.0, green: 96/255.0, blue: 105/255.0, alpha: 1.0)
    let BarTitleColor = UIColor(red: 171/255.0, green: 170/255.0, blue: 168/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = selBarBackColor
        settings.style.buttonBarItemBackgroundColor = BarBackColor
        settings.style.selectedBarBackgroundColor = beautyTheme.Colors.beautyColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 17)
        settings.style.selectedBarHeight = 6.0
        settings.style.buttonBarMinimumLineSpacing = 2
        settings.style.buttonBarItemTitleColor = .white
        
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = self?.BarTitleColor
            newCell?.label.textColor = .white
        }
        super.viewDidLoad()
    }
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = AppointmentsCreateTab(itemInfo: "예약하기")
        let child_2 = AppointmentsPastAppointmentsTab(itemInfo: "지난 예약")
        let child_3 = AppointmentsCanceledAppointmentsTab(itemInfo: "취소된 예약")
        return [child_1, child_2, child_3]
    }
    
    // MARK: - Custom Action
    
    @IBAction func onClickNotiButton(_ sender: Any) {
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
