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
        $0.contentMode = .bottom
    }
    
    private lazy var titleImageView = UIImageView().then {
        $0.contentMode = .top
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
    
    private func setupUI() {
        addSubview(backgroundView)
        backgroundView.addSubview(imageView)
        backgroundView.addSubview(titleImageView)
        
        switch type! {
        case .prayerTime:
            imageView.image = Asset.Images.Icon.iconPrayerTime.image
            titleImageView.image = Asset.Images.Home.prayerTime.image
            
        case .lunchBox:
            imageView.image = Asset.Images.Icon.iconLunchBox.image
            titleImageView.image = Asset.Images.Home.lunchBox.image
            
        case .miceTour:
            imageView.image = Asset.Images.Icon.iconMice.image
            titleImageView.image = Asset.Images.Home.miceTour.image
            
        case .metaverse:
            imageView.image = Asset.Images.Icon.iconMetaverse.image
            titleImageView.image = Asset.Images.Home.metaverse.image
            
        case .store:
            imageView.image = Asset.Images.Icon.iconStore.image
            titleImageView.image = Asset.Images.Home.store.image
            
        case .accommodation:
            imageView.image = Asset.Images.Icon.iconAccommodation.image
            titleImageView.image = Asset.Images.Home.accommodation.image
        }
    }
    
    private func setLayouts() {
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.58)
        }
        
        titleImageView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.42)
        }
    }
}
