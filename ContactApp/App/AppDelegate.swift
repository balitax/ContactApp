//
//  AppDelegate.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        let viewController = ContactListRouter.assembleModule()
        window?.rootViewController = viewController
        
        return true
    }


}

