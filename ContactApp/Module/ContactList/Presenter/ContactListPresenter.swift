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
    
    func viewDidLoad() {  }
    
}

extension ContactListPresenter: ContactListInteractorOutput {
    
}
