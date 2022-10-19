//
//  DetailContentView.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/11.
//

import UIKit

import SnapKit
import Then
import ReadMoreTextView

class DetailContentView: UIView {
    // MARK: - UI Components
    private lazy var hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }
    
    private lazy var vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    private lazy var imageView = UIImageView().then {
        $0.image = content.image
        $0.contentMode = .top
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = content.title
        $0.font = .systemFont(ofSize: 13)
    }
    
    private lazy var contentView = ReadMoreTextView().then {
        $0.text = content.content.withoutHtml()
        $0.maximumNumberOfLines = 4
        $0.shouldTrim = true
        
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13),
            .foregroundColor: UIColor.blue
        ]
        
        $0.attributedReadMoreText = .init(string: "... read all", attributes: attrs)
        $0.attributedReadLessText = .init(string: "less", attributes: attrs)
    }
    
    // MARK: - Variables
    private let content: DetailContent
    
    init(content: DetailContent) {
        self.content = content
        
        super.init(frame: .zero)
        
        setupUI()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(hStackView)
        hStackView.addArrangedSubview(imageView)
        hStackView.addArrangedSubview(vStackView)
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(contentView)
        
        // 이미지 사이즈 조절
        imageView.image = imageView.image?.aspectFitImage(inRect: .init(x: 0, y: 0, width: 30, height: 30))
    }
    
    private func setLayouts() {
        hStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
    }
}
