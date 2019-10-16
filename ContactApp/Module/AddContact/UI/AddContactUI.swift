//  
//  AddContactUI.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class AddContactUI: UIViewController {

    var presenter: AddContactPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}


extension AddContactUI: AddContactView {
    
}


