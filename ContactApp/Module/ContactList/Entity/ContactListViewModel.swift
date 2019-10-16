//
//  ContactListViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class ContactListViewModel {
    
    
    private(set) var items: [[CommonSuperGroupViewCellKind]] = []
    
    init() {
        items = [
            [
                .list
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .list:
            return ContactListsTableViewCellViewModel()
        }
    }
    
}
