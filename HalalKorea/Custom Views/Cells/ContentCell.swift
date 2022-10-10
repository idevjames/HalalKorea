//
//  ContentCell.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/10.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class ContentCell: UITableViewCell {
    static public let identifier = "ContentCell"
    
    // MARK: - Variables
    private let descriptionLabelHeight: CGFloat = 50.0

    // MARK: - UI Components
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var mainImageView = UIImageView().then {
        $0.image = Asset.Images.imgNo.image
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var descriptionLabel = CustomLabel().then {
        $0.text = ""
        $0.numberOfLines = 0
        $0.backgroundColor = Asset.Colors.primaryGreen.color.withAlphaComponent(0.7)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 11)
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        $0.layer.cornerRadius = descriptionLabelHeight / 2
        $0.leftPadding = 20.0
        $0.rightPadding = 10.0
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Methods
    public func configure(model: AnyObject?) {
        guard let model = model as? AccommodationModel else { return }
        
        descriptionLabel.text = model.title
        
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL)
        }
    }
    
    // MARK: - Private Methods
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

extension ContentCell {
    private func setupUI() {
        self.selectionStyle = .none
        
        addSubview(containerView)
        containerView.addSubview(mainImageView)
        containerView.addSubview(descriptionLabel)
    }
    
    private func setLayouts() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
            mainImageView.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(200)
            }
            
            descriptionLabel.snp.makeConstraints { make in
                make.height.equalTo(descriptionLabelHeight)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview().inset(30)
                make.bottom.equalTo(mainImageView.snp.bottom).inset(30)
            }
        }
    }
}
