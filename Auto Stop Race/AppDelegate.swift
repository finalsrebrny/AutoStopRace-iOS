//
//  AppDelegate.swift
//  Auto Stop Race
//
//  Created by Robert Ignasiak on 16.02.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()

        let coordinator = AppCoordinator(navigationController: navigationController)
        
        coordinator.start()
        self.coordinator = coordinator

        setupView(application)
        return true
    }

    private func setupView(_ application: UIApplication) {
        setUpNavigationBar()
        application.statusBarStyle = .lightContent
    }
    
    private func setUpNavigationBar() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = Theme.Color.blueMenu
        UINavigationBar.appearance().tintColor = UIColor.white
    }
}

