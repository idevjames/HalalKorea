//
//  QiblaPrayViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/08/05.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture
import RxViewController
import Adhan

class QiblaViewController: UIViewController {
    // MARK: - Variables
    private let viewModel: QiblaViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    private lazy var navigationView = CustomNavigationTitleView()
    
    // MARK: - Initialize
    init(viewModel: QiblaViewModel) {
        self.viewModel = viewModel
        
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
        print("========== dubai params")
        print(getQiblaTime(.dubai))
        print()
        
        print("========== other params")
        print(getQiblaTime(.other))
        print()
        
        print("========== egyptian params")
        print(getQiblaTime(.egyptian))
        print()
        
        print("========== karachi params")
        print(getQiblaTime(.karachi))
        print()
        
        print("========== moonsightingcommitte params")
        print(getQiblaTime(.moonsightingCommittee))
        print()
        
        print("========== global league params")
        print(getQiblaTime(.muslimWorldLeague))
        print()
    }
    
    private func bindViewModel() {
        
    }
    
    private func getQiblaTime(_ params: CalculationMethod) {
        let coordinates = Coordinates(latitude: 51.508515, longitude: -0.1254872)
        let cal = Calendar(identifier: .gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let prayers = PrayerTimes(coordinates: coordinates,
                                  date: date,
                                  calculationParameters: params.params)
        
        if let prayers = prayers {
            let formatter = DateFormatter()
            formatter.timeStyle = .full
            formatter.timeZone = TimeZone(identifier: "KST")
            
            print("fajr \(formatter.string(from: prayers.fajr))")
            print("sunrise \(formatter.string(from: prayers.sunrise))")
            print("dhuhr \(formatter.string(from: prayers.dhuhr))")
            print("asr \(formatter.string(from: prayers.asr))")
            print("maghrib \(formatter.string(from: prayers.maghrib))")
            print("isha \(formatter.string(from: prayers.isha))")
        }
    }
}

// MARK: - UI & Layouts
extension QiblaViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.titleView = navigationView
    }
    
    private func setLayouts() {
        navigationView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
