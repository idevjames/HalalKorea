//
//  KHalalCoordinator.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import UIKit

protocol KHalalCoordinatorProtocol {
    
}

class KHalalCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    private var khalalViewController: KHalalViewController!
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(khalalViewController, animated: true)
    }
    
    func startPush() -> UINavigationController {
        let viewModel = KHalalViewModel()
        khalalViewController = KHalalViewController(viewModel: viewModel, coordinator: self)
        navigationController.setViewControllers([khalalViewController], animated: false)
        
        return navigationController
    }
}
