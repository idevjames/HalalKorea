//
//  QiblaCoordinator.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import UIKit

protocol QiblaCoordinatorProtocol {
    
}

class QiblaCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    private var qiblaViewController: QiblaViewController!
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(qiblaViewController, animated: true)
    }
    
    func startPush() -> UINavigationController {
        let viewModel = QiblaViewModel()
        qiblaViewController = QiblaViewController(viewModel: viewModel, coordinator: self)
        
        navigationController.setViewControllers([qiblaViewController], animated: false)
        
        return navigationController
    }
}
