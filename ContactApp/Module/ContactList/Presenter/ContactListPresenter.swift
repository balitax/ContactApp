//
//  ContactListPresenter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// ContactListPresenter
class ContactListPresenter {
    // TODO: Declare view methods
    var view: ContactListView!
    var viewModel: ContactListViewModel!
    var router: ContactListWireframe!
    var interactor: ContactListUseCase!
    
    init(view: ContactListView, viewModel: ContactListViewModel, interactor: ContactListUseCase, wireframe: ContactListWireframe) {
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = wireframe
    }
    
    
}

extension ContactListPresenter: ContactListPresentation {
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return self.viewModel.getItem(at: indexPath)
    }
    
    func getContactList() {
        interactor.getContactList()
    }
    
    func selectedContact(_ index: IndexPath) -> ContactStorage {
        return viewModel.contact[index.row]
    }
    
    func presentDetailContact(data: ContactStorage) {
        router.presentDetailContact(data: data, from: view)
    }
    
    func pushAddContact() {
        router.pushAddContact(from: view)
    }
    
}

extension ContactListPresenter: ContactListInteractorOutput {
    
    func onContactLoaded(data: [ContactStorage]) {
        viewModel.contact = data
        viewModel.createItems()
        self.view.configureView(with: .success)
    }
    
    func onError(error: Error) {
        if let data = Database.shared.get(type: ContactStorage.self) {
            viewModel.contact = Array(data)
            viewModel.createItems()
        }
        self.view.configureView(with: .error(description: error.localizedDescription))
    }
    
    
}
