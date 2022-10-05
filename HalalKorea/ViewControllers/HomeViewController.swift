//
//  HomeViewController.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/07/14.
//

import UIKit
import RxSwift
import RxCocoa
import FSPagerView

protocol HomeViewControllerDelegate {
    
}

class HomeViewController: BaseViewController<HomeViewModel, HomeCoordinator> {
    // MARK: - Variables
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .red
    }
    
    override func setupUI() {
        view.addSubview(homeView)
    }
    
    override func bindViewModel() {
        
    }
}
