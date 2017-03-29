//
//  AppCoordinator.swift
//  Auto Stop Race
//
//  Created by Robert Ignasiak on 16.02.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import RxReachability
import ReachabilitySwift

final class AppCoordinator: Coordinator {
    let serviceProvider = ServiceProvider()
    let reachability = Reachability()

    func start() {
        try? reachability?.startNotifier()
        
        serviceProvider.authService.validateToken()
        
        let coordinator = DashboardCoordinator(navigationController: navigationController, appCoordinator: self, serviceProvider: serviceProvider)
        coordinator.start()
        childCoordinators.append(coordinator)
    
        let menuCoordinator = MenuCoordinator(navigationController: navigationController, appCoordinator: self, serviceProvider: serviceProvider)
        menuCoordinator.start()
    }
    
    func dashboardCoordinatorCompleted(coordinator: DashboardCoordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}



extension AppCoordinator: SettingsViewControllerDelegate {
    
    func logoutButtonTapped() {
        serviceProvider.userDefaultsService.clearAuth()
        self.serviceProvider.authService.logout()
        _ = self.navigationController?.popViewController(animated: false)
        let coordinator = DashboardCoordinator(navigationController: navigationController, appCoordinator: self, serviceProvider: serviceProvider)
        coordinator.start()
    }
    
}

