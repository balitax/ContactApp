//
//  ContactDetailViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class ContactDetailViewModel {
    
    
    var contact = ContactStorage()
    var detail: ContactDetailResponse?
    
    private(set) var items: [[CommonContactDetailViewCellKind]] = []
    
    init() {
        items = [
            [
                .header,
                .mobile,
                .email
            ],
            [
                .delete
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .header:
            return HeaderContactDetailTableViewCellViewModel(imageContact: contact.profilePic, firstname: contact.firstName, lastname: contact.lastName)
        case .mobile:
            return ListDetailContactTableViewCellViewModel(listType: .mobile, value: detail?.phoneNumber)
        case .email:
            return ListDetailContactTableViewCellViewModel(listType: .email, value: detail?.email)
        case .delete:
            return DeleteContactTableViewCellViewModel()
        }
    }
    
    
}
