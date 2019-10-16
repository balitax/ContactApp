//  
//  ContactDetailContract.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol ContactDetailView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: ContactDetailPresentation! { get set }
    func configureView(with state: ViewStateKind)
}

protocol ContactDetailPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: ContactDetailView! { get set }
    var interactor: ContactDetailUseCase! { get set }
    var router: ContactDetailWireframe! { get set }
    
    func getDetailContact()
    func deleteContact()
}

protocol ContactDetailUseCase: class {
    // TODO: Declare use case methods
    var output: ContactDetailInteractorOutput! { get set }
    func getDetailContact(id: Int)
    func deleteContact(id: Int)
}

protocol ContactDetailInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onDetailContactLoaded(data: ContactDetailResponse)
    func onContactDeleted()
    func onError(error: Error)
}

protocol ContactDetailWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    func popViewController(from view: PresentableView)
    static func assembleModule(_ data: ContactStorage) -> UIViewController
}

