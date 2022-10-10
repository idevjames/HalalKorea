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
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
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
    
    public func imageResizing() {
        imageView.image = imageView.image?.aspectFitImage(inRect: imageView.frame)
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        backgroundView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleImageView)
        
        switch type! {
        case .prayerTime:
            imageView.image = Asset.Images.prayerImg.image
            titleImageView.image = Asset.Images.prayerTime.image
            
        case .lunchBox:
            imageView.image = Asset.Images.lunchImg.image
            titleImageView.image = Asset.Images.lunchBox.image
            
        case .miceTour:
            imageView.image = Asset.Images.miceImg.image
            titleImageView.image = Asset.Images.miceTour.image
            
        case .metaverse:
            imageView.image = Asset.Images.metaImg.image
            titleImageView.image = Asset.Images.metaverse.image
            
        case .store:
            imageView.image = Asset.Images.storeImg.image
            titleImageView.image = Asset.Images.store.image
            
        case .accommodation:
            imageView.image = Asset.Images.accomImg.image
            titleImageView.image = Asset.Images.accommodation.image
        }
    }
    
    private func setLayouts() {
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
