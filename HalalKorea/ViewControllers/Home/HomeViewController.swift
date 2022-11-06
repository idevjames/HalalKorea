//
//  HomeViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/07/14.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture
import RxViewController
import SnapKit
import Then

protocol HomeViewControllerDelegate {
    
}

class HomeViewController: UIViewController {
    // MARK: - Variables
    private let viewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    private let stackViewSpacing: CGFloat = 10.0
    private let stackViewOffset: CGFloat = 10.0
    
    // MARK: - UI Components
    private let rightBarButton = UIButton().then {
        $0.setImage(
            Asset.Images.commonChatbot.image.aspectFitImage(
                inRect: CGRect(x: 0.0,
                               y: 0.0,
                               width: 30.0,
                               height: 30.0)),
            for: .normal
        )
    }
    
    private lazy var compassImageView = UIImageView().then {
        $0.image = Asset.Images.compassImg.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var welcomeImageView = UIImageView().then {
        $0.image = Asset.Images.icWelcome.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = stackViewSpacing
    }
    
    private lazy var firstRowStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = stackViewSpacing
    }
    
    private lazy var secondRowStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = stackViewSpacing
    }
    
    private lazy var prayerTimeButton = UIImageView().then {
        $0.image = Asset.Images.btnPrayerTime.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var lunchBoxButton = UIImageView().then {
        $0.image = Asset.Images.btnLunchBox.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var miceTourButton = UIImageView().then {
        $0.image = Asset.Images.btnMiceTour.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var metaverseButton = UIImageView().then {
        $0.image = Asset.Images.btnMetaverse.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var storeButton = UIImageView().then {
        $0.image = Asset.Images.btnStore.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var accommodationButton = UIImageView().then {
        $0.image = Asset.Images.btnAccommodation.image
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Initialize
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setLayouts()
        bindUI()
        bindViewModel()
    }
    
    private func bindUI() {
        // Binding Button Event
        Observable.merge(
            prayerTimeButton.rx.tapGesture().when(.recognized),
            lunchBoxButton.rx.tapGesture().when(.recognized),
            miceTourButton.rx.tapGesture().when(.recognized),
            metaverseButton.rx.tapGesture().when(.recognized),
            storeButton.rx.tapGesture().when(.recognized),
            accommodationButton.rx.tapGesture().when(.recognized)
        )
        .compactMap { $0.view?.tag }
        .asDriverComplete()
        .drive(onNext: { [weak self] in self?.moveToChild(tag: $0) })
        .disposed(by: disposeBag)
        
        rightBarButton.rx.tap
            .bind {
                print("tap home")
            }
            .disposed(by: disposeBag)
    }
        
    private func bindViewModel() {
//        let output = viewModel.transform(HomeViewModel.Input())
    }
    
    private func moveToChild(tag: Int) {
        
        switch tag {
        case 111: // prayer time
            moveToPrayerTime()
            
        case 222: // lunchBox
            moveToLunchBox()
            
        case 333: // miceTour
            moveToMiceTour()
            
        case 444: // metaverse
            moveToMetaverse("https://naver.com")
            
        case 555: // store
            moveToStore()
            
        case 666: // accommodation
            moveToAccommodationViewController()
            
        default:
            break
        }
    }
    
    // MARK: - Routings
    private func moveToPrayerTime() {
        guard let navigations = tabBarController?.viewControllers as? [UINavigationController] else { return }
        
        for (index, navigation) in navigations.enumerated() {
            if let viewController = navigation.viewControllers.first {
                if viewController is QiblaViewController {
                    tabBarController?.selectedIndex = index
                }
            }
        }
    }
    
    private func moveToLunchBox() {
        guard let navigations = tabBarController?.viewControllers as? [UINavigationController] else { return }
        
        for (index, navigation) in navigations.enumerated() {
            if let viewController = navigation.viewControllers.first {
                if viewController is LunchBoxViewController {
                    tabBarController?.selectedIndex = index
                }
            }
        }
    }
    
    private func moveToMiceTour() {
        let miceTourViewController = MiceTourViewController()
        self.navigationController?.pushViewController(miceTourViewController, animated: true)
    }
    
    private func moveToMetaverse(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    private func moveToStore() {
        let storeViewController = StoreViewController()
        self.navigationController?.pushViewController(storeViewController, animated: true)
    }
    
    private func moveToAccommodationViewController() {
        let accommodationViewController = AccommodationViewController(viewModel: AccommodationViewModel())
        self.navigationController?.pushViewController(accommodationViewController, animated: true)
    }
}

// MARK: - UI & Layouts
extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        prayerTimeButton.tag = 111
        lunchBoxButton.tag = 222
        miceTourButton.tag = 333
        metaverseButton.tag = 444
        storeButton.tag = 555
        accommodationButton.tag = 666
        
        navigationItem.titleView = setNavigationTitleView()

        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = .init(customView: rightBarButton)
        view.addSubview(compassImageView)
        view.addSubview(welcomeImageView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(firstRowStackView)
        
        firstRowStackView.addArrangedSubview(prayerTimeButton)
        firstRowStackView.addArrangedSubview(lunchBoxButton)
        firstRowStackView.addArrangedSubview(miceTourButton)
        
        stackView.addArrangedSubview(secondRowStackView)
        
        secondRowStackView.addArrangedSubview(metaverseButton)
        secondRowStackView.addArrangedSubview(storeButton)
        secondRowStackView.addArrangedSubview(accommodationButton)
    }
    
    private func setLayouts() {
        compassImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        welcomeImageView.snp.makeConstraints { make in
            make.top.equalTo(compassImageView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(20)
        }
            
        stackView.snp.makeConstraints { make in
            make.top.equalTo(welcomeImageView.snp.bottom).offset(stackViewOffset)
            make.leading.trailing.equalToSuperview().inset(stackViewOffset)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(stackViewOffset)
        }
        
        let stackViewHeight = (UIScreen.main.bounds.width - (stackViewOffset * 2) - (stackViewSpacing * 2)) / 3
        
        firstRowStackView.snp.makeConstraints { make in
            make.height.equalTo(stackViewHeight)
        }
        
        secondRowStackView.snp.makeConstraints { make in
            make.height.equalTo(stackViewHeight)
        }
    }
}
