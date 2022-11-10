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
    
    private lazy var descriptionView = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.textColor = .white
        $0.numberOfLines = 2
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
    
    private lazy var locationImageView = UIImageView().then {
        $0.image = Asset.Images.icDet6.image.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: -5, bottom: -10, right: 0))
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var locationLabel = UILabel().then {
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
        setLayouts()
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
        } else if let model = model as? StoreModel {
            makeStore(model)
        } else if let model = model as? MiceTourModel {
            makeMiceTour(model)
        }
    }
    
    // MARK: - Private Methods
    private func makeAccommodation(_ model: AccommodationModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.title
        distanceLabel.text = "19.492 km"
        certLabel.isHidden = model.invisible
        locationImageView.isHidden = true
        locationLabel.isHidden = true
    }
    
    private func makeStore(_ model: StoreModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.name
        iconStackView.isHidden = true
    }
    
    private func makeMiceTour(_ model: MiceTourModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        locationLabel.text = model.location
        descriptionLabel.text = model.name
        distanceImageView.isHidden = true
        distanceLabel.isHidden = true
        youtubeImageView.isHidden = true
        instagramImageView.isHidden = true
        naverImageView.isHidden = true
        certLabel.isHidden = true
    }
}

extension ListCell {
    private func setupUI() {
        self.selectionStyle = .none
        
        contentView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(mainContentView)
        
        mainContentView.addSubview(mainImageView)
        mainContentView.addSubview(descriptionView)
        descriptionView.addSubview(descriptionLabel)
        
        containerStackView.addArrangedSubview(iconStackView)
        
        iconStackView.addArrangedSubview(distanceImageView)
        iconStackView.addArrangedSubview(distanceLabel)
        iconStackView.addArrangedSubview(locationImageView)
        iconStackView.addArrangedSubview(locationLabel)
        iconStackView.addArrangedSubview(youtubeImageView)
        iconStackView.addArrangedSubview(instagramImageView)
        iconStackView.addArrangedSubview(naverImageView)
        iconStackView.addArrangedSubview(UIView())
        iconStackView.addArrangedSubview(certLabel)
        
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
    }
    
    private func setLayouts() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(descriptionLabelHeight)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalTo(10)
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
        
        locationImageView.snp.makeConstraints { make in
            make.width.equalTo(stackViewHeight)
        }
        
        locationLabel.snp.makeConstraints { make in
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
