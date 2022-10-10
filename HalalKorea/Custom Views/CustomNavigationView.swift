//
//  CustomNavigationTitleView.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/06.
//

import UIKit

import SnapKit
import Then

class CustomNavigationTitleView: UIView {
    // MARK: - UI Components
    private lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 20
    }
    
    lazy var mainImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = Asset.Images.homeHalalLogo.image
    }
    
    lazy var leftItem = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = Asset.Images.commonBar.image
    }
    
    lazy var rightItem = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = Asset.Images.commonChatbot.image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(leftItem)
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(rightItem)
    }
    
    private func setLayouts() {
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        leftItem.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.height)
        }
        
        rightItem.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.height)
        }
    }
}
