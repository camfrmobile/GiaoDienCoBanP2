//
//  AppDelegate.swift
//  GiaoDienCoBanP2
//
//  Created by Trần Văn Cam on 06/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // khai bao cua so
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstViewController = FirstViewController()
        window?.rootViewController = firstViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

