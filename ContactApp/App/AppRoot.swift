//
//  AppRoot.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

struct AppRoot {
    
    static func root(_ window: UIWindow?) {
        window?.makeKeyAndVisible()
        let viewController = ContactListRouter.assembleModule()
        window?.rootViewController = viewController
    }
    
}
