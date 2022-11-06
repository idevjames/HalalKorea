//
//  ImageButton.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/06.
//

import UIKit

import SnapKit
import Then

enum ImageButtonType {
    case prayerTime
    case lunchBox
    case miceTour
    case metaverse
    case store
    case accommodation
}

class ImageButton: UIView {
    // MARK: - Variables
    private var type: ImageButtonType?
    
    // MARK: - UI Components
    private var backgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = Asset.Colors.primaryGray.color.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 10.0
        $0.layer.shadowColor = UIColor.darkGray.cgColor
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: -1.0, height: 5.0)
        $0.layer.shadowOpacity = 0.1
    }
        
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    init(frame: CGRect, type: ImageButtonType) {
        self.type = type
        
        super.init(frame: frame)
        
        setupUI()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setLayouts()
    }
    
    public func imageResizing() {
        imageView.image = imageView.image?.aspectFitImage(inRect: imageView.frame)
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        backgroundView.addSubview(imageView)
                
        switch type! {
        case .prayerTime:
            imageView.image = Asset.Images.btnPrayerTime.image
            
        case .lunchBox:
            imageView.image = Asset.Images.btnLunchBox.image
            
        case .miceTour:
            imageView.image = Asset.Images.btnMiceTour.image
            
        case .metaverse:
            imageView.image = Asset.Images.btnMetaverse.image
            
        case .store:
            imageView.image = Asset.Images.btnStore.image
            
        case .accommodation:
            imageView.image = Asset.Images.btnAccommodation.image
        }
    }
    
    private func setLayouts() {
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
