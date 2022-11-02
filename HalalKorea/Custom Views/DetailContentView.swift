//
//  DetailContentView.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/11.
//

import UIKit

import SnapKit
import Then

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
    
    private lazy var contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var contentTextView = UITextView().then {
        $0.text = content.content.withoutHtml()
        $0.textContainer.maximumNumberOfLines = 4
        $0.textContainer.lineBreakMode = .byTruncatingTail
        $0.isScrollEnabled = false
        $0.dataDetectorTypes = .link
        $0.isEditable = false
        $0.isSelectable = true
    }
    
    private lazy var viewMoreLessButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13)
        $0.addTarget(self, action: #selector(onClickViewMoreLessButton(_:)), for: .touchUpInside)
        $0.isHidden = true
    }
    
    // MARK: - Variables
    private let content: DetailContent
    
    init(content: DetailContent) {
        self.content = content
        
        super.init(frame: .zero)
        
        setupUI()
        setLayouts()
        
        contentTextView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 더보기 버튼 구현
        guard let fontHeight = contentTextView.font?.lineHeight else { return }
        
        let textInset = contentTextView.textContainerInset
        let lineCount = (contentTextView.contentSize.height - textInset.top - textInset.bottom) / fontHeight
        
        if lineCount <= 4 {
            viewMoreLessButton.isHidden = true
        } else {
            viewMoreLessButton.isHidden = false
            viewMoreLessButton.setTitle("..read all", for: .normal)
        }
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(hStackView)
        hStackView.addArrangedSubview(imageView)
        hStackView.addArrangedSubview(vStackView)
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(contentView)
        contentView.addSubview(contentTextView)
        contentView.addSubview(viewMoreLessButton)
        
        // 이미지 사이즈 조절
        imageView.image = imageView.image?.aspectFitImage(inRect: .init(x: 0, y: 0, width: 30, height: 30))
    }
    
    private func setLayouts() {
        hStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().offset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
        
        viewMoreLessButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(9)
            make.height.equalTo(13)
        }
    }
    
    @objc private func onClickViewMoreLessButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            contentTextView.textContainer.maximumNumberOfLines = 0
            contentTextView.invalidateIntrinsicContentSize()
            viewMoreLessButton.setTitle(" less", for: .normal)
        } else {
            contentTextView.textContainer.maximumNumberOfLines = 4
            contentTextView.invalidateIntrinsicContentSize()
            viewMoreLessButton.setTitle("..read all", for: .normal)
        }
    }
}

extension DetailContentView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

        return UIApplication.shared.canOpenURL(URL)
    }
}
