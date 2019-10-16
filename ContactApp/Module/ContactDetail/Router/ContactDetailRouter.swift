//  
//  ContactDetailRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class ContactDetailRouter {

    weak var viewController: UIViewController?

}

extension ContactDetailRouter: ContactDetailWireframe {
    
    static func assembleModule(_ data: ContactStorage) -> UIViewController {
        
        let view = ContactDetailUI()
        let viewModel = ContactDetailViewModel()
        let router = ContactDetailRouter()
        let interactor = ContactDetailInteractor()
        
        viewModel.contact = data
        
        let presenter = ContactDetailPresenter(
            view: view,
            viewModel: viewModel,
            interactor: interactor,
            wireframe: router)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
    func popViewController(from view: PresentableView) {
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
}
