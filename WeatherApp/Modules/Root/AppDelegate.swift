//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Abanoub Nabil on 8/7/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Attributes
    
    var window: UIWindow?
    
    // MARK: - Application Life Cycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }

    // MARK: - Methods
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CityForcastListRouter.assembleModule()
        window?.makeKeyAndVisible()
    }
}
