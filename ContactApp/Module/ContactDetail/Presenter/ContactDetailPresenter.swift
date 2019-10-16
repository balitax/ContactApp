//  
//  ContactDetailPresenter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// ContactDetailPresenter
class ContactDetailPresenter {
    // TODO: Declare view methods
    var view: ContactDetailView!
    var viewModel: ContactDetailViewModel!
    var router: ContactDetailWireframe!
    var interactor: ContactDetailUseCase!
    
    init(view: ContactDetailView, viewModel: ContactDetailViewModel, interactor: ContactDetailUseCase, wireframe: ContactDetailWireframe) {
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = wireframe
    }
    
}

extension ContactDetailPresenter: ContactDetailPresentation {
    
    func getDetailContact() {
        interactor.getDetailContact(id: viewModel.contact.id)
    }
    
    func deleteContact() {
        interactor.deleteContact(id: viewModel.contact.id)
    }
    
    func sendMessameContact() {
        router.sendMessage(to: viewModel.detail?.phoneNumber ?? "", from: view)
    }
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return self.viewModel.getItem(at: indexPath)
    }
    
}

extension ContactDetailPresenter: ContactDetailInteractorOutput {
    
    func onContactDeleted() {
        self.router.popViewController(from: view)
    }
    
    func onDetailContactLoaded(data: ContactDetailResponse) {
        viewModel.detail = data
        self.view.configureView(with: .success)
    }
    
    func onError(error: Error) {
        self.view.configureView(with: .error(description: error.localizedDescription))
    }
    
}
