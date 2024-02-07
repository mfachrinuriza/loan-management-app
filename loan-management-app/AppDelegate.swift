//
//  AppDelegate.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    private let navigator = DI.get(Navigator.self)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigator.navigationController
        window?.makeKeyAndVisible()
        navigator.navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigator.navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigator.navigationController.navigationBar.tintColor = .white
        navigator.start()
        
        return true
    }
}

