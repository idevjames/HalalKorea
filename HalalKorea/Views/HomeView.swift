//
//  HomeView.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/03.
//

import Foundation
import UIKit

class HomeView: BaseView {
    // MARK: - UI Components
    private let imageStackView = UIStackView().then {
        $0.alignment = .fill
        $0.axis = .vertical
    }
    
    private let compassImageView = UIImageView().then {
        $0.image = Asset.Images.Icon.iconCompass.image
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomImageview = UIImageView().then {
        $0.image = Asset.Images.Home.welcome.image
        $0.contentMode = .scaleAspectFit
    }
    
    override func setProperties() {
        
    }
    
    override func setLayouts() {
        
    }
}
