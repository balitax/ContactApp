//
//  ListDetailContactTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

enum ListMenuContact: String {
    case mobile = "Mobile"
    case email = "Email"
}

struct ListDetailContactTableViewCellViewModel: CellRepresentable {
    
    var value: String?
    var listType: ListMenuContact?
    
    init(listType: ListMenuContact,value: String?) {
        self.listType = listType
        self.value = value
    }
    
    var type: String = {
        return ContactDetailCellType.list.rawValue
    }()
    
}
