//
//  LunchBoxCoordinator.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import UIKit

protocol LunchBoxCoordinatorProtocol {
    
}

class LunchBoxCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    private var lunchBoxViewController: LunchBoxViewController!
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(lunchBoxViewController, animated: true)
    }
    
    func startPush() -> UINavigationController {
        let viewModel = LunchBoxViewModel()
        lunchBoxViewController = LunchBoxViewController(viewModel: viewModel, coordinator: self)
        navigationController.setViewControllers([lunchBoxViewController], animated: false)
        
        return navigationController
    }
}
