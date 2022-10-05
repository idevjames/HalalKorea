//
//  BaseView.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/03.
//

import UIKit

import SnapKit
import Then

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setProperties()
        setLayouts()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setProperties() {
        
    }
    
    func setLayouts() {
        
    }
}
