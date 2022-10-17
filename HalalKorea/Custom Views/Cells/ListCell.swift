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
    
    // MARK: - Variables
    private let stackViewHeight: CGFloat = 40.0
    private let descriptionLabelHeight: CGFloat = 50.0

    // MARK: - UI Components
    private lazy var containerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private lazy var mainContentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var mainImageView = UIImageView().then {
        $0.image = Asset.Images.imgNo.image
        $0.contentMode = .scaleToFill
    }
    
    private lazy var descriptionLabel = CustomLabel().then {
        $0.text = ""
        $0.numberOfLines = 0
        $0.backgroundColor = Asset.Colors.primaryGreen.color.withAlphaComponent(0.7)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        $0.layer.cornerRadius = descriptionLabelHeight / 2
        $0.leftPadding = 20.0
        $0.rightPadding = 10.0
    }
    
    private lazy var iconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5.0
    }
    
    private lazy var distanceImageView = UIImageView().then {
        $0.image = Asset.Images.mapMarker.image.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: -5, bottom: -10, right: 0))
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var distanceLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 11)
        $0.textColor = .darkGray
    }
    
    private lazy var youtubeImageView = UIImageView().then {
        $0.image = Asset.Images.icYoutube.image.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: 0, bottom: -10, right: 0))
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var instagramImageView = UIImageView().then {
        $0.image = Asset.Images.icInstagram.image.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: 0, bottom: -10, right: 0))
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var naverImageView = UIImageView().then {
        $0.image = Asset.Images.icNaverblog.image.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: 0, bottom: -10, right: 0))
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var certLabel = CustomLabel().then {
        $0.text = "Korea Quality"
        $0.backgroundColor = .black
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        $0.layer.cornerRadius = stackViewHeight / 2
        $0.leftPadding = 10.0
        $0.rightPadding = 5.0
    }
    
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
        if let model = model as? AccommodationModel {
            makeAccommodation(model)
        } else if let model = model as? LunchBoxModel {
            makeLunchBox(model)
        }
    }
    
    // MARK: - Private Methods
    private func makeAccommodation(_ model: AccommodationModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL,
                                      placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.title
        distanceLabel.text = "19.492 km"
        certLabel.isHidden = model.invisible
    }
    
    private func makeLunchBox(_ model: LunchBoxModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL,
                                      placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.lunchName
        iconStackView.isHidden = true
        
        // cell spacing 처리
        let spacingView = UIView()
        containerStackView.addArrangedSubview(spacingView)
        
        spacingView.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
    }
}

extension ListCell {
    private func setupUI() {
        self.selectionStyle = .none
        
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(mainContentView)
        
        mainContentView.addSubview(mainImageView)
        mainContentView.addSubview(descriptionLabel)
        
        containerStackView.addArrangedSubview(iconStackView)
        
        iconStackView.addArrangedSubview(distanceImageView)
        iconStackView.addArrangedSubview(distanceLabel)
        iconStackView.addArrangedSubview(youtubeImageView)
        iconStackView.addArrangedSubview(instagramImageView)
        iconStackView.addArrangedSubview(naverImageView)
        iconStackView.addArrangedSubview(UIView())
        iconStackView.addArrangedSubview(certLabel)
    }
    
    private func setLayotus() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(mainImageView.snp.bottom).inset(30)
            make.height.equalTo(descriptionLabelHeight)
        }
        
        iconStackView.snp.makeConstraints { make in
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
