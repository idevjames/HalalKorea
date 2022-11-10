//
//  LunchBoxDetailViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/11/09.
//

import UIKit

import SnapKit
import Then

class LunchBoxDetailViewController: UIViewController {
    // MARK: - Varibles
    private let model: LunchBoxModel
    private let phoneNumber = "070-4888-0222"

    // MARK: - UI Components
    private lazy var callButton = UIButton().then {
        $0.setImage(Asset.Images.icDet8.image.withTintColor(Asset.Colors.primaryGreen.color), for: .normal)
        $0.addTarget(self, action: #selector(onClickCallButton(_:)), for: .touchUpInside)
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
    }
    
    private lazy var mainLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private lazy var bankLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private lazy var phoneLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private lazy var kakaoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }

    // MARK: - Initialize
    init(model: LunchBoxModel) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setLayouts()
        setProperty()
    }
    
    private func setProperty() {
        mainLabel.text = "Bank transger(payment in advance)\nCash on delivery"
        bankLabel.text = "NH Bank : 301-2057-951841\nHALAL KOREA CO.ltd\n"
        phoneLabel.text = "Phone : \(phoneNumber)"
        kakaoLabel.text = "Kakao : helloasean"
    }
    
    // MARK: - Private Methods
    @objc private func onClickCallButton(_ sender: UIButton) {
        let phoneNumber = phoneNumber.replacingOccurrences(of: "-", with: "")
        if let phoneNumberURL = URL(string: "tel://\(phoneNumber)") {
            if UIApplication.shared.canOpenURL(phoneNumberURL) {
                UIApplication.shared.open(phoneNumberURL, options: [:], completionHandler: nil)
            }
        }
    }
}

// MARK: - UI & Layouts
extension LunchBoxDetailViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Lunch Box"
        
        view.addSubview(callButton)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(bankLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(kakaoLabel)
        stackView.addArrangedSubview(UIView())
    }
    
    private func setLayouts() {
        callButton.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.7)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(callButton.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
