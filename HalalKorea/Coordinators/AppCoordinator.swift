//
//  AppCoordinator.swift
//  HalalKorea
//
//  Created by 🌟 행 on 2022/09/27.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let window: UIWindow?
    
    init(_ window: UIWindow?) {
        self.window = window
        window?.makeKeyAndVisible()
    }
    
    func start() {
        let tabBarController = setTabBarController()
        self.window?.rootViewController = tabBarController
    }
    
    private func setTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.parentCoordinator = self
        childCoordinators.append(homeCoordinator)
        let homeNavigation = homeCoordinator.startPush()
        homeNavigation.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
        let kHalalCoordinator = KHalalCoordinator()
        kHalalCoordinator.parentCoordinator = self
        childCoordinators.append(homeCoordinator)
        let kHalalNavigation = kHalalCoordinator.startPush()
        kHalalNavigation.tabBarItem = UITabBarItem(title: "K-Halal", image: nil, tag: 0)
        
        let QiblaCoordinator = QiblaCoordinator()
        QiblaCoordinator.parentCoordinator = self
        childCoordinators.append(QiblaCoordinator)
        let qiblaNavigation = QiblaCoordinator.startPush()
        qiblaNavigation.tabBarItem = UITabBarItem(title: "Qibla", image: nil, tag: 0)
        
        let lunchBoxCoordinator = LunchBoxCoordinator()
        lunchBoxCoordinator.parentCoordinator = self
        childCoordinators.append(lunchBoxCoordinator)
        let lunchBoxNavigation = lunchBoxCoordinator.startPush()
        lunchBoxNavigation.tabBarItem = UITabBarItem(title: "Lunch", image: nil, tag: 0)
        
        tabBarController.viewControllers = [homeNavigation, kHalalNavigation, qiblaNavigation, lunchBoxNavigation]
        
        return tabBarController
    }
}

