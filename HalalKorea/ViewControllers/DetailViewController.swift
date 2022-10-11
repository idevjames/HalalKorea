//
//  DetailViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/10/10.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture
import RxViewController
import SnapKit
import Then
import Kingfisher

class DetailViewController: UIViewController {
    // MARK: - Varibles
    private let viewModel: DetailViewModel
    private let disposeBag = DisposeBag()
    private let model: AnyObject
    private let descriptionLabelHeight: CGFloat = 50.0

    // MARK: - UI Components
    private lazy var scrollView = UIScrollView()
    private lazy var containerView = UIView().then {
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
        $0.font = .systemFont(ofSize: 11)
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        $0.layer.cornerRadius = descriptionLabelHeight / 2
        $0.leftPadding = 20.0
        $0.rightPadding = 10.0
    }
    
    private lazy var snsStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    private lazy var youtubeImageView = UIImageView().then {
        $0.image = Asset.Images.icYoutube.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var instagramImageView = UIImageView().then {
        $0.image = Asset.Images.icInstagram.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var naverImageView = UIImageView().then {
        $0.image = Asset.Images.icNaverblog.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10.0
    }
    
    private lazy var directionButton = UIButton().then {
        $0.setTitle("Get Directions", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.backgroundColor = Asset.Colors.primaryGreen.color
    }
        
    // MARK: - Initialize
    init(viewModel: DetailViewModel, model: AnyObject) {
        self.viewModel = viewModel
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
        bindUI()
        bindViewModel()
    }
    
    private func bindUI() {
        
    }
    
    private func bindViewModel() {
        let output = viewModel.transform(
            DetailViewModel.Input(
                model: Observable.just(model)
            )
        )
        
        output.accommodationModel
            .asDriverComplete()
            .drive(onNext: { [weak self] in
                self?.configureAccommodation(model: $0)
            })
            .disposed(by: disposeBag)
    }
    
    private func configureAccommodation(model: AccommodationModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.title
        
        model.contents.forEach {
            contentStackView.addArrangedSubview(DetailContentView(content: $0))
        }
    }
}

// MARK: - UI & Layouts
extension DetailViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Details"
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(mainImageView)
        containerView.addSubview(descriptionLabel)
        
        containerView.addSubview(snsStackView)
        snsStackView.addArrangedSubview(UIView())
        snsStackView.addArrangedSubview(youtubeImageView)
        snsStackView.addArrangedSubview(UIView())
        snsStackView.addArrangedSubview(instagramImageView)
        snsStackView.addArrangedSubview(UIView())
        snsStackView.addArrangedSubview(naverImageView)
        snsStackView.addArrangedSubview(UIView())
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(directionButton)
    }
    
    private func setLayouts() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
        }
        
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
        
        snsStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(snsStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        
        directionButton.snp.makeConstraints { make in
            make.top.equalTo(contentStackView.snp.bottom).offset(5)
            make.leading.trailing.bottomMargin.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
}
