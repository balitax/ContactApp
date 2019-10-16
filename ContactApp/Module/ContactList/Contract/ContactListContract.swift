//  
//  ContactListContract.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol ContactListView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: ContactListPresentation! { get set }
    func configureView(with state: ViewStateKind)
}

protocol ContactListPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: ContactListView! { get set }
    var interactor: ContactListUseCase! { get set }
    var router: ContactListWireframe! { get set }
    
    func getContactList()
    
    func selectedContact(_ index: IndexPath) -> ContactStorage
    func presentDetailContact(data: ContactStorage)
    
}

protocol ContactListUseCase: class {
    // TODO: Declare use case methods
    var output: ContactListInteractorOutput! { get set }
    func getContactList()
}

protocol ContactListInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onContactLoaded(data: [ContactStorage])
    func onError(error: Error)
}

protocol ContactListWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    func presentDetailContact(data: ContactStorage, from view: PresentableView)
    static func assembleModule() -> UIViewController
}

