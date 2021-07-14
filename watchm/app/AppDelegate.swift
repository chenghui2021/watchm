//
//  AppDelegate.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let keyWindow = window {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "homeController") as? HomeController
                else {return false}
            let navigationController = UINavigationController(rootViewController: viewController)
            viewController.modalPresentationStyle = .formSheet
            if #available(iOS 13.0, *) {
                viewController.isModalInPresentation = true
            } else {
                // Fallback on earlier versions
            }
            keyWindow.rootViewController = navigationController
            keyWindow.makeKeyAndVisible()
        }
        return true
    }
}

