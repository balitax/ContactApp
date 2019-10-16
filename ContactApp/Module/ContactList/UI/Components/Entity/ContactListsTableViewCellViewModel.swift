//
//  ContactListsTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct ContactListsTableViewCellViewModel: CellRepresentable {
    
    var avatarURL: String?
    var firstname: String?
    var lastname: String?
    var isFavorite: Bool?
    
    init(avatarURL: String?, firstname: String?, lastname: String?, isFavorite: Bool?) {
        self.avatarURL = avatarURL
        self.firstname = firstname
        self.lastname = lastname
        self.isFavorite = isFavorite
    }
    
    var type: String = {
        return ContactListCellType.list.rawValue
    }()
    
}
