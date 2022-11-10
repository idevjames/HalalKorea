//
//  LunchBoxCell.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/11/08.
//

import UIKit

import SnapKit
import Then
import Kingfisher


class LunchBoxCell: UITableViewCell {
    static public let identifier = "LunchBoxCell"
    
    // MARK: - Variables
    private let orderButtonHeight = 30.0
    private var model: LunchBoxModel!
    var orderButtonAction: ((LunchBoxModel) -> Void)?

    // MARK: - UI Components
    private lazy var containerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 5
    }
    
    private lazy var mainImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var lunchNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
    }
    
    private lazy var menuTitleLabel = UILabel().then {
        $0.text = "MENU"
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .darkGray
    }
    
    private lazy var mainStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private lazy var mainTitleLabel = UILabel().then {
        $0.text = "Main : "
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .darkGray
    }
    
    private lazy var mainMenuLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 0
        $0.textColor = .darkGray
    }
    
    private lazy var categoryMenuStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private lazy var categoryTitleLabel = UILabel().then {
        $0.text = "Category : "
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .darkGray
    }
    
    private lazy var categoryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 0
        $0.textColor = .darkGray
    }
    
    private lazy var priceTitleLabel = UILabel().then {
        $0.text = "PRICE"
        $0.font = .systemFont(ofSize: 13, weight: .bold)
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .darkGray
    }
    
    private lazy var orderButton = UIButton().then {
        $0.backgroundColor = Asset.Colors.primaryGreen.color
        $0.setTitle("      ORDER      ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        $0.layer.cornerRadius = orderButtonHeight / 2
        $0.addTarget(self, action: #selector(onClickOrderButton(_:)), for: .touchUpInside)
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
    public func configure(model: LunchBoxModel) {
        self.model = model
        
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        lunchNameLabel.text = model.lunchName
        mainMenuLabel.text = model.menu
        categoryLabel.text = model.category
        priceLabel.text = model.price
    }
    
    // MARK: - Private Methods
    @objc private func onClickOrderButton(_ sender: UIButton) {
        orderButtonAction?(self.model)
    }
}

extension LunchBoxCell {
    private func setupUI() {
        self.selectionStyle = .none
        
        contentView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(mainImageView)
        containerStackView.addArrangedSubview(lunchNameLabel)
        containerStackView.addArrangedSubview(menuTitleLabel)
        
        containerStackView.addArrangedSubview(mainStackView)
        mainStackView.addArrangedSubview(mainTitleLabel)
        mainStackView.addArrangedSubview(mainMenuLabel)
        
        containerStackView.addArrangedSubview(categoryMenuStackView)
        categoryMenuStackView.addArrangedSubview(categoryTitleLabel)
        categoryMenuStackView.addArrangedSubview(categoryLabel)
        
        containerStackView.addArrangedSubview(priceTitleLabel)
        containerStackView.addArrangedSubview(priceLabel)
        
        contentView.addSubview(orderButton)
    }
    
    private func setLayouts() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
        
        lunchNameLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
        }
        
        mainMenuLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
        }
        
        categoryTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
        }
        
        orderButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(orderButtonHeight)
        }
    }
}
