//
//  ContactListsTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct ContactListsTableViewCellViewModel: CellRepresentable {
    
    init() {
    }
    
    var type: String = {
        return ContactListCellType.list.rawValue
    }()
    
}
