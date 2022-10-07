//
//  ListCell.swift
//  HalalKorea
//
//  Created by cw-james on 2022/10/07.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class ListCell: UITableViewCell {
    static public let identifier = "ListCell"
    
    // MARK: - UI Components
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var mainImageView = UIImageView().then {
        $0.image = Asset.Images.Logos.splashHalalLogo.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var descriptionLabel = CustomLabel().then {
        $0.text = "NONO"
        $0.numberOfLines = 0
        $0.backgroundColor = Asset.Colors.primaryGreen.color.withAlphaComponent(0.7)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        $0.layer.cornerRadius = descriptionLabelHeight / 2
        $0.leftPadding = 30
        $0.rightPadding = 10.0
    }
    
    private lazy var iconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5.0
    }
    
    private lazy var distanceImageView = UIImageView().then {
        $0.image = Asset.Images.Icon.iconMice.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var distanceLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .darkGray
    }
    
    private lazy var youtubeImageView = UIImageView().then {
        $0.image = Asset.Images.Icon.iconMice.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var instagramImageView = UIImageView().then {
        $0.image = Asset.Images.Icon.iconMice.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var naverImageView = UIImageView().then {
        $0.image = Asset.Images.Icon.iconMice.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var certLabel = CustomLabel().then {
        $0.text = "Korea Quality"
        $0.backgroundColor = .black
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        $0.layer.cornerRadius = stackViewHeight / 2
        $0.leftPadding = 10.0
        $0.rightPadding = 5.0
    }
    
    // MARK: - Variables
    private let stackViewHeight: CGFloat = 30.0
    private let descriptionLabelHeight: CGFloat = 50.0
    
    // MARK: - Initializes
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setLayotus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    public func configure(model: AnyObject?) {
        guard let model = model as? AccommodationModel else { return }
        
        let imageURL = findImage(imageURLs: [model.imageURL1,
                                                   model.imageURL2,
                                                   model.imageURL3,
                                                   model.imageURL4,
                                                   model.imageURL5])
        descriptionLabel.text = model.title
        
        if let imageURL = imageURL {
            mainImageView.kf.setImage(with: imageURL)
        }
        
        distanceLabel.text = "19.492 km"
        certLabel.isHidden = model.invisible
    }
    
    /// 가장 먼저 데이터가 있는 URL로 이미지를 호출
    private func findImage(imageURLs: [String]) -> URL? {
        for imageURL in imageURLs {
            if !imageURL.isEmpty, let url = URL(string: imageURL) {
                return url
            }
        }
        
        return nil
    }
}

extension ListCell {
    private func setupUI() {
        self.selectionStyle = .none
        
        addSubview(containerView)
        containerView.addSubview(mainImageView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(iconStackView)
        
        iconStackView.addArrangedSubview(distanceImageView)
        iconStackView.addArrangedSubview(distanceLabel)
        iconStackView.addArrangedSubview(youtubeImageView)
        iconStackView.addArrangedSubview(instagramImageView)
        iconStackView.addArrangedSubview(naverImageView)
        iconStackView.addArrangedSubview(UIView())
        iconStackView.addArrangedSubview(certLabel)
    }
    
    private func setLayotus() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(230)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(descriptionLabelHeight)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(mainImageView.snp.bottom).inset(30)
        }
        
        iconStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(stackViewHeight)
        }
        
        distanceImageView.snp.makeConstraints { make in
            make.width.equalTo(stackViewHeight)
        }
        
        distanceLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        youtubeImageView.snp.makeConstraints { make in
            make.width.equalTo(stackViewHeight)
        }
        
        instagramImageView.snp.makeConstraints { make in
            make.width.equalTo(stackViewHeight)
        }
        
        naverImageView.snp.makeConstraints { make in
            make.width.equalTo(stackViewHeight)
        }
        
        certLabel.snp.makeConstraints { make in
            make.width.equalTo(certLabel.intrinsicContentSize.width)
        }
    }
}
