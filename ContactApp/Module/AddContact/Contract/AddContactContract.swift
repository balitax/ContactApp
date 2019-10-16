//  
//  AddContactContract.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol AddContactView: PresentableView {
    // TODO: Declare view methods
    var presenter: AddContactPresentation! { get set }
}

protocol AddContactPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: AddContactView! { get set }
    var interactor: AddContactUseCase! { get set }
    var router: AddContactWireframe! { get set }
    
    func viewDidLoad()
}

protocol AddContactUseCase: class {
    // TODO: Declare use case methods
    var output: AddContactInteractorOutput! { get set }
}

protocol AddContactInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol AddContactWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

