//
//  HomeCoordinator.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import UIKit

protocol HomeCoordinatorProtocol {
    
}

class HomeCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    private var homeViewController: HomeViewController!
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func startPush() -> UINavigationController {
        let viewModel = HomeViewModel()
        homeViewController = HomeViewController(viewModel: viewModel, coordinator: self)
        navigationController.setViewControllers([homeViewController], animated: false)
        
        return navigationController
    }
}
