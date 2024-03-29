//  
//  AddContactPresenter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// AddContactPresenter
class AddContactPresenter {
    // TODO: Declare view methods
    var view: AddContactView!
    var viewModel: AddContactViewModel!
    var router: AddContactWireframe!
    var interactor: AddContactUseCase!
    
    init(view: AddContactView, viewModel: AddContactViewModel, interactor: AddContactUseCase, wireframe: AddContactWireframe) {
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = wireframe
    }
    
}

extension AddContactPresenter: AddContactPresentation {
    
    func saveContact(firstname: String, lastname: String, phone: String, email: String, isfavorite: Bool) {
        interactor.saveContact(firstname: firstname, lastname: lastname, phone: phone, email: email, isfavorite: isfavorite)
    }
    
    func numberOfSection() -> Int {
        viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return viewModel.getItem(at: indexPath)
    }
    
}

extension AddContactPresenter: AddContactInteractorOutput {
    
    func onContacSaved() {
        self.view.configureView(with: .success)
    }
    
    func onError(error: Error) {
        self.view.configureView(with: .error(description: error.localizedDescription))
    }
    
    
}
