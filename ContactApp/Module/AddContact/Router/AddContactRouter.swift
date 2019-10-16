//  
//  AddContactRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class AddContactRouter {

    weak var viewController: UIViewController?

}

extension AddContactRouter: AddContactWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = AddContactUI()
        let viewModel = AddContactViewModel()
        let router = AddContactRouter()
        let interactor = AddContactInteractor()
        
        
        let presenter = AddContactPresenter(view: view, viewModel: viewModel, interactor: interactor, wireframe: router)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
}
