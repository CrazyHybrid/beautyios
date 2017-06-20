//
//  AppointmentsCanceledAppointmentsTab.swift
//  beautyios
//
//  Created by Michael on 6/20/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class AppointmentsCanceledAppointmentsTab : UIViewController, IndicatorInfoProvider
{
    
    
    var itemInfo: IndicatorInfo = "View"
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
