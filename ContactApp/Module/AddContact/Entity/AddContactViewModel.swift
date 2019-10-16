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
                .header,
                .firstname,
                .lastname,
                .mobile,
                .email
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .header:
            return HeaderAddImageTableViewCellViewModel()
        case .firstname:
            return AddFormContactTableViewCellViewModel(listType: .firstname)
        case .lastname:
            return AddFormContactTableViewCellViewModel(listType: .lastname)
        case .mobile:
            return AddFormContactTableViewCellViewModel(listType: .mobile)
        case .email:
            return AddFormContactTableViewCellViewModel(listType: .email)
        }
    }
    
}
