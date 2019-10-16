//  
//  ContactListRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class ContactListRouter {

    weak var viewController: UIViewController?

}

extension ContactListRouter: ContactListWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = ContactListUI()
        let viewModel = ContactListViewModel()
        let router = ContactListRouter()
        let interactor = ContactListInteractor()
        
        
        let presenter = ContactListPresenter(view: view, viewModel: viewModel, interactor: interactor, wireframe: router)
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    func presentDetailContact(data: ContactStorage, from view: PresentableView) {
        let detail = ContactDetailRouter.assembleModule(data)
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.pushViewController(detail, animated: true)
        }
    }
    
}
