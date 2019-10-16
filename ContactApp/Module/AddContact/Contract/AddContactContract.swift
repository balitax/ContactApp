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
    func configureView(with state: ViewStateKind)
}

protocol AddContactPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: AddContactView! { get set }
    var interactor: AddContactUseCase! { get set }
    var router: AddContactWireframe! { get set }
    
    func saveContact(firstname: String, lastname: String, phone: String, email: String, isfavorite: Bool)
}

protocol AddContactUseCase: class {
    // TODO: Declare use case methods
    var output: AddContactInteractorOutput! { get set }
    func saveContact(firstname: String, lastname: String, phone: String, email: String, isfavorite: Bool)
}

protocol AddContactInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onContacSaved()
    func onError(error: Error)
}

protocol AddContactWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

