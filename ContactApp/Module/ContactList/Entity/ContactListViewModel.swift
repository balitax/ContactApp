//
//  ContactListViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class ContactListViewModel {
    
    
    var contact = [ContactStorage]()
    
    private(set) var items: [[CommonContactListViewCellKind]] = []
    
    init() {
        items = [
            [
                .list,
                .list,
                .list,
                .list,
                .list,
                .list,
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .list:
            let index = indexPath.row
            if contact.isEmpty {
                return ContactListsTableViewCellViewModel(
                avatarURL: "",
                firstname: "",
                lastname: "",
                isFavorite: false)
            } else {
                return ContactListsTableViewCellViewModel(
                avatarURL: contact[index].profilePic,
                firstname: contact[index].firstName,
                lastname: contact[index].lastName,
                isFavorite: contact[index].favorite)
            }
        }
    }
    
    func createItems() {
        var listContact: [CommonContactListViewCellKind] = []
        
        for _ in contact {
            listContact.append(.list)
        }
        
        items.removeAll()
        items.append(listContact)
    }
    
}
