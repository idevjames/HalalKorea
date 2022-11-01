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
    private let stackViewSpacing: CGFloat = 20.0
    private let stackViewOffset: CGFloat = 40.0
    
    // MARK: - UI Components
    private lazy var navigationView = CustomNavigationTitleView()
    private lazy var compassImageView = UIImageView().then {
        $0.image = Asset.Images.compassImg.image
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var welcomeImageView = UIImageView().then {
        $0.image = Asset.Images.welcomeToHalalKorea.image
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
    
    private lazy var prayerTimeButton = ImageButton(frame: .zero, type: .prayerTime)
    private lazy var lunchBoxButton = ImageButton(frame: .zero, type: .lunchBox)
    private lazy var miceTourButton = ImageButton(frame: .zero, type: .miceTour)
    private lazy var metaverseButton = ImageButton(frame: .zero, type: .metaverse)
    private lazy var storeButton = ImageButton(frame: .zero, type: .store)
    private lazy var accommodationButton = ImageButton(frame: .zero, type: .accommodation)
    
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
        
        // Image Resizing
        self.rx.viewDidAppear
            .filter { $0 }
            .asDriverComplete()
            .drive(onNext: { [weak self] _ in
                self?.prayerTimeButton.imageResizing()
                self?.lunchBoxButton.imageResizing()
                self?.miceTourButton.imageResizing()
                self?.metaverseButton.imageResizing()
                self?.storeButton.imageResizing()
                self?.accommodationButton.imageResizing()
            })
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
        
        navigationItem.titleView = navigationView
        
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
        navigationView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
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
