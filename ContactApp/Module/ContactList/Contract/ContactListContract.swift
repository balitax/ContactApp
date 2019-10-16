//  
//  ContactListContract.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol ContactListView: PresentableView {
    // TODO: Declare view methods
    var presenter: ContactListPresentation! { get set }
}

protocol ContactListPresentation: class {
    // TODO: Declare presentation methods
    var view: ContactListView! { get set }
    var interactor: ContactListUseCase! { get set }
    var router: ContactListWireframe! { get set }
    
    func viewDidLoad()
}

protocol ContactListUseCase: class {
    // TODO: Declare use case methods
    var output: ContactListInteractorOutput! { get set }
}

protocol ContactListInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol ContactListWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

