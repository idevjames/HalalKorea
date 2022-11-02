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
    private lazy var mainStackview = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.isScrollEnabled = true
        $0.isUserInteractionEnabled = true
        $0.showsVerticalScrollIndicator = false
    }
    
    private lazy var containerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 10
    }
    
    private lazy var mainImageContainerView = UIView().then {
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
    
    private lazy var bottomButton = UIButton().then {
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
            .filter { $0.objectId != nil }
            .asDriverComplete()
            .drive(onNext: { [weak self] in
                self?.configureAccommodation(model: $0)
            })
            .disposed(by: disposeBag)

        output.lunchBoxModel
            .filter { $0.objectId != nil }
            .asDriverComplete()
            .drive(onNext: { [weak self] in
                self?.configureLunchBox(model: $0)
            })
            .disposed(by: disposeBag)

        output.storeModel
            .filter { $0.objectId != nil }
            .asDriverComplete()
            .drive(onNext: { [weak self] in
                self?.configureStore(model: $0)
            })
            .disposed(by: disposeBag)
        
        output.miceTourModel
            .filter { $0.objectId != nil }
            .asDriverComplete()
            .drive(onNext: { [weak self] in
                self?.configureMiceTour(model: $0)
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
        
        snsStackView.isHidden = false
        bottomButton.isHidden = true
    }
    
    private func configureLunchBox(model: LunchBoxModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.lunchName
        
        model.contents.forEach {
            contentStackView.addArrangedSubview(DetailContentView(content: $0))
        }

        snsStackView.isHidden = true
        bottomButton.isHidden = false
        bottomButton.setTitle("Order", for: .normal)
    }
    
    private func configureStore(model: StoreModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.name
        
        model.contents.forEach {
            contentStackView.addArrangedSubview(DetailContentView(content: $0))
        }
        
        snsStackView.isHidden = true
        bottomButton.isHidden = false
        bottomButton.setTitle("Direction", for: .normal)
    }
    
    private func configureMiceTour(model: MiceTourModel) {
        if let imageURL = model.mainImage {
            mainImageView.kf.setImage(with: imageURL, placeholder: Asset.Images.imgNo.image)
        }
        
        descriptionLabel.text = model.name
        
        model.contents.forEach {
            contentStackView.addArrangedSubview(DetailContentView(content: $0))
        }
        
        snsStackView.isHidden = true
        bottomButton.isHidden = true
    }
}

// MARK: - UI & Layouts
extension DetailViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Details"
        
        view.addSubview(mainStackview)
        
        mainStackview.addArrangedSubview(scrollView)
        mainStackview.addArrangedSubview(bottomButton)
        
        scrollView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(mainImageContainerView)
        mainImageContainerView.addSubview(mainImageView)
        mainImageContainerView.addSubview(descriptionView)
        descriptionView.addSubview(descriptionLabel)
        
        containerStackView.addArrangedSubview(snsStackView)
        snsStackView.addArrangedSubview(UIView())
        snsStackView.addArrangedSubview(youtubeImageView)
        snsStackView.addArrangedSubview(UIView())
        snsStackView.addArrangedSubview(instagramImageView)
        snsStackView.addArrangedSubview(UIView())
        snsStackView.addArrangedSubview(naverImageView)
        snsStackView.addArrangedSubview(UIView())
        
        containerStackView.addArrangedSubview(contentStackView)
    }
    
    private func setLayouts() {
        mainStackview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(scrollView.snp.width)
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
        
        snsStackView.snp.makeConstraints { make in
            make.height.equalTo(35)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
