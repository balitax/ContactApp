//
//  AddFormContactTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

enum ListMenuType: String {
    case firstname = "Firstname"
    case lastname = "Lastname"
    case mobile = "Mobile"
    case email = "Email"
}

struct AddFormContactTableViewCellViewModel: CellRepresentable {
    
    var value: String?
    var listType: ListMenuType?
    
    init(listType: ListMenuType?) {
        self.listType = listType
    }
    
    var type: String = {
        return AddContactCellType.form.rawValue
    }()
    
}
