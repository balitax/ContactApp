//
//  HeaderContactDetailTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct HeaderContactDetailTableViewCellViewModel: CellRepresentable {
    
    var imageContact: String?
    var firstname: String?
    var lastname: String?
    
    init(imageContact: String?, firstname: String?, lastname: String?) {
        self.imageContact = imageContact
        self.firstname = firstname
        self.lastname = lastname
    }
    
    var type: String = {
        return ContactDetailCellType.header.rawValue
    }()
    
}
