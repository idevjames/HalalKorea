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
        
    }
    
    private func bindViewModel() {
        
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
