//
//  AddContactViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class AddContactViewModel {
    
    
    private(set) var items: [[CommonAddContactViewCellKind]] = []
    
    init() {
        items = [
            [
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
    }
    
    func createItems() {
        let header: [CommonAddContactViewCellKind] = []
        
        items.removeAll()
        items.append(header)
    }
    
}
