//
//  UIColor+Extention.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/08/05.
//

import UIKit

extension UIColor {
    convenience init(rgb: Int, alpha: Double = 1.0) {
        let red = CGFloat((rgb >> 16) & 0xFF)
        let green = CGFloat((rgb >> 8) & 0xFF)
        let blue = CGFloat(rgb & 0xFF)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

