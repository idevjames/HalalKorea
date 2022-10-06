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
    private let coordinator: QiblaCoordinator
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialize
    init(viewModel: QiblaViewModel, coordinator: QiblaCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}
