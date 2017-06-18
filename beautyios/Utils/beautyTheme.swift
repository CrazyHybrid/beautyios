//
//  beautyTheme.swift
//  beautyios
//
//  Created by Michael on 6/18/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: 58 / 255.0,
            green: 198 / 255.0,
            blue: 172 / 255.0,
            alpha: alpha
        )
    }
}

class beautyTheme {
    struct Colors {
        static let beautyColor = UIColor(colorWithHexValue: 0x3AC6AC)
    }
}
